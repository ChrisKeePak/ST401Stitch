
(* Computes how far the ram should go in order to reach the stop position *)
FUNCTION ComputeMoveDistance
	
	IF((TargetPos -  CurrentPos) > 0) THEN
		ComputeMoveDistance := TargetPos -  CurrentPos;
	ELSE
		ComputeMoveDistance := 360.0 + TargetPos -  CurrentPos;
	END_IF
	
END_FUNCTION
