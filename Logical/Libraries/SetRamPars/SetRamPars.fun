
FUNCTION SetRamPars : USINT (*Transfer ram movement parameters from the control interface to the motion control block*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		InterfacePars : RamCtrlInterface_Parameters_typ;
		MotionPars : REFERENCE TO MpAxisBasicParType;
	END_VAR
END_FUNCTION

FUNCTION ComputeMoveDistance : REAL (*Computes how far the ram should go in order to reach the stop position*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		TargetPos : REAL;
		CurrentPos : REAL;
	END_VAR
END_FUNCTION

FUNCTION ComputeDistanceMoved : REAL (*Compute how far encoder has moved*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		CurentPos : REAL;
		OldPos : REAL;
	END_VAR
END_FUNCTION
