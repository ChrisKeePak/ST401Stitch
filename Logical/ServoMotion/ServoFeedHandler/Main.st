 
PROGRAM _INIT
	(* Insert code here *)
	
    gHMI.Parameters.ServoFeedJogVelocity := 50;
    gHMI.Parameters.ServoFeedVelocity := 600.0;
    gHMI.Parameters.ServoFeedAccel := 600.0;
    HoperLowStop;

	 
END_PROGRAM

PROGRAM _CYCLIC

//	IF gNumActiveAlarms  > 0 THEN
//		state := SERVOFEED_ERROR;
//	END_IF
	
    IF gHighSeverityAlarmActive THEN
        state := SERVOFEED_ERROR;
    END_IF
	
	
    CASE state OF
		
        SERVOFEED_WAIT_FOR_HOME:
			
            //servo ram should home automatically on machine start up. This is a direct home axis and should not rquire a home command
            IF gServoFeedInterface.Status.Homed THEN
                state := SERVOFEED_IDLE;
            END_IF
		
        SERVOFEED_IDLE:
		
            IF gHMI.Commands.StartServoFeed AND ServoFeedFirstHomeExecuted THEN
				
                gServoFeedInterface.Commands.RequestMoveVelocity := TRUE;
			
				
                state := SERVOFEED_MOVE_VELOCITY;
            END_IF
		
		
        SERVOFEED_MOVE_VELOCITY:
			
            //Added gDownstreamBlocked := TRUE. 07-14-22.
            IF gHMI.Commands.StartServoFeed = FALSE OR gDownstreamBlocked = TRUE THEN
                gServoFeedInterface.Commands.RequestMoveVelocity := FALSE;
                
                state := SERVOFEED_IDLE;
                //                END_IF
            END_IF
		
        SERVOFEED_ERROR:
			
            gServoFeedInterface.Status.MoveComplete := FALSE;
            gHMI.Commands.StartServoFeed := FALSE;
		
            gServoFeedInterface.Commands.RequestMoveVelocity := FALSE;
				
            IF (gNumActiveAlarms = 0) THEN
                state := SERVOFEED_WAIT_FOR_HOME;
            END_IF
		
    END_CASE;
	FeedStopTimer();
END_PROGRAM

PROGRAM _EXIT
				(* Insert code here *)
	 
END_PROGRAM

