
(* Convert some alarm elements from Bool to Str *)
FUNCTION AlarmInfoAdapter
	
	
	IF(NumPendingAlarms = 0) THEN
		FOR i:= 0  TO 49 DO
			pAlarmListAdapter.Acknowledged[i] := '';
			pAlarmListAdapter.Active[i] := '';
			pAlarmListAdapter.Code[i] := '';
		END_FOR
	ELSE
	
		FOR i:=0 TO AlarmList.MaxSelection DO
		
			IF(AlarmList.StateAcknowledged[i] = TRUE) THEN
				pAlarmListAdapter.Acknowledged[i] := 'Yes';
			ELSE
				pAlarmListAdapter.Acknowledged[i] := 'No';
			END_IF
		
			IF(AlarmList.StateActive[i] = TRUE) THEN
				pAlarmListAdapter.Active[i] := 'Yes';
			ELSE
				pAlarmListAdapter.Active[i] := 'No';
			END_IF
		
			brsitoa(AlarmList.Code[i],ADR(pAlarmListAdapter.Code[i]));

		END_FOR;
	
		FOR i:= AlarmList.MaxSelection + 1  TO 49 DO
			pAlarmListAdapter.Acknowledged[i] := '';
			pAlarmListAdapter.Active[i] := '';
			pAlarmListAdapter.Code[i] := '';
		END_FOR
		
	END_IF
	
	AlarmInfoAdapter := TRUE;
							
END_FUNCTION
