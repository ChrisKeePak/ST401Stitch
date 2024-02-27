(********************************************************************
 * COPYRIGHT -- Bernecker + Rainer
 ********************************************************************
 * Program: MbApp
 * File: MbApp.st
 * Author: Bernecker + Rainer
 * Created: October 22, 2009
 ********************************************************************
 * Implementation of program MbApp
 * State Nomenclature: "request" is a write to the nordson melter asking for some data
 * 					   "read" is a read from the nordson melter of the previously requested data
 *                     "write" is a write to the nordson melter asking to write some data to the melter
 *                     "verify" is a read from the nordson melter where we check to see that the write was accepted
 ********************************************************************)

PROGRAM _INIT
	
	NordsonTxPacket.Byte0_MelterControl := 16#1;
	NordsonTxPacket.Byte1_Command := 3;
	NordsonTxPacket.Byte2_Data_Index := 16#78;
	NordsonTxPacket.Byte3_Channel_Num := 16#3;
	NordsonTxPacket.Byte4_5_WriteData := 0;
	NordsonTxPacket.Byte6_7_Mot1Spd := 0;
	NordsonTxPacket.Byte8_9_Mot2Spd := 0;
	NordsonTxPacket.Byte10_11_Mot3Spd := 0;
	NordsonTxPacket.Byte12_13_Mot4Spd := 0;
	NordsonTxPacket.Byte14_15_NotUsed := 0;
	
	state := MB_IDLE;
	
	(* init values *)
	mb_station 			:= 'IF2.ST2';					(* path to modbus station *)
	write_register_address	:= 1024;						(* register address on modbus station *)
	read_register_address	:= 0;						(* register address on modbus station *)
	num_registers_to_write := 8;
	num_registers_to_read := 8;
	
	testChannel := CHANNEL_ACT_TEMP_START;
	testIdx := IDX_ACT_TEMP;
	
	gAdhesiveCtrlInterface.Commands.MelterOn := TRUE;
	gAdhesiveCtrlInterface.Commands.PumpsOn := TRUE;
	gAdhesiveCtrlInterface.Parameters.NordsonComms.StandbyTimeoutTime := T#2h;
	
	FirstTimeCopySetTemps := FALSE;
	
	

END_PROGRAM


