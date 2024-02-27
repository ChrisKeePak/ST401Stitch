
(* ProblueFlex Function Block for ModbusTCP *)
FUNCTION_BLOCK FB_NDSN_MB_PBFlex_CtrlSts
//******************************************************************************************************************
//Reading Section
//******************************************************************************************************************
	IF IN_b_Enable THEN
		//***************
		//Predefinition
		//***************
		i_StartAddressInput := 0;
		i_StartAddressOutput := 1024;
		i_nrRegisters := 64;
		i_datasize := 128;
		
		//*************************************************
		//Constant read 64 words Input buffer
		//*************************************************
		FB_AcycRead(enable := TRUE,
		pStation:= ADR(IN_mb_station),
		startAddress := i_StartAddressInput,
		nrRegisters := i_nrRegisters,
		pData := ADR(IO_Input),
		dataSize := i_datasize);
		ui_AcycRdStatus := FB_AcycRead.status;
		
		Melter.b_r_SystemReady := IO_Input[0].0;
		Melter.b_r_Fault := IO_Input[0].1;
		Melter.b_r_Alert := IO_Input[0].2;
		Melter.b_r_Stop := IO_Input[0].3;

		Melter.b_r_HeatersOn := IO_Input[8].0;
		Melter.b_r_StandbyOn := IO_Input[8].1;
		Melter.b_r_TemperatureAlert := IO_Input[8].2;
		Melter.b_r_TemperatureFault := IO_Input[8].3;
		Melter.b_r_TemperatureReady := IO_Input[8].4;

		Melter.b_r_TankLevelEmpty := IO_Input[12].0;
		Melter.b_r_TankLevelLow := IO_Input[12].1;
		Melter.b_r_FillSysAlert := IO_Input[12].2;
		Melter.b_r_FillSysFault := IO_Input[12].3;
		Melter.b_r_Filling := IO_Input[12].4;
		Melter.b_r_LidOpen := IO_Input[12].5;
		Melter.b_r_PumpEnabled := IO_Input[4].1;
		Melter.b_r_PumpRunning := IO_Input[4].2;
		Melter.b_r_Purging := IO_Input[4].3;
		Melter.b_r_EmptyCalibrated := IO_Input[12].6;


		tm_Command(IN := Melter.b_w_CalibrateEmpty OR Melter.b_w_ClearAlertFault , PT:= T#500MS); 
		IF tm_Command.Q AND b_CommandTimerRising THEN
			Melter.b_w_ClearAlertFault :=0;
			Melter.b_w_CalibrateEmpty :=0;
		END_IF
		b_CommandTimerRising :=NOT tm_Command.Q;
		//Clear alert fault
		IO_Output[0].0 := Melter.b_w_ClearAlertFault;
		IO_Output[12].0 := Melter.b_w_ManualFill;
		IO_Output[4].3 := Melter.b_w_Purge;
		IO_Output[12].2 := Melter.b_w_CalibrateEmpty;
		
		//********************************************************************
		// Heater On Control Bit Logic
		//********************************************************************
		//***************************************************************************************
		// This section means if see the following edge of b_r_HeatOn, Turn off heater 
		//****************************************************************************************
		tm_HeaterOff(IN := NOT Melter.b_r_HeatersOn,
		PT := t#200ms);
		b_HeaterOff := tm_HeaterOff.Q;
		IF b_HeaterOff AND b_Temp1 THEN
			b_HeaterOn := 0;
		END_IF;
		b_Temp1 := NOT b_HeaterOff;
		//***********************************************************    
		// This section means if see the Rising edge of b_r_HeatOn
		// Then turn the heater on
		//***********************************************************    
		IF Melter.b_r_HeatersOn AND b_Temp2 THEN
			b_HeaterOn := 1;
		END_IF;
		b_Temp2 := NOT Melter.b_r_HeatersOn;
		//***************************************************
		//Turn ON or OFF based on status of Heater
		//***************************************************
		IF NOT Melter.b_r_HeatersOn AND Melter.b_w_HeatersOnOff THEN
			b_HeaterOn := 1;
		END_IF;
	
		IF Melter.b_r_HeatersOn AND Melter.b_w_HeatersOnOff THEN
			b_HeaterOn := 0;
		END_IF;
		IF Melter.b_r_Fault OR Melter.b_r_TemperatureFault THEN
			b_HeaterOn := 0;
		END_IF;
		//***************************************************************
		//Below logic is to prevent HeaterOn or HeaterOff stuck situation
		//***************************************************************
		tm_HeaterOnStuck(IN := (NOT Melter.b_r_HeatersOn) AND b_HeaterOn, PT:= T#3000MS); 
		b_HeaterOnStuck := tm_HeaterOnStuck.Q;

		tm_HeaterOffStuck(IN := Melter.b_r_HeatersOn AND NOT b_HeaterOn , PT:= T#3000MS); 
		b_HeaterOffStuck := tm_HeaterOffStuck.Q;

		IF b_HeaterOnStuck AND b_HeaterOn THEN 
			b_HeaterOn :=0;
			b_HeaterOnStuck:=0; 
		END_IF;
		IF b_HeaterOffStuck AND NOT b_HeaterOn THEN 
			b_HeaterOn :=1; 
			b_HeaterOffStuck:=0; 
		END_IF;
		//**********************************************************************
		//To generate the pulsing signal for b_w_HeatersOnOff, Turn it off here.
		//**********************************************************************
		IF Melter.b_w_HeatersOnOff THEN
			Melter.b_w_HeatersOnOff := 0;
		END_IF;
		IO_Output[8].0 := b_HeaterOn;
	
		//*************************************************************************************************************************
		//Pump Control Bit logic
		//*************************************************************************************************************************
		tm_PumpOff(IN := NOT Melter.b_r_PumpEnabled,
		PT := t#200ms);
		b_PumpOff := tm_PumpOff.Q;
		IF NOT Melter.b_r_PumpEnabled AND Melter.b_w_PumpOnOff AND NOT Melter.b_r_StandbyOn THEN
			b_PumpOn := 1;
		END_IF;
		IF Melter.b_r_PumpEnabled AND Melter.b_w_PumpOnOff THEN
			b_PumpOn := 0;
		END_IF;
		//******************************************************
		//Prevent turn pump on when in standby mode, othersise 
		//the b_pumpon bit will stay on
		//******************************************************
		IF Melter.b_r_StandbyOn OR b_HeaterOff OR Melter.b_r_Stop THEN
			b_PumpOn := 0;
		END_IF;
	
		//***********************************************************************************
		//This section is to set the pump on bit on when Melter pump is turned on by itself
		//***********************************************************************************
		IF Melter.b_r_PumpEnabled AND b_Temp3 THEN
			b_PumpOn := 1;
		END_IF;
		b_Temp3 := NOT Melter.b_r_PumpEnabled;
		IF b_PumpOff AND b_Temp4 THEN
			b_PumpOn := 0;
		END_IF;
		b_Temp4 := NOT b_PumpOff;
		//***************************************************************
		//Below logic is to prevent PumpOn or PumpOff stuck situation
		//***************************************************************
		tm_PumpOnStuck(IN := (NOT Melter.b_r_PumpEnabled) AND b_PumpOn, PT:= T#3000MS); 
		b_PumpOnStuck := tm_PumpOnStuck.Q;

		tm_PumpOffStuck(IN := (Melter.b_r_PumpEnabled) AND NOT b_PumpOn , PT:= T#3000MS); 
		b_PumpOffStuck := tm_PumpOffStuck.Q;

		IF b_PumpOnStuck AND b_PumpOn THEN 
			b_PumpOn :=0;
			b_PumpOnStuck:=0; 
		END_IF;
		IF b_PumpOffStuck AND NOT b_PumpOn THEN 
			b_PumpOn :=1; 
			b_PumpOffStuck:=0; 
		END_IF; 
		//**********************************************************************
		//To generate the pulsing signal for b_w_PumpOnOff, Turn it off here.
		//**********************************************************************
		IF Melter.b_w_PumpOnOff THEN
			Melter.b_w_PumpOnOff := 0;
		END_IF;
		IO_Output[4].1 := b_PumpOn;

		//********************************************************************************************************************************
		//Standby Logic
		//********************************************************************************************************************************
		tm_StandbyOff(IN := NOT Melter.b_r_StandbyOn,
		PT := t#200ms);
		b_StandbyOff := tm_StandbyOff.Q;
		IF b_StandbyOff AND b_Temp5 THEN
			b_StandbyOn := 0;
		END_IF;
		b_Temp5 := NOT b_StandbyOff;
	
		IF Melter.b_r_StandbyOn AND b_Temp6 THEN
			b_StandbyOn := 1;
		END_IF;
		b_Temp6 := NOT Melter.b_r_StandbyOn;
	
		IF b_HeaterOff OR Melter.b_r_Fault THEN
			b_StandbyOn := 0;
		END_IF;
		//*****************************************************************************
		//This section is to determine the standby output based on the status of melter
		//with the rising edge standby on command b_w_StandbyOnOff.
		//*****************************************************************************
		IF (Melter.b_r_HeatersOn OR Melter.b_r_TemperatureReady) AND (NOT Melter.b_r_StandbyOn) AND (Melter.b_w_StandbyOnOff) THEN
			b_StandbyOn := 1;
		END_IF;
	
		IF (Melter.b_r_StandbyOn) AND (Melter.b_w_StandbyOnOff) THEN
			b_StandbyOn := 0;
		END_IF;
		//Below logic is to prevent StandbyOn or StandbyOff stuck situation
		tm_StandbyOnStuck(IN := (NOT Melter.b_r_StandbyOn) AND b_StandbyOn , PT:= T#3000MS); 
		b_StandbyOnStuck := tm_StandbyOnStuck.Q;

		tm_StandbyOffStuck(IN := Melter.b_r_StandbyOn AND NOT b_StandbyOn, PT:= T#3000MS); 
		b_StandbyOffStuck := tm_StandbyOffStuck.Q;
		IF b_StandbyOnStuck AND b_StandbyOn THEN 
			b_StandbyOn :=0;
			b_StandbyOnStuck:=0; 
		END_IF;
		IF b_HeaterOffStuck AND NOT b_StandbyOn THEN 
			b_StandbyOn :=1; 
			b_StandbyOffStuck:=0; 
		END_IF;
		//**********************************************************************
		//To generate the pulsing signal for b_w_PumpOnOff, Turn it off here.
		//**********************************************************************
		IF Melter.b_w_StandbyOnOff THEN
			Melter.b_w_StandbyOnOff := 0;
		END_IF;
		IO_Output[8].1 := b_StandbyOn;
		
		FB_AcycWrite(enable := TRUE,
			pStation:= ADR(IN_mb_station),
			startAddress := i_StartAddressOutput,
			nrRegisters := i_nrRegisters,
			pData := ADR(IO_Output),
			dataSize := i_datasize);
			ui_AcycWtStatus := FB_AcycWrite.status;
	END_IF;	
END_FUNCTION_BLOCK
