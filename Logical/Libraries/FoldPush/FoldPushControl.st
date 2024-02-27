
(* Fold Push Control *)
FUNCTION FoldPushControl
	
	FoldPushControl := FALSE;
	
	//if on pos equal to off position, do not turn on pushers/folders
	IF(OnPos = OffPos) THEN
		RETURN;
	END_IF
	
	IF((EncoderPosition >= OnPos) AND (EncoderPosition <= OffPos)) THEN
		FoldPushControl := TRUE;
	END_IF
	
	
END_FUNCTION
