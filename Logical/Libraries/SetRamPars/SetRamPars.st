
(* Transfer ram movement parameters from the control interface to the motion control block *)
FUNCTION SetRamPars
	
	MotionPars.Acceleration := InterfacePars.Acceleration;
	MotionPars.Deceleration := InterfacePars.Acceleration;
	MotionPars.Position := InterfacePars.Position;
	MotionPars.Direction := mpAXIS_DIR_POSITIVE;
	
	MotionPars.Jog.Acceleration := InterfacePars.Acceleration;
	MotionPars.Jog.Deceleration := InterfacePars.Acceleration;
	MotionPars.Jog.Velocity := InterfacePars.JogSpeed;

	SetRamPars := 1;
	
END_FUNCTION
