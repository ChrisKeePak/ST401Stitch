
(* Compute how far encoder has moved *)
FUNCTION ComputeDistanceMoved
	
	IF((CurentPos -  OldPos) >= 0) THEN
		ComputeDistanceMoved := CurentPos -  OldPos;
	ELSE
		ComputeDistanceMoved := 360.0 + CurentPos -  OldPos;
	END_IF
	
END_FUNCTION
