
PROGRAM _INIT
	(* Insert code here *)
	
	gHMI.Parameters.ServoHopperJogVelocity := 3.35;
	gHMI.Parameters.ServoHopperVelocity := 3.35;
	gHMI.Parameters.ServoHopperAccel := 180.0;
	
	gHMI.Parameters.ServoHopperTorqueLimit := 2.5;
	
	gHMI.Parameters.ServoHopperDwellTime := 1500; //1 s
	gHMI.Parameters.AtTorqueTime := 500; //1 s
	
	 
END_PROGRAM

PROGRAM _CYCLIC

	IF gNumActiveAlarms  > 0 THEN
		state := SERVOHOPPER_ERROR;
	END_IF
	
	IF gHighSeverityAlarmActive THEN
		state := SERVOHOPPER_ERROR;
	END_IF
	
	//make sure that torque limiting is turned on while jogging
	//	IF EDGEPOS(gHMI.Commands.JogServoHopperPos) THEN
	//		gServoHopperInterface.Commands.ToMapp.TorqueLimitingOn := TRUE;
	//	END_IF
	//	IF EDGEPOS(gHMI.Commands.JogServoHopperNeg) THEN
	//		gServoHopperInterface.Commands.ToMapp.TorqueLimitingOn := TRUE;
	//	END_IF
	
	StartDwellTimer.IN := FALSE; //clear otuside state machine. will  e set true in appropriate state
    AtTorqueTimer.IN := FALSE;
    ResetTimeoutTimer.IN := FALSE; 
    
    // If the hopper has been reset but the machine isn't running, only let the hopper run for an alotted time to protect the motor
    IF gIO.DIs.HopperMotor_RUN AND (NOT gHMI.Commands.RequestVFDRun) THEN
        ResetTimeoutTimer.IN := TRUE;
    END_IF
    IF ResetTimeoutTimer.Q THEN
        ResetTimeoutAlarm := TRUE;
    END_IF

    // Resetting clears the timeout alarms
    IF gHMI.Commands.RequestReset THEN
        ResetTimeoutAlarm := FALSE;
    END_IF


	
	CASE state OF
		
		SERVOHOPPER_WAIT_FOR_HOME:
			
			//servo ram should home automatically on machine start up. This is a direct home axis and should not rquire a home command
			IF gServoFeedInterface.Status.Homed THEN
				gServoHopperInterface.Commands.ToMapp.TorqueLimitingOn := TRUE;
				state := SERVOHOPPER_IDLE;
			END_IF
		
		SERVOHOPPER_IDLE:
		
			IF gIO.DIs.HopperMotor_RUN AND ServoHopperFirstHomeExecuted THEN
				gServoHopperInterface.Commands.ToMapp.TorqueLimitingOn := TRUE; //turn torque limiting on
				
				gServoHopperInterface.Commands.RequestMoveVelocity := TRUE;
				gServoHopperInterface.Parameters.MovementParameters.Direction := 0;
				
				state := SERVOHOPPER_MOVE_VELOCITY;
			END_IF
		
		
		SERVOHOPPER_MOVE_VELOCITY:
			
			AtTorqueTimer.IN := (gServoHopperInterface.Status.ActualTorque >= gHMI.Parameters.ServoHopperTorqueLimit *0.90);
		
			IF gIO.DIs.HopperMotor_OFF = TRUE THEN
				gServoHopperInterface.Commands.RequestMoveVelocity := FALSE;
				state := SERVOHOPPER_IDLE;
			ELSIF AtTorqueTimer.Q THEN
				gServoHopperInterface.Parameters.MovementParameters.Direction := 1;
				gServoHopperInterface.Commands.ToMapp.Update := TRUE;
				gServoHopperInterface.Commands.RequestMoveVelocity := TRUE;
				state := SERVOHOPPER_COOLDOWN;
			END_IF
			
		SERVOHOPPER_COOLDOWN:
		
			StartDwellTimer.IN := TRUE;
			
			IF gIO.DIs.HopperMotor_OFF = TRUE THEN
				gServoHopperInterface.Commands.RequestMoveVelocity := FALSE;
				state := SERVOHOPPER_IDLE;
			ELSIF StartDwellTimer.Q THEN
				gServoHopperInterface.Parameters.MovementParameters.Direction := 0;
				gServoHopperInterface.Commands.ToMapp.Update := TRUE;
				gServoHopperInterface.Commands.RequestMoveVelocity := TRUE;
				state := SERVOHOPPER_MOVE_VELOCITY;
			END_IF
		
		SERVOHOPPER_ERROR:
			
			gServoHopperInterface.Status.MoveComplete := TRUE;
			gHMI.Commands.StartServoHopper := FALSE;
		
			gServoHopperInterface.Commands.RequestMoveVelocity := FALSE;
				
			IF (gNumActiveAlarms = 0) THEN
				state := SERVOHOPPER_WAIT_FOR_HOME;
			END_IF
		
	END_CASE;
	
	StartDwellTimer.PT := gHMI.Parameters.ServoHopperDwellTime; //500 ms
	StartDwellTimer();
	
	AtTorqueTimer.PT := gHMI.Parameters.AtTorqueTime; //500 ms
	AtTorqueTimer();
	
END_PROGRAM

PROGRAM _EXIT
				(* Insert code here *)
	 
END_PROGRAM
