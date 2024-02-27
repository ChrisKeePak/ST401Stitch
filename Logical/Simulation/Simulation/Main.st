
PROGRAM _INIT
	
	gIO.DIs.SafetyOK := TRUE;
	gIO.SafetyStatus.SafetyProgramRunning := TRUE;
	
		TON_Test.PT := T#300ms;
	
END_PROGRAM

PROGRAM _CYCLIC
	
	//DetermineDistanceToStopPos(gIO.Encoders.SickSSIPosDegrees, 
	
	TON_Test.IN := NOT TON_Test.Q;
//	TON_Test.PT := T#100ms;
	IF EDGEPOS(TON_Test.Q) THEN
		gIO.Encoders.SickSSIPosDegrees := gIO.Encoders.SickSSIPosDegrees + 1;
	END_IF
	IF (gIO.Encoders.SickSSIPosDegrees > 360) THEN
		gIO.Encoders.SickSSIPosDegrees := 0;
	END_IF
	TON_Test();
		 
END_PROGRAM


