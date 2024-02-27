
PROGRAM _INIT
	(* Insert code here *)
	
    gHMI.Parameters.ServoRamJogVelocity := 50;
    gHMI.Parameters.ServoRamPositiveVelocity := 650.0;
    gHMI.Parameters.ServoRamNegativeVelocity := 950.0;
    gHMI.Parameters.ServoRamAccel := 5000.0;
	
    gHMI.Parameters.ServoRamStartPosition := 50.0;
    gHMI.Parameters.ServoRamEndPosition := 500.0;
	
    gHMI.Parameters.ServoRamEndDwellTime := 2000;
    gHMI.Parameters.ServoRamStartDwellTime := 100;
	
    gHMI.Parameters.ServoRamTorqueLimit := 6.0;
    gHMI.Parameters.ServoRamClearPosition := 300;
	
    gPassword; //need to use this somewhere. Was getting thrown out in slimmed down test code for servo ram
	
    TON_RamDelay(IN := gIO.DIs.BodyDetect , PT := RamDelay );
	
	
	 
END_PROGRAM

PROGRAM _CYCLIC

	
    IF gHighSeverityAlarmActive THEN
        state := SERVORAM_ERROR;
    END_IF
	
    gIO.DOs.ResetSafety := gHMI.Commands.RequestReset;
	
    StartDwellTimer.IN := FALSE; //Set in state machine if needed
    EndDwellTimer.IN := FALSE;
	
	
    IF gServoRamInterface.Status.ActualPosition <= gHMI.Parameters.ServoRamClearPosition THEN
        ServoRamClear := TRUE;
    ELSE
        ServoRamClear := FALSE;
    END_IF
	
    IF NOT gHMI.Commands.CycleServoRam THEN
        state := SERVORAM_IDLE;
    END_IF
	
    CASE state OF
		
        SERVORAM_WAIT_FOR_HOME:
			
            //servo ram should home automatically on machine start up.
            IF gServoRamInterface.Status.Homed AND ServoRamFirstHomeExecuted THEN
                ServoRamAutoHome := FALSE;
                gRamAtStopPosition := TRUE;
                gHMI.Commands.CycleServoRam := FALSE;
                gServoRamInterface.Commands.ToMapp.TorqueLimitingOn := TRUE; //turn torque limiting on
                state := SERVORAM_IDLE;
            ELSIF gServoRamInterface.Status.PoweredOn THEN
                ServoRamAutoHome := TRUE;
            END_IF
		
        SERVORAM_IDLE:
		
            IF gHMI.Commands.CycleServoRam AND ServoRamFirstHomeExecuted THEN
                ServoRamBusy := TRUE;
                gServoRamInterface.Commands.ToMapp.TorqueLimitingOn := TRUE; //turn torque limiting on
				
                gServoRamInterface.Parameters.MovementParameters.Position := gHMI.Parameters.ServoRamStartPosition;
                gServoRamInterface.Parameters.MovementParameters.Velocity := gHMI.Parameters.ServoRamPositiveVelocity;
                gServoRamInterface.Commands.RequestMoveAbs := TRUE;
				
                state := SERVORAM_MOVE_TO_START;
            END_IF
			
        SERVORAM_WAITING_ON_BOX:
		
            IF (gIO.DIs.BodyDetect AND (gModeControlInterface.Commands.SetShowMode = FALSE)) OR 
                (gIO.DIs.X_BlowOff AND gModeControlInterface.Commands.SetShowMode) THEN	
				
                FeedInCycle := FALSE;
				
                gServoRamInterface.Parameters.MovementParameters.Position := gHMI.Parameters.ServoRamEndPosition;
                gServoRamInterface.Parameters.MovementParameters.Velocity := gHMI.Parameters.ServoRamPositiveVelocity;
                gRamAtStopPosition := FALSE;
                gServoRamInterface.Commands.RequestMoveAbs := TRUE;
                ServoRamBusy := TRUE ;
				
                state := SERVORAM_MOVE_TO_END;
            END_IF
		
		
        SERVORAM_MOVE_TO_END:
		
            gIO.DOs.PushOn := gPusherOn;
			
            IF gServoRamInterface.Status.MoveComplete THEN
                gServoRamInterface.Status.MoveComplete := FALSE;
				
                gServoRamInterface.Commands.ToMapp.Update := TRUE; //This forces update of the torque limit. This will be cleared automatically
				
                IF gHMI.Parameters.ServoRamEndDwellTime > 0 THEN
				
                    EndDwellTimer.IN := TRUE;
                    state := SERVORAM_DWELL_AT_END;
                ELSE
					
                    CycleCount := CycleCount + 1;
                    LubeCount := LubeCount + 1;
				
                    gServoRamInterface.Parameters.MovementParameters.Position := gHMI.Parameters.ServoRamStartPosition;
                    gServoRamInterface.Parameters.MovementParameters.Velocity := gHMI.Parameters.ServoRamNegativeVelocity;
                    gServoRamInterface.Commands.RequestMoveAbs := TRUE;
					
				
                    state := SERVORAM_MOVE_TO_START;
					
                END_IF
            END_IF
		
        SERVORAM_DWELL_AT_END:
		
            EndDwellTimer.IN := TRUE;
		
            IF EndDwellTimer.Q THEN
                EndDwellTimer.IN := FALSE;
				
                CycleCount := CycleCount + 1;
				
                gServoRamInterface.Parameters.MovementParameters.Position := gHMI.Parameters.ServoRamStartPosition;
                gServoRamInterface.Parameters.MovementParameters.Velocity := gHMI.Parameters.ServoRamNegativeVelocity;
                gServoRamInterface.Commands.RequestMoveAbs := TRUE;
				
                state := SERVORAM_MOVE_TO_START;
				
            END_IF
		
		
        SERVORAM_MOVE_TO_START:
		
            IF gServoRamInterface.Status.MoveComplete THEN
                gRamAtStopPosition := TRUE;
                gServoRamInterface.Status.MoveComplete := FALSE;
                ServoRamBusy := FALSE;
				
                IF NOT(FeedInCycle) THEN
                    gModeControlInterface.Commands.FinishCycle := FALSE;
                END_IF
				
							
                IF gHMI.Parameters.ServoRamStartDwellTime > 0 THEN
				
                    EndDwellTimer.IN := TRUE;
                    state := SERVORAM_DWELL_AT_START;
                ELSE	
					
                    state := SERVORAM_WAITING_ON_BOX;		
                END_IF
					
            END_IF
		
        SERVORAM_DWELL_AT_START:
		
            StartDwellTimer.IN := TRUE;
		
            IF StartDwellTimer.Q THEN
                StartDwellTimer.IN := FALSE;
				
                state := SERVORAM_IDLE;			
            END_IF
		
        SERVORAM_ERROR:
			
            ServoRamAutoHome := FALSE;
            gServoRamInterface.Status.MoveComplete := FALSE;
            gHMI.Commands.CycleServoRam := FALSE;
            ServoRamBusy := FALSE;
            ServoRamAutoHome := FALSE;
				
            IF (gNumActiveAlarms = 0) THEN
                state := SERVORAM_WAIT_FOR_HOME;
            END_IF
		
    END_CASE;
			
    StartDwellTimer.PT := gHMI.Parameters.ServoRamStartDwellTime;
    StartDwellTimer();
	
    //EndDwellTimer.PT := gHMI.Parameters.ServoRamEndDwellTime;
    EndDwellTimer.PT := gHMI.Parameters.ServoRamEndDwellTime; //Use existing dwell time from HMI
    EndDwellTimer();
	
				END_PROGRAM

PROGRAM _EXIT
				(* Insert code here *)
	 
				END_PROGRAM

