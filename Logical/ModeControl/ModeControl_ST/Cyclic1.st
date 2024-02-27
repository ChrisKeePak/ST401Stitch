
PROGRAM _CYCLIC
	(* Insert code here *)
	
	 //SAFETY CHECKS 0001
    IF NOT gAlarmSystemActive THEN
        RETURN;
    END_IF
	
    //AIR PRESSURE ON/NOK 0002
    //Do not set air pressure alarm unless air pressure has been low for 20 seconds
    AirPressureNotOKTimer.PT := T#20s;
    AirPressureNotOKTimer.IN := (NOT gIO.DIs.AirPressureOK AND NOT gIsSimulated);
    AirPressureNotOKTimer();
    AirPressureNotOK         := AirPressureNotOKTimer.Q;
	
    //MP ALARMX CHECK STATE AIR PRESSURE LOW 0003
    AirPressureAlarmActive := MpAlarmXCheckState(gAlarmXCore, ALARM_AIR_PRESSURE_LOW, mpALARMX_STATE_ACTIVE);
	
    //MP ALARMX SET/RESET AIR PRESSURE LOW 0004 AND 0005
    //Set/clear air pressure alarm
    IF (AirPressureNotOK AND NOT AirPressureAlarmActive) THEN
        status := MpAlarmXSet(gAlarmXCore,ALARM_AIR_PRESSURE_LOW);
    ELSIF (NOT AirPressureNotOK AND AirPressureAlarmActive) THEN
        status := MpAlarmXReset(gAlarmXCore,ALARM_AIR_PRESSURE_LOW);
    END_IF
	
    //MP ALARMX CHECK STATE SAFETY OK/NOK 0006
    SafetyNotOKActive := MpAlarmXCheckState(gAlarmXCore, ALARM_SAFETY_NOTOK, mpALARMX_STATE_ACTIVE);
	
    //MP ALARMX SET/RESET SAFETY OK/NOK 0007 AND 0008
    //Set/Clear Safety Alarm
    IF (NOT gIO.DIs.SafetyOK AND NOT SafetyNotOKActive AND gIO.SafetyStatus.SafetyProgramRunning) THEN
        status := MpAlarmXSet(gAlarmXCore,ALARM_SAFETY_NOTOK);
    ELSIF (gIO.DIs.SafetyOK AND SafetyNotOKActive AND gIO.SafetyStatus.SafetyProgramRunning) THEN
        status := MpAlarmXReset(gAlarmXCore,ALARM_SAFETY_NOTOK);
    END_IF
	
    //MP ALARMX CHECK STATE GUARD DOOR 0009
    GuardDoorNotOKActive := MpAlarmXCheckState(gAlarmXCore, ALARM_SAFETY_GUARD_DOOR, mpALARMX_STATE_ACTIVE);
	
    //MP ALARMX SET/RESET GUARD DOORS 0010 AND 0011
    //Set/Clear Safety Alarm
    IF (NOT gIO.SafetyStatus.GuardDoorsOK AND NOT GuardDoorNotOKActive AND gIO.SafetyStatus.SafetyProgramRunning) THEN
        status := MpAlarmXSet(gAlarmXCore,ALARM_SAFETY_GUARD_DOOR);
    ELSIF (gIO.SafetyStatus.GuardDoorsOK AND GuardDoorNotOKActive AND gIO.SafetyStatus.SafetyProgramRunning) THEN
        status := MpAlarmXReset(gAlarmXCore,ALARM_SAFETY_GUARD_DOOR);
    END_IF
	
    //MP ALARMX CHECK STATE FRONT ESTOP 0012
    FrontEStopNotOKActive := MpAlarmXCheckState(gAlarmXCore, ALARM_SAFETY_FRONT_ESTOP, mpALARMX_STATE_ACTIVE);
	
    //MP ALARMX SET/RESET FRONT ESTOP 0013 AND 0014
    //Set/Clear Safety Alarm
    IF (NOT gIO.SafetyStatus.FrontEStopOK AND NOT FrontEStopNotOKActive AND gIO.SafetyStatus.SafetyProgramRunning) THEN
        status := MpAlarmXSet(gAlarmXCore,ALARM_SAFETY_FRONT_ESTOP);
    ELSIF (gIO.SafetyStatus.FrontEStopOK AND FrontEStopNotOKActive AND gIO.SafetyStatus.SafetyProgramRunning) THEN
        status := MpAlarmXReset(gAlarmXCore,ALARM_SAFETY_FRONT_ESTOP);
    END_IF
	
    //MP ALARMX CHECK STATE REAR ESTOP 0015
    RearEStopNotOKActive := MpAlarmXCheckState(gAlarmXCore, ALARM_SAFETY_REAR_ESTOP, mpALARMX_STATE_ACTIVE);
	
    //MP ALARMX SET/RESET REAR ESTOP 0016 AND 0017
    //Set/Clear Safety Alarm
    IF (NOT gIO.SafetyStatus.BackEstopOK AND NOT RearEStopNotOKActive AND gIO.SafetyStatus.SafetyProgramRunning) THEN
        status := MpAlarmXSet(gAlarmXCore,ALARM_SAFETY_REAR_ESTOP);
    ELSIF (gIO.SafetyStatus.BackEstopOK AND RearEStopNotOKActive AND gIO.SafetyStatus.SafetyProgramRunning) THEN
        status := MpAlarmXReset(gAlarmXCore,ALARM_SAFETY_REAR_ESTOP);
    END_IF
	
    //TURN AIR ON 0018
    //If safety is OK, Turn air On and turn off the red light
    gIO.DOs.AirOn         := gIO.DIs.SafetyOK;
    gIO.DOs.RedLightStack := NOT (gIO.DIs.SafetyOK AND NOT gModeControlInterface.Status.BlissPanelAlarmActive);
	
    //NO ALARMS GREEN LIGHT 0019
    //If there are no alarms active, turn on the green light
    gIO.DOs.GreenLightStack := NOT gAlarmActive;
	
    //ALARM YELLOW LIGHT 0020
    //If there is an active alarm, or the hopper is low, turn on yellow stack light
    gIO.DOs.AmberLightStack := (gAlarmActive OR gIO.DIs.BodyHopperLow);
		
    //DOWNSTREAM SENSOR TIMER SETUP 0021
    //Downstream sensor is OFF when blocked. If downstream sensor is blocked for a set amount of time, set the Downstream sensor input true				
    DownstreamSensorTimer.PT := gModeControlInterface.Parameters.DownstreamTimeout;
    DownstreamSensorTimer.IN := (gIO.DIs.DownstreamSensorRaw AND NOT gModeControlInterface.Parameters.DownstreamIgnored);
    DownstreamSensorTimer();
    gIO.DIs.DownstreamSensor := DownstreamSensorTimer.Q; //Writing to an input, cannot do that
    
 //   IF DownstreamBlocked THEN
 //       Vacuum_ON := FALSE;
 //       FeedInCycle := FALSE;
 //   END_IF;    //added 02/02/23
    
    ///Added 02/01/2
    //VaccumStopTimer.PT := gModeControlInterface.Parameters.VaccumStopTime;
    //VaccumStopTimer.IN := (gIO.DIs.DownstreamSensorRaw AND NOT gModeControlInterface.Parameters.DownstreamIgnored);
    //VaccumStopTimer();
    //gIO.DOs.VacuumOn := VaccumStopTimer.Q;
    
    
   // Downstream sensor when box moves counts down AND THEN starts the machine Added 01-31-23***
    //DownstreamSensorONTimer.PT := gModeControlInterface.Parameters.DownstreamClear;
    //DownstreamSensorONTimer.IN := (gModeControlInterface.Parameters.DownstreamIgnored AND NOT gIO.DIs.DownstreamSensorRaw);
    //DownstreamSensorONTimer();
    //gIO.DIs.DownstreamSensorON := DownstreamSensorONTimer.Q; //Writing to an input, cannot do that

	
    //0022 IS THE CYCLE DWEL TIMER. WE ARE LETTING THE P&P DWELL BE THE CYCLE PROCESS
	
    //FFINISH CYCLE BY PRESSING THE STOP BUTTON 0023
    //If an alarm becomes active, or someone presses the stop button, finish the cycle (deleted InfeedBoxPresent) Added RequestVFDRun
    Rtrig_AlarmActive(CLK:= gAlarmActive);
    Rtrig_HopperLow(CLK  := HoperLowStop);
    Rtrig_RequestStop(CLK:= gHMI.Commands.RequestStop);
    Rtrig_DownstreamBlocked(CLK:= DownstreamBlocked);
    Ftrig_DownstreamBlocked(CLK:= gIO.DIs.DownstreamSensor);
    Rtrig_RequestVFDRun(CLK:= gHMI.Commands.RequestVFDRun);
    IF ((Rtrig_AlarmActive.Q OR Rtrig_HopperLow.Q OR Rtrig_RequestStop.Q) AND gHMI.Commands.SelectAutoMode AND (gHMI.Commands.RequestVFDRun OR StopTriggerByDownstream)) THEN
        gModeControlInterface.Commands.FinishCycle := TRUE;
    END_IF
    IF Rtrig_DownstreamBlocked.Q AND NOT gHMI.Commands.RequestStop THEN
        gHMI.Commands.RequestStop := TRUE;
        //gIO.DOs.VacuumOn := FALSE;  //Added 02/01/23
        StopTriggerByDownstream := TRUE;
    END_IF
    IF Ftrig_DownstreamBlocked.Q AND StopTriggerByDownstream THEN
        gHMI.Commands.RequestVFDRun := TRUE;
        gHMI.Commands.RequestStop := FALSE;
        StopTriggerByDownstream := FALSE;
    END_IF
    IF  Rtrig_RequestVFDRun.Q AND StopTriggerByDownstream THEN
        StopTriggerByDownstream := FALSE;
    END_IF
	
    //DO NOT FINISH CYCLE OF ANYTHING OTHER THAN STOP BUTTON IS PRESSED 0024
    //If an alarm is active or safety is not ok or jog mode is selected, do not finish the selected cycle
    IF (gServoFeedInterface.Status.Error OR gServoHopperInterface.Status.Error OR gServoRamInterface.Status.Error OR
        gFoldPushCtrlInterface.Parameters.LinMotBotFolder.Status.Error OR gFoldPushCtrlInterface.Parameters.LinMotTopFolder.Status.Error OR
        NOT gIO.DIs.SafetyOK OR gHMI.Commands.SelectJogMode OR gHighSeverityAlarmActive OR BodyCheckError) THEN
        gModeControlInterface.Commands.FinishCycle := FALSE;
        PickAndPlaceHasBox                         := FALSE;
        PickAndPlaceDwelling                       := FALSE;
        PhotoEyeSeen                               := FALSE;
        Vacuum_ON                                  := FALSE;
        gIO.DOs.X_PickSolenoid                     := FALSE;
        gIO.DOs.BlowOffOn                          := FALSE;
        state                                      := PICKANDPLACE_ERROR;
    END_IF
	
    //DOES NOT LET MACHINE RUN IF GLUE SYSTEM HAS AN ERROR 0025
    //Do not allow machine to run if glue system has an alarm or a linmot folder has an error (Removed gLowSeverityAlarmActive)
    IF (gAdhesiveCtrlInterface.Status.AlarmActive OR gFoldPushCtrlInterface.Parameters.LinMotBotFolder.Status.Error OR gFoldPushCtrlInterface.Parameters.LinMotTopFolder.Status.Error OR
        gServoFeedInterface.Status.Error OR gServoHopperInterface.Status.Error OR gServoRamInterface.Status.Error OR 
        gLowSeverityAlarmActive OR gHighSeverityAlarmActive) THEN
        gHMI.Commands.RequestVFDRun := FALSE;
    END_IF
	
    //AUTO MODE RUN REQUEST FINISH CYCLE 0026
    //If we're in auto mode, and run request has been made or we should finish the running, set move request
    MoveVelocityRequest := (gHMI.Commands.SelectAutoMode AND (gHMI.Commands.RequestVFDRun OR gModeControlInterface.Commands.FinishCycle));
	
    //RAM POSITION AND STOP POSITION (360-0 ROLLOVER)DetermineDistanceToStopPos 0027
    DistanceFromStopPosition := DetermineDistanceToStopPos(gIO.Encoders.FeedEncoderPos, gModeControlInterface.Parameters.StopPosition);
	
    //DOWNSTREAM SENSOR BLOCKED 0028
    //If the downstream sensor is blocked and we're at the stop position, set a flag saying that we're blocked
    DownstreamBlocked := (gIO.DIs.DownstreamSensor AND gRamAtStopPosition);
	
    //MOVE WHEN DOWNSTREAM IS BLOCKED 0029
    //If we want to move but downstream is blocked, set a flag indicating this state
    gModeControlInterface.Status.WaitingOnDownstream := (MoveVelocityRequest AND DownstreamBlocked);
	
    //KEEPS SERVOS RUNNING TO FINISH CYCLE 0030
    //VFD run command was the run command for the old machine. Keep servos cycling while it is true, or while we have been commanded to stop but need to finish a cycle
    gHMI.Commands.StartServoHopper := (gHMI.Commands.RequestVFDRun OR gModeControlInterface.Commands.FinishCycle);
    gHMI.Commands.StartServoFeed   := ((gHMI.Commands.RequestVFDRun OR gModeControlInterface.Commands.FinishCycle) (*AND NOT DownstreamBlocked*) AND NOT StopFeedServo);
    gHMI.Commands.CycleServoRam    := (gHMI.Commands.RequestVFDRun OR gModeControlInterface.Commands.FinishCycle);
	
    //RISING EDGE FOR SERVOINPUT SIGNAL 0031
    Rtrig_FeedServoTMR(CLK := FeedServoTMR.Q);
    StopFeed := Rtrig_FeedServoTMR.Q;
	
    //0032 SERVO RAM TRIGGER SET IN FEED HANDLER. COMMENTED OUT
	
    //HOPPER LOW ALARM 0033
    FeedServoTMR.IN := gIO.DIs.BodyHopperLow;
    FeedServoTMR.PT := gHMI.Parameters.LowHopperTime;
    FeedServoTMR();
    IF FeedServoTMR.Q THEN
        HopperLowAlarm := TRUE;
    END_IF
	
    //FEED STOP TIMER 0034
    //Timer for the HopperLow to trigger StopFeed												
    FeedStopTimer.IN := gIO.DIs.BodyHopperLow;
    FeedStopTimer.PT := gHMI.Parameters.LowHopperTime;
    FeedStopTimer();
    HoperLowStop     := FeedStopTimer.Q;
	
    //HOPPER LOW ALARM RESET 0035
    IF NOT gIO.DIs.BodyHopperLow THEN
        HopperLowAlarm := FALSE;
    END_IF
	
    //FEED FINAL POSITION COUNTER 0036 (COMMENTED OUT, BUT TRANSLATING ANYWAY)
    Rtrig_InfeedBoxPresent(CLK := InfeedBoxPresent);
    IF Rtrig_InfeedBoxPresent.Q THEN
        FeedPositionCapture := gServoFeedInterface.Status.ActualPosition;
        FeedPosFinal        := (FeedPositionCapture + FeedServoPosSP);
    END_IF
	
    //PICK AND PLACE CYCLE START 0037 AND 0038
    //Logic that allows a pick-and-place cycle to strt. FeedInCycle is used to alert the servo ram that another box will be coming
    //In state machine
	
    //DO FOR VACUUM BLOW OFF 0039
    // this should stay outside of the state machine
    gIO.DOs.VacuumOn := ((Vacuum_ON OR gVacCtrlInterface.Commands.VenturiOnManual) AND gIO.DIs.SafetyOK);
	
    //	//VACUUM TIMER AFTER PT ELAPSED 0042
    //	//Turns the Vacuum off after the PT time has elapsed
    //	VacuumTimer.PT := gHMI.Parameters.VacuumOffTime;
    //	VacuumTimer.IN := PickAndPlaceHasBox AND Return_Trigger;
    //	VacuumTimer();
    //	BlowOff_Trigger := VacuumTimer.Q;
    //	IF VacuumTimer.Q THEN
    //		Vacuum_ON := FALSE;
    //	END_IF
    //	
    //	//DO FOR BLOWOFF WHEN VACUUM IS TURNED OFF AND SAFETY IS OK 0043
    //	//Turn on DO for vacuum blow off as soon as vacuum is turned off and safety is ok
	//	Rtrig_BlowOffTrigger(CLK := BlowOff_Trigger);
	
	//the blow-off output will obey the manual button only when it is pressed. The timer below will clear the manual blowoff button
	IF gVacCtrlInterface.Commands.BlowOffOnManual THEN
		gIO.DOs.BlowOffOn := gVacCtrlInterface.Commands.BlowOffOnManual;
	END_IF
	
