//convert alarm code integer into a string. This let's us completely clear alarm codes for empty entries instead of entering a '0'
ACTION HistoryCodeToString: 

	FOR i:=0 TO AlarmXHistoryUIConnect.AlarmList.MaxSelection DO
		
		brsitoa(AlarmXHistoryUIConnect.AlarmList.Code[i], ADR(AlarmHistoryListAdapter.Code[i]));

	END_FOR;
	
	FOR i:= AlarmXHistoryUIConnect.AlarmList.MaxSelection + 1  TO 49 DO
		AlarmHistoryListAdapter.Code[i] := '';
	END_FOR
	
END_ACTION