PROGRAM _CYCLIC

	IF(gAdhesiveCtrlInterface.Parameters.FeedbackIsModbusTCP) THEN
		gHMI.StatusDatapoints.NordsonModbusSDP := UNHIDE + UNLOCK;
	ELSE
		gHMI.StatusDatapoints.NordsonModbusSDP := HIDE + LOCK;
	END_IF
	
	StandbyTimer.IN := NOT(gRamCtrlInterface.Status.Running) AND NOT(gAdhesiveCtrlInterface.Commands.MelterStandbyOn);
	StandbyTimer.PT := gAdhesiveCtrlInterface.Parameters.NordsonComms.StandbyTimeoutTime;
	StandbyTimer();
	
	IF(StandbyTimer.Q) THEN
		gAdhesiveCtrlInterface.Commands.MelterStandbyOn := TRUE;
	END_IF
	
	//clearing standby on command shiuld turn standby off. Changed standbyoff to True
	IF(gAdhesiveCtrlInterface.Commands.MelterStandbyOff) THEN
		gAdhesiveCtrlInterface.Commands.MelterStandbyOff := TRUE;
		gAdhesiveCtrlInterface.Commands.MelterStandbyOn := FALSE;
	END_IF
	
	IF((gAdhesiveCtrlInterface.Status.NordsonInStandby) AND (gAdhesiveCtrlInterface.Parameters.FeedbackIsModbusTCP)) THEN
		gHMI.StatusDatapoints.NordsonStandbyOffSDP := UNHIDE + UNLOCK;
	ELSE
		gHMI.StatusDatapoints.NordsonStandbyOffSDP := HIDE + LOCK;
	END_IF
	
	//if nordson feedback is bypassed, the error count should reset to 0
	IF gAdhesiveCtrlInterface.Parameters.NordsonComms.ByPassFeedback THEN
		gAdhesiveCtrlInterface.Parameters.NordsonComms.ConsecutiveErrorCount := 0;
	END_IF
	
	
	CASE state OF
		
		MB_IDLE:
			FeedbackCycleTimer.IN := ((gAdhesiveCtrlInterface.Parameters.FeedbackIsModbusTCP) AND (gAdhesiveCtrlInterface.Parameters.NordsonComms.ByPassFeedback = FALSE));
			
			IF(gAdhesiveCtrlInterface.Parameters.FeedbackIsModbusTCP = FALSE) THEN
				gAdhesiveCtrlInterface.Parameters.NordsonComms.ConsecutiveErrorCount := 0;
			END_IF
			
			IF(gAdhesiveCtrlInterface.Commands.WriteChannelTemp) THEN
				gAdhesiveCtrlInterface.Commands.WriteChannelTemp := FALSE;
				TempChannelToWrite := 0;
				state := MB_WRITE_SET_TEMP;
				
			ELSIF(FeedbackCycleTimer.Q) THEN
				FeedbackCycleTimer.IN := FALSE;
				state := MB_REQUEST_MELTER_STATUS;
			END_IF
		
		MB_REQUEST_MELTER_STATUS:
		
			WriteMultipleRegisters.enable := 1;
			NordsonTxPacket.Byte0_MelterControl := MelterCmd;
			NordsonTxPacket.Byte1_Command := READ_COMMAND;
			NordsonTxPacket.Byte2_Data_Index := IDX_MELTER_STATUS;
			NordsonTxPacket.Byte3_Channel_Num := 0;
		
			IF((WriteMultipleRegisters.status = ERR_FUB_ENABLE_FALSE) OR (WriteMultipleRegisters.status = ERR_FUB_BUSY)) THEN
				//do nothing
			ELSIF(WriteMultipleRegisters.status = ERR_OK) THEN
				WriteMultipleRegisters.enable := 0;
				state := MB_READ_MELTER_STATUS;
			ELSE
				WriteMultipleRegisters.enable := 0;
				MBError := WriteMultipleRegisters.status;
				state := MB_ERROR;
			END_IF
		
		MB_READ_MELTER_STATUS:
		
			ReadMultipleRegisters.enable := 1;
			
			IF((ReadMultipleRegisters.status = ERR_FUB_ENABLE_FALSE) OR (ReadMultipleRegisters.status = ERR_FUB_BUSY)) THEN
				//do nothing
			ELSIF(ReadMultipleRegisters.status = ERR_OK) THEN
				
				ReadMultipleRegisters.enable := 0;
				
				IF(NordsonRxPacket.Byte2_Ack_Data_Index = NordsonTxPacket.Byte2_Data_Index) THEN
				
					gAdhesiveCtrlInterface.Parameters.NordsonComms.MelterStatus := NordsonRxPacket.Byte4_5_Read_Data_0;
					gAdhesiveCtrlInterface.Parameters.NordsonComms.MelterIsOn := (gAdhesiveCtrlInterface.Parameters.NordsonComms.MelterStatus <> 8); //melter status == 8 => melter is not on
					
					DecodeStatus;
					
					//the melter MUST see a 0 for its ON command before it sees a 1. Send a 0 if the unit is faulted OR we have previously told it to turn on. and it never came on
				//	IF((gAdhesiveCtrlInterface.Parameters.NordsonComms.UnitFaulted) OR ((gAdhesiveCtrlInterface.Parameters.NordsonComms.MelterIsOn = FALSE) AND (NordsonTxPacket.Byte0_MelterControl.0 = TRUE))) THEN
					IF((gAdhesiveCtrlInterface.Parameters.NordsonComms.MelterIsOn = FALSE) AND (NordsonTxPacket.Byte0_MelterControl.0 = TRUE)) THEN
						MelterCmd := MELTER_OFF + PUMPS_OFF; //melter off, pumps off
					ELSE
						
						MelterCmd := 0;
						IF(gAdhesiveCtrlInterface.Commands.MelterOn) THEN
							MelterCmd := MelterCmd + MELTER_ON;
						END_IF
					
						IF((gAdhesiveCtrlInterface.Commands.PumpsOn) AND (gAdhesiveCtrlInterface.Status.UnitReady)) THEN
							MelterCmd := MelterCmd + PUMPS_ON; //only turn the pump on if the melter is ready
						END_IF
						
						IF((gAdhesiveCtrlInterface.Commands.MelterStandbyOn = FALSE) OR ((gAdhesiveCtrlInterface.Status.NordsonInStandby = FALSE) AND NordsonTxPacket.Byte0_MelterControl.6 = TRUE)) THEN
							//do not standby on
						ELSIF (gAdhesiveCtrlInterface.Commands.MelterStandbyOn = TRUE) THEN
							MelterCmd := MelterCmd + STANDBY_ON; //only turn the pump on if the melter is ready
						END_IF
					END_IF
					
					state := MB_REQUEST_SET_TEMPS;
				ELSE	
					//stay in this state and re-execute read
				END_IF
				
			ELSE
				ReadMultipleRegisters.enable := 0;
				MBError := ReadMultipleRegisters.status;
				state := MB_ERROR;
			END_IF
			 
		MB_REQUEST_SET_TEMPS:
		
			WriteMultipleRegisters.enable := 1;
			NordsonTxPacket.Byte0_MelterControl := MelterCmd;
			NordsonTxPacket.Byte1_Command := READ_COMMAND;
			NordsonTxPacket.Byte2_Data_Index := IDX_SET_TEMP;
			NordsonTxPacket.Byte3_Channel_Num := CHANNEL_SET_TEMP_START;
		
			IF((WriteMultipleRegisters.status = ERR_FUB_ENABLE_FALSE) OR (WriteMultipleRegisters.status = ERR_FUB_BUSY)) THEN
				//do nothing
			ELSIF(WriteMultipleRegisters.status = ERR_OK) THEN
				WriteMultipleRegisters.enable := 0;
				gAdhesiveCtrlInterface.Parameters.NordsonComms.ConsecutiveErrorCount := 0;
				state := MB_READ_SET_TEMPS;
			ELSE
				WriteMultipleRegisters.enable := 0;
				MBError := WriteMultipleRegisters.status;
				state := MB_ERROR;
			END_IF
		
		MB_READ_SET_TEMPS:
		
			ReadMultipleRegisters.enable := 1;
			
			IF((ReadMultipleRegisters.status = ERR_FUB_ENABLE_FALSE) OR (ReadMultipleRegisters.status = ERR_FUB_BUSY)) THEN
				//do nothing
			ELSIF(ReadMultipleRegisters.status = ERR_OK) THEN
				ReadMultipleRegisters.enable := 0;
				gAdhesiveCtrlInterface.Parameters.NordsonComms.ConsecutiveErrorCount := 0;
				
				IF((NordsonRxPacket.Byte2_Ack_Data_Index = NordsonTxPacket.Byte2_Data_Index) AND 
					(NordsonRxPacket.Byte3_Ack_Channel_Num = NordsonTxPacket.Byte3_Channel_Num)) THEN
					
					DecodeStatus;
					
					gAdhesiveCtrlInterface.Parameters.NordsonComms.ChannelSetTempActual[0] := NordsonRxPacket.Byte4_5_Read_Data_0;
					gAdhesiveCtrlInterface.Parameters.NordsonComms.ChannelSetTempActual[1] := NordsonRxPacket.Byte6_7_Read_Data_1;
					gAdhesiveCtrlInterface.Parameters.NordsonComms.ChannelSetTempActual[2] := NordsonRxPacket.Byte8_9_Read_Data_2;
					gAdhesiveCtrlInterface.Parameters.NordsonComms.ChannelSetTempActual[3] := NordsonRxPacket.Byte10_11_Read_Data_3;
					gAdhesiveCtrlInterface.Parameters.NordsonComms.ChannelSetTempActual[4] := NordsonRxPacket.Byte12_13_Read_Data_4;
					gAdhesiveCtrlInterface.Parameters.NordsonComms.ChannelSetTempActual[5] := NordsonRxPacket.Byte14_15_Read_Data_5;
					
					IF (FirstTimeCopySetTemps = FALSE) THEN
						gAdhesiveCtrlInterface.Parameters.NordsonComms.ChannelSetTempRequested := gAdhesiveCtrlInterface.Parameters.NordsonComms.ChannelSetTempActual;
						FirstTimeCopySetTemps := TRUE;
					END_IF
					
					state := MB_REQUEST_ACT_TEMPS; //for now, just go back to idle. Future versions need to read more stuff
				ELSE
					//stay in this state and re-execute read
				END_IF
			ELSE
				ReadMultipleRegisters.enable := 0;
				MBError := ReadMultipleRegisters.status;
				state := MB_ERROR;	
			END_IF
			
			
		MB_REQUEST_ACT_TEMPS:
		
			WriteMultipleRegisters.enable := 1;
			NordsonTxPacket.Byte0_MelterControl := MelterCmd;
			NordsonTxPacket.Byte1_Command := READ_COMMAND;
			NordsonTxPacket.Byte2_Data_Index := IDX_ACT_TEMP;
			NordsonTxPacket.Byte3_Channel_Num := CHANNEL_ACT_TEMP_START;
		
			IF((WriteMultipleRegisters.status = ERR_FUB_ENABLE_FALSE) OR (WriteMultipleRegisters.status = ERR_FUB_BUSY)) THEN
				//do nothing
			ELSIF(WriteMultipleRegisters.status = ERR_OK) THEN
				WriteMultipleRegisters.enable := 0;
				state := MB_READ_ACT_TEMPS;
			ELSE
				WriteMultipleRegisters.enable := 0;
				MBError := WriteMultipleRegisters.status;
				state := MB_ERROR;
			END_IF
		
		MB_READ_ACT_TEMPS:
		
			ReadMultipleRegisters.enable := 1;
			
			IF((ReadMultipleRegisters.status = ERR_FUB_ENABLE_FALSE) OR (ReadMultipleRegisters.status = ERR_FUB_BUSY)) THEN
				//do nothing
			ELSIF(ReadMultipleRegisters.status = ERR_OK) THEN
				ReadMultipleRegisters.enable := 0;
				
				IF((NordsonRxPacket.Byte2_Ack_Data_Index = NordsonTxPacket.Byte2_Data_Index) AND 
					(NordsonRxPacket.Byte3_Ack_Channel_Num = NordsonTxPacket.Byte3_Channel_Num)) THEN
					
					DecodeStatus;	
					
					gAdhesiveCtrlInterface.Parameters.NordsonComms.ChannelActTemp[0] := NordsonRxPacket.Byte4_5_Read_Data_0;
					gAdhesiveCtrlInterface.Parameters.NordsonComms.ChannelActTemp[1] := NordsonRxPacket.Byte6_7_Read_Data_1;
					gAdhesiveCtrlInterface.Parameters.NordsonComms.ChannelActTemp[2] := NordsonRxPacket.Byte8_9_Read_Data_2;
					gAdhesiveCtrlInterface.Parameters.NordsonComms.ChannelActTemp[3] := NordsonRxPacket.Byte10_11_Read_Data_3;
					gAdhesiveCtrlInterface.Parameters.NordsonComms.ChannelActTemp[4] := NordsonRxPacket.Byte12_13_Read_Data_4;
					gAdhesiveCtrlInterface.Parameters.NordsonComms.ChannelActTemp[5] := NordsonRxPacket.Byte14_15_Read_Data_5;
					
					state := MB_REQUEST_ATS_ALARMS;
				ELSE
					//stay in this state and re-execute read
				END_IF
				
			ELSE
				ReadMultipleRegisters.enable := 0;
				MBError := ReadMultipleRegisters.status;
				state := MB_ERROR;
			END_IF
		
		MB_REQUEST_ATS_ALARMS:
		
			WriteMultipleRegisters.enable := 1;
			NordsonTxPacket.Byte0_MelterControl := MelterCmd;
			NordsonTxPacket.Byte1_Command := READ_COMMAND;
			NordsonTxPacket.Byte2_Data_Index := IDX_ATS_ALARMS;
		
			IF((WriteMultipleRegisters.status = ERR_FUB_ENABLE_FALSE) OR (WriteMultipleRegisters.status = ERR_FUB_BUSY)) THEN
				//do nothing
			ELSIF(WriteMultipleRegisters.status = ERR_OK) THEN
				WriteMultipleRegisters.enable := 0;
				state := MB_READ_ATS_ALARMS;
			ELSE
				WriteMultipleRegisters.enable := 0;
				MBError := WriteMultipleRegisters.status;
				state := MB_ERROR;
			END_IF
		
		MB_READ_ATS_ALARMS:
		
			ReadMultipleRegisters.enable := 1;
			
			IF((ReadMultipleRegisters.status = ERR_FUB_ENABLE_FALSE) OR (ReadMultipleRegisters.status = ERR_FUB_BUSY)) THEN
				//do nothing
			ELSIF(ReadMultipleRegisters.status = ERR_OK) THEN
				ReadMultipleRegisters.enable := 0;
				
				IF(NordsonRxPacket.Byte2_Ack_Data_Index = NordsonTxPacket.Byte2_Data_Index) THEN
					
					DecodeStatus;	
					
					gAdhesiveCtrlInterface.Status.ATS_AddOnOverLimit := NordsonRxPacket.Byte4_5_Read_Data_0.0;
					gAdhesiveCtrlInterface.Status.ATS_AddOnUnderLimit := NordsonRxPacket.Byte4_5_Read_Data_0.1;
					
					state := MB_IDLE;
				ELSE
					//stay in this state and re-execute read
				END_IF
				
			ELSE
				ReadMultipleRegisters.enable := 0;
				MBError := ReadMultipleRegisters.status;
				state := MB_ERROR;
			END_IF
		
		MB_WRITE_SET_TEMP:
			
			WriteMultipleRegisters.enable := 1;
			NordsonTxPacket.Byte0_MelterControl := MelterCmd;
			NordsonTxPacket.Byte1_Command := WRITE_COMMAND;
			NordsonTxPacket.Byte2_Data_Index := IDX_SET_TEMP;
			NordsonTxPacket.Byte3_Channel_Num := TempChannelToWrite + 1; //TempChannelToWrite starts counting at 0, but nordson melter starts counting at 1
			NordsonTxPacket.Byte4_5_WriteData := gAdhesiveCtrlInterface.Parameters.NordsonComms.ChannelSetTempRequested[TempChannelToWrite];
		
			IF((WriteMultipleRegisters.status = ERR_FUB_ENABLE_FALSE) OR (WriteMultipleRegisters.status = ERR_FUB_BUSY)) THEN
				//do nothing
			ELSIF(WriteMultipleRegisters.status = ERR_OK) THEN
				WriteMultipleRegisters.enable := 0;
				state := MB_VERIFY_SET_TEMP_WRITE;
			ELSE
				WriteMultipleRegisters.enable := 0;
				MBError := WriteMultipleRegisters.status;
				state := MB_ERROR;
			END_IF
		
		MB_VERIFY_SET_TEMP_WRITE:
		
			ReadMultipleRegisters.enable := 1;
			
			IF((ReadMultipleRegisters.status = ERR_FUB_ENABLE_FALSE) OR (ReadMultipleRegisters.status = ERR_FUB_BUSY)) THEN
				//do nothing
			ELSIF(ReadMultipleRegisters.status = ERR_OK) THEN
				ReadMultipleRegisters.enable := 0;
				
				IF((NordsonRxPacket.Byte2_Ack_Data_Index = NordsonTxPacket.Byte2_Data_Index) AND 
					(NordsonRxPacket.Byte3_Ack_Channel_Num = NordsonTxPacket.Byte3_Channel_Num)) THEN
					
					DecodeStatus;
					
					IF(TempChannelToWrite < NUM_NORDSON_TEMP_ZONES_M1) THEN
						IF(TempChannelToWrite = 0) THEN
							TempChannelToWrite := 2; //channel 0 and 1 get the same temp, no need to re-write channel 1
							state := MB_WRITE_SET_TEMP;
						ELSE
							TempChannelToWrite := TempChannelToWrite + 1; //set the temperature for the next channel (Skip channel 2). Machine has 3 total channels
							state := MB_WRITE_SET_TEMP;
						END_IF
					ELSE
						state := MB_IDLE;
					END_IF
				ELSE
					//stay in this state and re-execute read
				END_IF
				
			ELSE
				ReadMultipleRegisters.enable := 0;
				MBError := ReadMultipleRegisters.status;
				state := MB_ERROR;
			END_IF
		
		MB_REQUEST_ADH_USE:
		
			WriteMultipleRegisters.enable := 1;
			NordsonTxPacket.Byte0_MelterControl := MelterCmd;
			NordsonTxPacket.Byte1_Command := READ_COMMAND;
			NordsonTxPacket.Byte2_Data_Index := IDX_ADHESIVE_HOUR;
			NordsonTxPacket.Byte3_Channel_Num := CHANNEL_ADHESIVE_HOUR;
		
			IF((WriteMultipleRegisters.status = ERR_FUB_ENABLE_FALSE) OR (WriteMultipleRegisters.status = ERR_FUB_BUSY)) THEN
				//do nothing
			ELSIF(WriteMultipleRegisters.status = ERR_OK) THEN
				WriteMultipleRegisters.enable := 0;
				state := MB_READ_ACT_TEMPS;
			ELSE
				WriteMultipleRegisters.enable := 0;
				MBError := WriteMultipleRegisters.status;
				state := MB_ERROR;
			END_IF
		
		MB_READ_ADH_USE:
		
			ReadMultipleRegisters.enable := 1;
			
			IF((ReadMultipleRegisters.status = ERR_FUB_ENABLE_FALSE) OR (ReadMultipleRegisters.status = ERR_FUB_BUSY)) THEN
				//do nothing
			ELSIF(ReadMultipleRegisters.status = ERR_OK) THEN
				ReadMultipleRegisters.enable := 0;
				
				IF((NordsonRxPacket.Byte2_Ack_Data_Index = NordsonTxPacket.Byte2_Data_Index) AND 
					(NordsonRxPacket.Byte3_Ack_Channel_Num = NordsonTxPacket.Byte3_Channel_Num)) THEN
					
					//	NordsonData.AdhesiveUsePerHour := NordsonRxPacket.Byte4_5_Read_Data_0 + (NordsonRxPacket.Byte6_7_Read_Data_1*(65536)); //data 0 + data 1 shifted up 16 bits
					
					state := MB_READ_ACT_TEMPS;
				ELSE
					//stay in this state and re-execute read
				END_IF
			END_IF
				
		MB_WRITE_REGISTERS:
		
			WriteMultipleRegisters.enable := 1;
			NordsonTxPacket.Byte0_MelterControl := MELTER_ON;
			NordsonTxPacket.Byte1_Command := READ_COMMAND;
			NordsonTxPacket.Byte2_Data_Index := testChannel;
			NordsonTxPacket.Byte3_Channel_Num := testIdx;
		
			IF((WriteMultipleRegisters.status = ERR_FUB_ENABLE_FALSE) OR (WriteMultipleRegisters.status = ERR_FUB_BUSY)) THEN
				//do nothing
			ELSIF(WriteMultipleRegisters.status = ERR_OK) THEN
				WriteMultipleRegisters.enable := 0;
				state := MB_READ_ACT_TEMPS;
			ELSE
				WriteMultipleRegisters.enable := 0;
				MBError := WriteMultipleRegisters.status;
				state := MB_ERROR;
			END_IF
		
		MB_READ_REGISTERS:
		
			ReadMultipleRegisters.enable := 1;
			
			IF((ReadMultipleRegisters.status = ERR_FUB_ENABLE_FALSE) OR (ReadMultipleRegisters.status = ERR_FUB_BUSY)) THEN
				//do nothing
			ELSIF(ReadMultipleRegisters.status = ERR_OK) THEN
				ReadMultipleRegisters.enable := 0;	
				state := MB_IDLE;
			ELSE
				ReadMultipleRegisters.enable := 0;
				MBError := ReadMultipleRegisters.status;
				state := MB_ERROR;
			END_IF
		
		MB_ERROR:
			gAdhesiveCtrlInterface.Parameters.NordsonComms.ConsecutiveErrorCount := gAdhesiveCtrlInterface.Parameters.NordsonComms.ConsecutiveErrorCount + 1;	
		state := MB_IDLE; //keep re-trying indefinetly, logic below will set/reset alarms alarm
	
	END_CASE;
	
	IF EDGEPOS(gAdhesiveCtrlInterface.Parameters.NordsonComms.ConsecutiveErrorCount >= 10) THEN
		MpAlarmXSet(gAlarmXCore, ALARM_NORDSON_COMMS);	
	ELSIF EDGENEG(gAdhesiveCtrlInterface.Parameters.NordsonComms.ConsecutiveErrorCount >= 10)THEN
		MpAlarmXReset(gAlarmXCore, ALARM_NORDSON_COMMS);	
	END_IF
	
	IF EDGEPOS(gAdhesiveCtrlInterface.Status.ATS_AddOnOverLimit) THEN
		MpAlarmXSet(gAlarmXCore, ALARM_ATS_OVERLIMIT);	
	ELSIF EDGENEG(gAdhesiveCtrlInterface.Status.ATS_AddOnOverLimit)THEN
		MpAlarmXReset(gAlarmXCore, ALARM_ATS_OVERLIMIT);	
	END_IF
	
	IF EDGEPOS(gAdhesiveCtrlInterface.Status.ATS_AddOnUnderLimit) THEN
		MpAlarmXSet(gAlarmXCore, ALARM_ATS_UNDERLIMIT);	
	ELSIF EDGENEG(gAdhesiveCtrlInterface.Status.ATS_AddOnUnderLimit)THEN
		MpAlarmXReset(gAlarmXCore, ALARM_ATS_UNDERLIMIT);	
	END_IF
	
	IF EDGEPOS(gAdhesiveCtrlInterface.Status.NordsonInStandby) THEN
		MpAlarmXSet(gAlarmXCore, ALARM_NORDSON_STANDBY);	
	ELSIF EDGENEG(gAdhesiveCtrlInterface.Status.NordsonInStandby)THEN
		MpAlarmXReset(gAlarmXCore, ALARM_NORDSON_STANDBY);	
	END_IF
	
	//force unit ready and unit faulted status flags if ModbusTCP control is selected and bypass is enabled
	IF(gAdhesiveCtrlInterface.Parameters.FeedbackIsModbusTCP AND gAdhesiveCtrlInterface.Parameters.NordsonComms.ByPassFeedback) THEN
		gAdhesiveCtrlInterface.Parameters.NordsonComms.UnitReady := TRUE;
		gAdhesiveCtrlInterface.Parameters.NordsonComms.UnitFaulted := FALSE;
		gAdhesiveCtrlInterface.Status.ATS_AddOnOverLimit := FALSE;
		gAdhesiveCtrlInterface.Status.ATS_AddOnUnderLimit := FALSE;
	END_IF

	//Must be called after state machine. Do not move any function calls that are already below this line
	WriteMultipleRegisters.pStation := ADR(mb_station);
	WriteMultipleRegisters.startAddress := write_register_address;
	WriteMultipleRegisters.nrRegisters := num_registers_to_write;
	WriteMultipleRegisters.pData := ADR(NordsonTxPacket);
	WriteMultipleRegisters.dataSize := SIZEOF(NordsonTxPacket);
	WriteMultipleRegisters();
	
	ReadMultipleRegisters.pStation := ADR(mb_station);
	ReadMultipleRegisters.startAddress := read_register_address;
	ReadMultipleRegisters.nrRegisters := num_registers_to_read;
	ReadMultipleRegisters.pData := ADR(NordsonRxPacket);
	ReadMultipleRegisters.dataSize := SIZEOF(NordsonRxPacket);
	ReadMultipleRegisters();
	
	FeedbackCycleTimer.PT := gAdhesiveCtrlInterface.Parameters.NordsonComms.FeedbackTime;
	FeedbackCycleTimer();

				END_PROGRAM
