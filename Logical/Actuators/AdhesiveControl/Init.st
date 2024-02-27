

PROGRAM _INIT
	(* Insert code here *)
	gAdhesiveCtrlInterface.Parameters.NumAdhesiveChannels := 4; 
	
	DistanceAfterLatch := 99999; //make this large so that the machine doesn't start dispensing glue before it ever sees a photo eye. This will reset to 0 and count up once the photo eye is seen
	
END_PROGRAM