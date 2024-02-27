

PROGRAM _INIT

	//asign default values to parameters
	//defaults, not needed
	(*
	gModeControlInterface.Parameters.PiecesPerMinute := 10;
	gModeControlInterface.Parameters.DwellTime := 0; //ms
	gModeControlInterface.Parameters.StopPosition := 0;
	
	gAdhesiveCtrlInterface.Parameters.AdhesivePatterns[0].DelayDistance[0] := 150;
	gAdhesiveCtrlInterface.Parameters.AdhesivePatterns[1].DelayDistance[0] := 150;
	gAdhesiveCtrlInterface.Parameters.AdhesivePatterns[2].DelayDistance[0] := 150;
	gAdhesiveCtrlInterface.Parameters.AdhesivePatterns[3].DelayDistance[0] := 150;
	
	gAdhesiveCtrlInterface.Parameters.AdhesivePatterns[0].GlueOnDistance[0] := 32;
	gAdhesiveCtrlInterface.Parameters.AdhesivePatterns[1].GlueOnDistance[0] := 32;
	gAdhesiveCtrlInterface.Parameters.AdhesivePatterns[2].GlueOnDistance[0] := 32;
	gAdhesiveCtrlInterface.Parameters.AdhesivePatterns[3].GlueOnDistance[0] := 32;
	
	gAdhesiveCtrlInterface.Parameters.AdhesivePatterns[0].DelayDistance[1] := 210;
	gAdhesiveCtrlInterface.Parameters.AdhesivePatterns[1].DelayDistance[1] := 210;
	gAdhesiveCtrlInterface.Parameters.AdhesivePatterns[2].DelayDistance[1] := 210;
	gAdhesiveCtrlInterface.Parameters.AdhesivePatterns[3].DelayDistance[1] := 210;
	
	gAdhesiveCtrlInterface.Parameters.AdhesivePatterns[0].GlueOnDistance[1] := 32;
	gAdhesiveCtrlInterface.Parameters.AdhesivePatterns[1].GlueOnDistance[1] := 32;
	gAdhesiveCtrlInterface.Parameters.AdhesivePatterns[2].GlueOnDistance[1] := 32;
	gAdhesiveCtrlInterface.Parameters.AdhesivePatterns[3].GlueOnDistance[1] := 32;
	
	gAdhesiveCtrlInterface.Parameters.AdhesivePatterns[0].DelayDistance[2] := 300;
	gAdhesiveCtrlInterface.Parameters.AdhesivePatterns[1].DelayDistance[2] := 300;
	gAdhesiveCtrlInterface.Parameters.AdhesivePatterns[2].DelayDistance[2] := 300;
	gAdhesiveCtrlInterface.Parameters.AdhesivePatterns[3].DelayDistance[2] := 300;
	
	gAdhesiveCtrlInterface.Parameters.AdhesivePatterns[0].GlueOnDistance[2] := 32;
	gAdhesiveCtrlInterface.Parameters.AdhesivePatterns[1].GlueOnDistance[2] := 32;
	gAdhesiveCtrlInterface.Parameters.AdhesivePatterns[2].GlueOnDistance[2] := 32;
	gAdhesiveCtrlInterface.Parameters.AdhesivePatterns[3].GlueOnDistance[2] := 32;

	gFoldPushCtrlInterface.Parameters.BottomFolderOnPos := 100;
	gFoldPushCtrlInterface.Parameters.BottomFolderOffPos := 200;
	gFoldPushCtrlInterface.Parameters.TopFolderOnPos := 180;
	gFoldPushCtrlInterface.Parameters.TopFolderOffPos := 300;
	*)
	 
	gPassword;
	gUserLevel;
	gIO;
	
	//set these DI's true. physical IO will take over once program runs,
	//and we need to make sure we see a falling edge on these IO points so that alarms are reported
	gIO.DIs.SafetyOK := TRUE;
	gIO.SafetyStatus.BackEstopOK := TRUE;
	gIO.SafetyStatus.FrontEStopOK := TRUE;
	gIO.SafetyStatus.GuardDoorsOK := TRUE;
	gIO.DIs.AirPressureOK := TRUE;
	gIO.DIs.VacuumPressureOK := TRUE;
	gIO.DIs.AdhesiveUnitNotFaulted := TRUE;
	gIO.DIs.AdhesiveUnitReady := TRUE;
	gIO.DIs.AdhesiveLevelLow := FALSE;
	gIO.DIs.VacuumTempOK := TRUE;
	gIO.DIs.BodyHopperLow := TRUE;
	
	gAutoTune := FALSE;
	gCurrentLimitHit := FALSE;
	
	//PickDwellTime := T#
	gHMI.Parameters.PickDwellTime :=0; //Only Used With Older Style Machines
	gHMI.Parameters.PickAndPlaceDwell := 750; //750ms How Long It Takes To Grab A Box
	gHMI.Parameters.LowHopperTime := 2000; //2S Hopper Low Timer
	gHMI.Parameters.LowFeedJamTime := 3000; // 3S Bottom Photo Eye
	gHMI.Parameters.TopFeedJamTime := 10000; // 10S Top Photo Eyes
	gHMI.Parameters.VacuumOffTime := 1000; // 1S Vacuum Off Time
	gHMI.Parameters.DownPulseTime := 1000; // 1S Only Used On Y Axis Machines
	gHMI.Parameters.Y_DelayTime := 500; // 500ms Only Used On Y Axis Machines
	gHMI.Parameters.BlowOffTime := 100; // 100ms Blow Off and Vacuum Off Trigger
	gHMI.Parameters.LubeCycleCount := 5; // 5 cycles Lube Counter
	gHMI.Parameters.SetCycleCount := 25000; // 25000 Ram Servo Cycles
	
END_PROGRAM