//	Rtrig_BlowOffManual(CLK  := gVacCtrlInterface.Commands.BlowOffOnManual);
//	
//    IF Rtrig_BlowOffManual.Q AND gIO.DIs.SafetyOK THEN
//        gIO.DOs.BlowOffOn := TRUE;
//    ELSE gIO.DOs.BlowOffOn := FALSE;
//    END_IF
    //	
    //	//0044 IS BLOW OFF TIMER THAT WE WANT TO CONVERT INTO A DIRECT OUTPUT
	//	//Turn off blow off after user input time delay. The feed is no longer in cycle once the blowoff finishes
	// I re-enabled this code to make the manual blow off button work. The state machine will control the blowoff during auto mode - JDL 3/15/2023
    TON_BlowOff.PT := gHMI.Parameters.BlowOffTime;
    TON_BlowOff.IN := gVacCtrlInterface.Commands.BlowOffOnManual;
    TON_BlowOff();
    //	Ftrig_BlowOffOnManual(CLK := gVacCtrlInterface.Commands.BlowOffOnManual);
	IF (TON_BlowOff.Q) THEN
		gVacCtrlInterface.Commands.BlowOffOnManual := FALSE;
		gIO.DOs.BlowOffOn := FALSE;
	END_IF
    //==========================================================================================================================================================
    //==========================================================================================================================================================
	
    //PHOTO EYES SETTING AND RESETTING THE PICK AND PLACE. WANT TO REMOVE THIS AND MAKE THE PICK AND PLACE INDEPENDENT 0045
    IF (gIO.DIs.AdhesivePhotoEye AND gIO.DIs.AdhesivePhotoEye_2) THEN 
        PhotoEyeSeen := TRUE;
        //The line that should go here would write to an output, which you cannot do
    END_IF
	
    //BODY DETECT PHOTO EYE 0046
    IF gIO.DIs.BodyDetect THEN
        PhotoEyeSeen := FALSE;
    END_IF
	
    //0047
    //Latch the encoder position. this marks the start of the glue cycle
    Rtrig_PhotoEyeSeen(CLK := PhotoEyeSeen);
    IF (Rtrig_PhotoEyeSeen.Q AND gHMI.Commands.SelectAutoMode AND (gHMI.Commands.RequestVFDRun OR gModeControlInterface.Commands.FinishCycle)) THEN
        gAdhesiveCtrlInterface.Status.LatchedEncoderPos := LREAL_TO_REAL(gServoFeedInterface.Status.ActualPosition);
        DistanceAfterLatch                              := 0;
        OldEncoderPos                                   := LREAL_TO_REAL(gServoFeedInterface.Status.ActualPosition);
    END_IF
	
    //0048
    //Determine how far the ram has moved sense the photo eye was last seen
    DistanceAfterLatch := (ComputeDistanceMoved(LREAL_TO_REAL(gServoFeedInterface.Status.ActualPosition),OldEncoderPos) + DistanceAfterLatch);
	
    //0049
    OldEncoderPos := LREAL_TO_REAL(gServoFeedInterface.Status.ActualPosition);
		
    //	//PHOTO EYE TIMEOUT 0051
    //	//If the machine is running, but no box passes the photo eye for TopFeedJamTime amount of time, then raise an alarm
    //	PhotoEyeTimeout.PT      := gHMI.Parameters.TopFeedJamTime;
    //	PhotoEyeTimeout.IN      := ((gHMI.Commands.RequestVFDRun OR gModeControlInterface.Commands.FinishCycle) AND NOT PhotoEyeSeen);
    //	PhotoEyeTimeout();
    //	GluePhotoEyeAlarmActive := PhotoEyeTimeout.Q;

    //BODY PANEL TIMEOUT 0052
    //If the machine is running and a box has passed the photoeyes, but hasn't cleared the photo eye for LowFeedJamTime amount of time, then raise an alarm
    BodyPanelTimeout.PT := gHMI.Parameters.LowFeedJamTime;
    BodyPanelTimeout.IN := ((gHMI.Commands.RequestVFDRun OR gModeControlInterface.Commands.FinishCycle) AND NOT gIO.DIs.BodyDetect);
    BodyPanelTimeout();
    IF BodyPanelTimeout.Q THEN
        BodyCheckError := TRUE;
    ELSIF gHMI.Commands.RequestReset THEN
        BodyCheckError := FALSE;
    END_IF
	
    //0053 AND 0054 LUBE COUNTER
    LubricationOK := (LubeCount < gHMI.Parameters.SetCycleCount);
	
    Rtrig_LubricationCounter(CLK := gIO.DIs.LubricationCounter);
    LubricationCounter.CU    := Rtrig_LubricationCounter.Q;
    LubricationCounter.RESET := LubeReset;
    LubricationCounter.PV    := UDINT_TO_UINT(gHMI.Parameters.LubeCycleCount);
    LubricationCounter();
    CountReset               := LubricationCounter.Q;
	
    //0055 COUNT AND LUBE COUNT RESET
    LubeReset := CountReset;
    IF CountReset THEN
        LubeCount := 0;
    END_IF
	
    //CASE STATEMENT LAYOUT
    PickAndPlaceDwellTimer.IN := FALSE;
	
	
    CASE state OF
	
        PICKANDPLACE_START:
            //When RequestVFDRun goes high (start is pressed), go to move forward state
            IF (gHMI.Commands.RequestVFDRun AND NOT gModeControlInterface.Commands.FinishCycle AND NOT InfeedBoxPresent AND 
                gIO.DIs.X_PickRetracted AND gServoFeedInterface.Commands.RequestMoveVelocity AND NOT gIO.DIs.X_PickExtended AND 
                NOT PickAndPlaceHasBox AND NOT PickAndPlaceDwelling) THEN
                state := PICKANDPLACE_MOVE_FORWARD;
            END_IF
			
        PICKANDPLACE_MOVE_FORWARD:
            //Move forward, and turn vacuum on
            gIO.DOs.X_PickSolenoid := TRUE;
            FeedInCycle            := TRUE;
            Return_Trigger         := FALSE;
            Vacuum_ON              := TRUE;
            //When the P&P has extended, raise the PickAndPlaceHasBox flag and start dwelling
            IF gIO.DIs.X_PickExtended THEN
                PickAndPlaceHasBox := TRUE;
                state := PICKANDPLACE_DWELL;
            END_IF
			
        PICKANDPLACE_DWELL:
            //Dwell while the P&P is grabbing the box. Once the dwell timer finishes, send the P&P home
            PickAndPlaceDwelling := TRUE;
            PickAndPlaceDwellTimer.IN := TRUE;
            PickAndPlaceDwellTimer.PT := gHMI.Parameters.PickAndPlaceDwell;
            IF PickAndPlaceDwellTimer.Q THEN
                PickAndPlaceDwelling := FALSE;
                gIO.DOs.X_PickSolenoid := FALSE;
                Return_Trigger         := TRUE;				
                state:= PICKANDPLACE_BLOWOFF;
            END_IF
		
        PICKANDPLACE_BLOWOFF:
            //Wait for the P&P to pass sensor 11. When this happens, turn off the vacuum and turn on the BlowOff
            IF gIO.DIs.X_BlowOff THEN
                Vacuum_ON := FALSE;
                gIO.DOs.BlowOffOn := TRUE;
                state:= PICKANDPLACE_RETURN;
            END_IF
			
        PICKANDPLACE_RETURN:
            //Once the P&P has returned home,turn off the BlowOff and either continue the cyclic movement or stop
            IF gIO.DIs.X_PickRetracted THEN
                gIO.DOs.BlowOffOn := FALSE;
                PickAndPlaceHasBox := FALSE;
                IF gHMI.Commands.RequestVFDRun THEN
                    state := PICKANDPLACE_MOVE_FORWARD;
                ELSE 
                    state := PICKANDPLACE_START;
                END_IF
            END_IF
			
        PICKANDPLACE_ERROR:							
            IF (gNumActiveAlarms = 0) THEN
                state := PICKANDPLACE_START;
            END_IF
    END_CASE
	
    PickAndPlaceDwellTimer();								

	END_PROGRAM