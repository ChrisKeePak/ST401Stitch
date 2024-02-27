
PROGRAM _INIT

	(* init values *)
	mb_station 			:= 'IF2.ST3';					(* path to modbus station *)
	//This is a new Line3

END_PROGRAM


PROGRAM _CYCLIC

	IF gIsSimulated = FALSE THEN
		//Patlight comms forced to idle state if light stack type is not PATLITE
		IF(gModeControlInterface.Parameters.LightStackSelection <> LIGHTSTACK_PATLITE) THEN
			ErrorCount := 0;
			CommState := PATLITE_STATE_STANDBY;
			CurrentLightGroup := GROUP_1_POWER_ON;
			
		END_IF
		
		CASE (CommState) OF
		
			(***************** PATLITE_STATE STANDBY: CHECK THE MACHINE PATLITE_STATE TO SET LIGHT MODE ***************************)
			PATLITE_STATE_STANDBY:
			
				(*Check conditions for the light group *)
				IF NOT(gIO.DIs.SafetyOK) THEN
					NextLightGroup := GROUP_5_SAFETY;
					
				ELSIF gHMI.BitmapSelectDatapoints.RunPress THEN
					NextLightGroup := GROUP_4_RUN;
					
				ELSIF (gIO.DIs.AirPressureOK AND gAdhesiveCtrlInterface.Status.UnitReady) THEN
					NextLightGroup := GROUP_3_HEAT_AIR_OK;
					
				ELSE
					NextLightGroup := GROUP_2_HEATING;
					
				END_IF
				
			
				(*If the light group changes, go to the write registry state*)
				IF NextLightGroup <> CurrentLightGroup THEN
					CurrentLightGroup := NextLightGroup;
					CommState := PATLITE_STATE_WRITE_REGISTER;
					
				END_IF
	
				IF(gModeControlInterface.Parameters.LightStackSelection <> LIGHTSTACK_PATLITE) THEN
					ErrorCount := 0;
					CommState := PATLITE_STATE_STANDBY;
				END_IF
			
			
			(***************** PATLITE_STATE WRITE REGISTER: WRITE THE STACKLIGHT REGISTER TO SET LIGHT MODE ***************************)
			PATLITE_STATE_WRITE_REGISTER:
				
				mbWriteSingleRegister_0.enable 			:= 1;
				mbWriteSingleRegister_0.pStation 		:= ADR(mb_station);
				mbWriteSingleRegister_0.startAddress 	:= GROUP_REG_ADR;
				mbWriteSingleRegister_0.value 			:= DINT_TO_UINT(CurrentLightGroup) + GROUP_OFFSET;
				mbWriteSingleRegister_0();										(* call function block *)
				IF (mbWriteSingleRegister_0.status <> ERR_FUB_BUSY) THEN
					IF mbWriteSingleRegister_0.status = 0 THEN
						(*Successful write, go to standby*)
						CommState := PATLITE_STATE_STANDBY;
						CommError := FALSE;
						ErrorCount := 0;
					ELSE
						(*Error writing, go to error state*)
						CommState := PATLITE_STATE_ERROR;
						ErrorCount := ErrorCount+1;
					END_IF
						
				END_IF
			
			
			PATLITE_STATE_ERROR:
			
				IF ErrorCount > ERROR_COUNT_THRESH THEN
					CommError := TRUE;
				END_IF
	
			
				CommState := PATLITE_STATE_WRITE_REGISTER;
				
			
		END_CASE
		
		
		IF(EDGEPOS(CommError)) THEN
			MpAlarmXSet(gAlarmXCore, ALARM_PATLITE_COMMS);	
		ELSIF (EDGENEG(CommError)) THEN 
			MpAlarmXReset(gAlarmXCore, ALARM_PATLITE_COMMS);	
		END_IF
	END_IF


END_PROGRAM
