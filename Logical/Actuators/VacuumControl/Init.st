

PROGRAM _INIT
	
	IF(gVacCtrlInterface.Parameters.BlowOffTime < 100) THEN
		gVacCtrlInterface.Parameters.BlowOffTime := 100;
	END_IF	
	 
END_PROGRAM