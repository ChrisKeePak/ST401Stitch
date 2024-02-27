

PROGRAM _INIT
	
	FOR i := 0 TO 99 DO		
		gIO.ModuleOKs[i] := TRUE;
	END_FOR;
	 
	IOAlarmText;
	
	AlarmXHistoryUISetup.AlarmListScrollWindow := 1;
	AlarmXHistoryUISetup.AlarmListSize := 6;
	
END_PROGRAM