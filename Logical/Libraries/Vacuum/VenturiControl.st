
(* Venturi Control *)
FUNCTION VenturiControl
	
	IF(Enable = FALSE) THEN
		VenturiControl := FALSE;
	ELSE
		
	
		//if on pos equal to off position, do not turn on vacuum
		IF(OnPos = OffPos) THEN
			RETURN;
		END_IF
	
		IF((EncoderPosition >= OnPos) AND (EncoderPosition <= OffPos)) THEN
			VenturiControl := TRUE;
		END_IF
	END_IF
	
	
END_FUNCTION
