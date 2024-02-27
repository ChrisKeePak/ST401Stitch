
(* TODO: Add your comment here *)
FUNCTION_BLOCK FB_NDSN_MB_PBFlex_Process
IF IN_b_Enable THEN	
	st_ADI_List[0].ui_ADI :=11682;st_ADI_List[0].ui_Size := 18;//Temperature Setpoint Aggregate(Read/Write)
	st_ADI_List[1].ui_ADI :=11683;st_ADI_List[1].ui_Size :=18;//Activate zones(Read/Write)
	st_ADI_List[2].ui_ADI :=10853;st_ADI_List[2].ui_Size := 1;//Global Standby Delta(Read/Write)
	st_ADI_List[3].ui_ADI :=10855;st_ADI_List[3].ui_Size := 1;//Manusl Standby Duration(Read/Write)
	st_ADI_List[4].ui_ADI :=10858;st_ADI_List[4].ui_Size := 1;//Auto Enter Standby Time(Read/Write)
	st_ADI_List[5].ui_ADI :=10859;st_ADI_List[5].ui_Size := 1;//Auto Heater Off Time(Read/Write)
	st_ADI_List[6].ui_ADI :=10860;st_ADI_List[6].ui_Size := 1;///Auto Standby Source(Read/Write)
	st_ADI_List[7].ui_ADI :=11376;st_ADI_List[7].ui_Size := 1;//Under Temperature Delta(Read/Write)
	st_ADI_List[8].ui_ADI :=11378;st_ADI_List[8].ui_Size := 1;//Over Temperature Delta(Read/Write)
	st_ADI_List[9].ui_ADI :=10002;st_ADI_List[9].ui_Size := 1;//Temperature Unit	(Read/Write)
	st_ADI_List[10].ui_ADI :=10547;st_ADI_List[10].ui_Size := 1;//Global Temperature Setpoint(Read/Write)
	st_ADI_List[11].ui_ADI :=10549;st_ADI_List[11].ui_Size := 1;//Global Hose Setpoint(Read/Write)
	st_ADI_List[12].ui_ADI :=10548;st_ADI_List[12].ui_Size := 1;//Global Gun Setpoint(Read/Write)
	st_ADI_List[13].ui_ADI :=6102;st_ADI_List[13].ui_Size := 1;//Pressure Unit(Read/Write)
	st_ADI_List[14].ui_ADI :=6203;st_ADI_List[14].ui_Size := 2;//Pressure Setpoint(Read/Write)
	st_ADI_List[15].ui_ADI :=6946;st_ADI_List[15].ui_Size := 2;//Max Pressure limit(Read/Write)
	st_ADI_List[16].ui_ADI :=7046;st_ADI_List[16].ui_Size := 2;//Min Pressure Limit(Read/Write)
	st_ADI_List[17].ui_ADI :=7148;st_ADI_List[17].ui_Size := 2;//Under Pressure Delta(Read/Write)
	st_ADI_List[18].ui_ADI :=7248;st_ADI_List[18].ui_Size := 2;//Over Pressure Delta(Read/Write)
	st_ADI_List[19].ui_ADI :=7146;st_ADI_List[19].ui_Size := 1;//Enable Pressure High low Limit(Read/Write)
	st_ADI_List[20].ui_ADI :=7147;st_ADI_List[20].ui_Size := 1;//Enable Hydraulic Scaling(Read/Write)
	st_ADI_List[21].ui_ADI :=13017;st_ADI_List[21].ui_Size := 1;//Enable Fill(Read/Write)
	st_ADI_List[22].ui_ADI :=13003;st_ADI_List[22].ui_Size := 1;//Target Fill Level(Read/Write)
	st_ADI_List[23].ui_ADI :=13008;st_ADI_List[23].ui_Size := 1;//Max Fill Time(Read/Write)
	st_ADI_List[24].ui_ADI :=13009;st_ADI_List[24].ui_Size := 1;//Alert Stop Delay Time(Read/Write)
	st_ADI_List[25].ui_ADI :=13010;st_ADI_List[25].ui_Size := 1;//Low Level Threshold(Read/Write)
	st_ADI_List[26].ui_ADI :=13012;st_ADI_List[26].ui_Size := 1;//Lid Open Alert Time(Read/Write)
	st_ADI_List[27].ui_ADI :=13018;st_ADI_List[27].ui_Size := 1;//Alert Stop Delay Time(Read/Write)
	st_ADI_List[28].ui_ADI :=801;st_ADI_List[28].ui_Size := 1;//Enable Auto Pump(Read/Write)
	st_ADI_List[29].ui_ADI :=19;st_ADI_List[29].ui_Size := 1;//Temperature Ready Delay Time(Read/Write)
	st_ADI_List[30].ui_ADI :=22;st_ADI_List[30].ui_Size := 1;//Mass Unit(Read/Write)
	st_ADI_List[31].ui_ADI :=11681;st_ADI_List[31].ui_Size := 18;//Actual Temperature(Read Only)
	st_ADI_List[32].ui_ADI :=11685;st_ADI_List[32].ui_Size := 18;//Temperature Status(Read Only)
	st_ADI_List[33].ui_ADI :=6103;st_ADI_List[33].ui_Size := 2;//Actual Pressure Value(Read Only)
	st_ADI_List[34].ui_ADI :=6002;st_ADI_List[34].ui_Size := 1;//Pressure Sensor Alarm(Read Only)
	st_ADI_List[35].ui_ADI :=13002;st_ADI_List[35].ui_Size := 1;//Actual Fill Level(Read Only)	
	st_ADI_List[36].ui_ADI :=29;st_ADI_List[36].ui_Size := 1;//Current Fault Code(Read Only)
	st_ADI_List[37].ui_ADI :=13;st_ADI_List[37].ui_Size := 1;//Software Version(Read Only)
	st_ADI_List[38].ui_ADI :=16;st_ADI_List[38].ui_Size := 2;//Operation Hours(Read Only)
	st_ADI_List[39].ui_ADI :=30;st_ADI_List[39].ui_Size := 4;//Inventory	(Read Only)
		
	//System Inventory
	Melter.st_r_Devices.b_r_TempCtrl_Board1 := Melter.i_r_Gen_arr_SysInventory[0].0;
	Melter.st_r_Devices.b_r_TempCtrl_Board2 := Melter.i_r_Gen_arr_SysInventory[0].1;
	Melter.st_r_Devices.b_r_TempCtrl_Board3 := Melter.i_r_Gen_arr_SysInventory[0].2;
	Melter.st_r_Devices.b_r_TempCtrl_Board4 := Melter.i_r_Gen_arr_SysInventory[0].3;
	Melter.st_r_Devices.b_r_OEM_Unit:= Melter.i_r_Gen_arr_SysInventory[0].8;
	Melter.st_r_Devices.b_r_OLED_Unit:= Melter.i_r_Gen_arr_SysInventory[0].9;
	Melter.st_r_Devices.b_r_WIFI_Board:= Melter.i_r_Gen_arr_SysInventory[0].10;
	Melter.st_r_Devices.b_r_Refill_Board:= Melter.i_r_Gen_arr_SysInventory[0].11;
	Melter.st_r_Devices.b_r_Anybus_Board:= Melter.i_r_Gen_arr_SysInventory[0].12;
	Melter.st_r_Devices.b_r_Press_Sensor:= Melter.i_r_Gen_arr_SysInventory[0].14;
	Melter.st_r_Devices.b_r_Press_CtrlValve:= Melter.i_r_Gen_arr_SysInventory[0].15;
	Melter.st_r_Devices.i_r_NumOfTempZones_External:= Melter.i_r_Gen_arr_SysInventory[1]/256;
	Melter.st_r_Devices.i_r_NumOfTempZones_Internal:= Melter.i_r_Gen_arr_SysInventory[1]-Melter.st_r_Devices.i_r_NumOfTempZones_External*256;
	Melter.st_r_Devices.i_r_NumOfPumps:= Melter.i_r_Gen_arr_SysInventory[2]/256;
	Melter.st_r_Devices.i_r_NumOfMotors:= Melter.i_r_Gen_arr_SysInventory[2]-Melter.st_r_Devices.i_r_NumOfPumps*256;
	Melter.st_r_Devices.i_r_NumOfWebClients := Melter.i_r_Gen_arr_SysInventory[3]/256;
	Melter.st_r_Devices.i_r_NumOfATS:= Melter.i_r_Gen_arr_SysInventory[3]-Melter.st_r_Devices.i_r_NumOfWebClients*256;

		
	i_ADI_Range := 0;
	FOR i := 0 TO i_rwADI_Count  DO
		i_ADI_Range:= i_ADI_Range + UDINT_TO_INT(st_ADI_List[i].ui_Size);
		arr_WriteIndex[i] := i_ADI_Range;//Index of all Read/Write ADI
		arr_WriteStartingAddress[i + 1] := i_ADI_Range;//All Read/Write ADI Starting Address
	END_FOR;
	
		//*************************************************
		//Create Reading Tick to Acyclic Read, Acyc Read 
		//Start when timer is triggered ends when all 
		//Acyc data are red, then wait for next Timer cycle
		//*************************************************
	tm_Acyc(IN := NOT b_read,
	PT := T#2000MS);
	b_read := tm_Acyc.Q ;
	
	//******************************************************************
	//Sequentially read ALL ADIs and store into structure
	//b_read will initiate when tm_Acyc Expired,b_AcycRD_Tick will
	//trigger the funciton block when read is done,
	//b_AcycRD_Enable only last during Acyclic reading in process
	//When last ADI been read, it will stop reading until next cycle
	//*******************************************************************
	FB_AcycRead_Para(enable := TRUE,
		pStation:= ADR(IN_mb_station),
		startAddress := st_ADI_List[i_Index].ui_ADI,
		nrRegisters := st_ADI_List[i_Index].ui_Size,
		pData := ADR(arr_ResponseValue),
		dataSize := st_ADI_List[i_Index].ui_Size*2);
	ui_AcycRdStatus_Para := FB_AcycRead_Para.status;
	b_AcycRD_Tick := FALSE;
	b_AcycRD_Done := FALSE;
	//*******************************************************************
	//Below is the section handling pressure reading, since the pressure
	//over fieldbus is always in PSI, the following logic will convert
	//Pressure value into different value based on the value setting
	//*******************************************************************
	i_ADI := st_ADI_List[i_Index].ui_ADI;
	i_Size := UDINT_TO_INT(st_ADI_List[i_Index].ui_Size);
	IF ui_AcycRdStatus_Para <>65535 AND b_AcycRdDnRising THEN
		b_AcycRD_Done := TRUE;
	END_IF;
	b_AcycRdDnRising := (ui_AcycRdStatus_Para = 65535);
	IF b_AcycRD_Done THEN			
		brsmemcpy(pDest:=ADR(arr_HMI[i_ValueIndex]) , pSrc:= ADR(arr_ResponseValue) , length:=i_Size*2 );
		IF i_Size = 2 THEN
			arr_i_DW_Temp[0] := arr_ResponseValue[0];
			arr_i_DW_Temp[1] := arr_ResponseValue[1];
			//Convert the unit based on pressure unit read from melter
			IF (i_ADI > 6000) AND (i_ADI < 8000) THEN
				brsmemcpy(pDest:=ADR(di_Press) , pSrc:= ADR(arr_ResponseValue) , length:=4 );
				//di_Press := arr_ResponseValue[0]+65536*arr_ResponseValue[1];
				CASE Melter.i_rw_Press_Unit OF
					0://psi
						r_Press := UDINT_TO_REAL(di_Press) / 1000.000;
					1://kpa
						r_Press := UDINT_TO_REAL(di_Press) / 145.0377377;
					2://bar
						r_Press := UDINT_TO_REAL(di_Press) / 14503.77377;
				END_CASE;
				brsmemcpy(pDest:=ADR(arr_i_DW_Temp[0]) , pSrc:= ADR(r_Press) , length:=4 );
				arr_HMI[i_ValueIndex] := arr_i_DW_Temp[0];
				arr_HMI[i_ValueIndex+1 ] := arr_i_DW_Temp[1];
			ELSE
				arr_HMI[i_ValueIndex] := arr_i_DW_Temp[0];
				arr_HMI[i_ValueIndex+1 ] := arr_i_DW_Temp[1];
			END_IF
		END_IF;
		//****************************************************
		//After reading the current ADI, index to next one
		//****************************************************
		i_ValueIndex := i_ValueIndex + UDINT_TO_INT(st_ADI_List[i_Index].ui_Size);
		i_Index := i_Index + 1;	
	END_IF;

	//****************************************************	
	//Copy all reading value into structure 
	//****************************************************
	IF b_read THEN
		brsmemcpy(pDest:=ADR(Melter.i_rw_Temp_arr_ZoneSP[0]) , pSrc:= ADR(arr_HMI[0]) , length:=i_SizeofStruct);
		brsmemcpy(pDest:=ADR(arr_HMI_Buffer[0]) , pSrc:= ADR(arr_HMI[0]) , length:=i_rwDataSize*2 );
	END_IF;

	//*******************************************************
	//When finish the last ADI, Rest until next reding cycle
	//*******************************************************
	IF i_Index = i_ADI_Size  THEN
		i_Index := 0;
		b_AcycRD_Enable :=FALSE;
		i_ValueIndex :=0;
		b_AcycWT_Start :=0;
	END_IF;	
	//**********************************************************************************************
	//Copy all read/write ADI reading into arr_HMI_Buffer_Compare for further generating Write Event
	//***********************************************************************************************
	brsmemcpy(pDest:=ADR(arr_HMI_Compare[0]) , pSrc:= ADR(Melter.i_rw_Temp_arr_ZoneSP[0]) ,length:=i_rwDataSize*2 );
END_IF;

	//**************************************************************************************
	//Compare arr_HMI_Compare with arr_HMI_Buffer to generate write event
	//**************************************************************************************
	tm_WriteEvent(IN :=b_WriteEvent,
		PT := T#300MS);
	IF tm_WriteEvent.Q OR (b_AcycWT_Done AND b_AcycWT_Rising) THEN
		b_WriteEvent :=0;
	END_IF;	
	b_AcycWT_Rising := NOT b_AcycWT_Done;

	b_WriteEventONS := 0;
	FOR i:=0 TO i_rwDataSize-1 BY 1 DO
		IF (arr_HMI_Compare[i] <> arr_HMI_Buffer[i]) AND NOT b_AcycWT_Start THEN
			i_CompareIndex := i;
			b_WriteEvent := TRUE;
			b_WriteEventONS := TRUE;
			arr_HMI_Buffer[i] :=arr_HMI_Compare[i];
			b_AcycWT_Start :=1;
			i_wttest := i_wttest +1;
			EXIT;
		END_IF;
	END_FOR;

	IF (b_AcycWT_Done OR tm_WriteEvent.Q)AND b_AcycWT_DN_Rising THEN
		b_AcycWT_Start :=0;
	END_IF;
	b_AcycWT_DN_Rising:= NOT (b_AcycWT_Done OR tm_WriteEvent.Q);

	IF b_WriteEventONS THEN
		//***************************************************************
		//When write event locate the write index inside arr_WriteIndex
		//***************************************************************
		FOR i := 0 TO i_rwADI_Count DO
			IF i_CompareIndex < arr_WriteIndex[i] THEN
				i_Index_Write := i;
				EXIT;
			END_IF;
		END_FOR;
		//***************************************************************
		//If pressure ADI generate write event, conver the unit back to PSI
		//***************************************************************	
		i_writesize := UDINT_TO_INT(st_ADI_List[i_Index_Write].ui_Size);
		IF i_writesize = 2 THEN
			brsmemcpy(pDest:=ADR(r_PressConvert) , pSrc:= ADR(arr_HMI_Compare[arr_WriteStartingAddress[i_Index_Write]]) , length:=4 );
			CASE Melter.i_rw_Press_Unit OF
				0://psi
					di_Press_psi := REAL_TO_UDINT(r_PressConvert * 1000.000);
				1://kpa
					di_Press_psi :=REAL_TO_UDINT( r_PressConvert* 145.0377377);
				2://bar
					di_Press_psi := REAL_TO_UDINT(r_PressConvert* 14503.77377);
			END_CASE;
			brsmemcpy(pDest:=ADR(arr_di_Press_psi[0]) , pSrc:= ADR(di_Press_psi) , length:=4 );
			i_arr_WriteBuffer[0] := arr_di_Press_psi[0];
			i_arr_WriteBuffer[1] := arr_di_Press_psi[1];
			brsmemcpy(pDest:=ADR(arr_HMI[arr_WriteStartingAddress[i_Index_Write]]) , pSrc:= ADR(arr_HMI_Compare[arr_WriteStartingAddress[i_Index_Write]]) , length:=4);
		ELSE
			brsmemcpy(pDest:=ADR(i_arr_WriteBuffer[0]) , pSrc:= ADR(arr_HMI_Compare[arr_WriteStartingAddress[i_Index_Write]]) , length:=i_writesize*2);
			brsmemcpy(pDest:=ADR(arr_HMI[arr_WriteStartingAddress[i_Index_Write]]) , pSrc:= ADR(arr_HMI_Compare[arr_WriteStartingAddress[i_Index_Write]]) , length:=i_writesize*2);
		END_IF;
	END_IF;
	//Acyclic Write Function block
	FB_AcycWrite(enable := b_WriteEvent,
		pStation:= ADR(IN_mb_station),
		startAddress := st_ADI_List[i_Index_Write].ui_ADI,
		nrRegisters := st_ADI_List[i_Index_Write].ui_Size,
		pData := ADR(i_arr_WriteBuffer),
		dataSize := st_ADI_List[i_Index_Write].ui_Size*2);
	ui_AcycWtStatus := FB_AcycWrite.status;

	b_AcycWT_Done := FALSE;
	IF ui_AcycWtStatus <>65535 AND b_AcycWTDnRising THEN
		b_AcycWT_Done := TRUE;
	END_IF;
	b_AcycWTDnRising := (ui_AcycWtStatus = 65535);

END_FUNCTION_BLOCK
