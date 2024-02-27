
(* TODO: Add your comment here *)
FUNCTION CheckIOModules

	brsmemset(pAlarmMsg, 0, 100);
	
	FOR i := 1 TO 99 DO
		
		IF(ModuleOKs[i] = FALSE) THEN
			
			IF (i = 1) THEN
				brsstrcat(pAlarmMsg, ADR ('Module 1 Bus Receiver'));
			ELSIF (i = 2) THEN
				brsstrcat(pAlarmMsg, ADR ('Module 2 DI 1'));
			ELSIF (i = 3) THEN
				brsstrcat(pAlarmMsg, ADR ('Module 3 D0 1'));
			ELSIF (i = 4) THEN
				brsstrcat(pAlarmMsg, ADR ('Module 4 DO 2(high wattage outputs)'));
			ELSIF (i = 5) THEN
				brsstrcat(pAlarmMsg, ADR ('Module 5 Encoder Inputs'));
			ELSIF (i = 6) THEN
				brsstrcat(pAlarmMsg, ADR ('SLX Module'));	
		
			ELSIF (i = 7) THEN
				IF NumaticsPresent THEN
				brsstrcat(pAlarmMsg, ADR ('Module 7 Pneumatics 580'));	
				END_IF
				
			END_IF
			
			IF (i=7 AND NumaticsPresent) OR (i<> 7) THEN
			brsstrcat(pAlarmMsg, ADR (' Not OK'));
			
			MpAlarmXSet(AlarmLink, ALARM_IO_MODULE_NOT_OK);	
			END_IF
			
			RETURN;
			
		END_IF
		
	END_FOR;
	
	MpAlarmXReset(AlarmLink, ALARM_IO_MODULE_NOT_OK);
	
	CheckIOModules := 1;
	
END_FUNCTION
