
FUNCTION GluePatternControl : BOOL (*Turns glue channel on off at assigned positions*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		ChannelPattern : AdhesivePattern_typ;
		PositionInCycle : REAL;
		StitchPercentage : REAL;
		BeadLengths : ARRAY[0..MAX_NUM_ONOFF_PATTERNS_M1] OF REAL;
		OnDelayCompensation : REAL;
		OffDelayCompensation : REAL;
		Switches : REFERENCE TO ARRAY[0..MAX_NUM_ONOFF_PATTERNS_M1] OF Switches;
		ChannelModulationCtrl : INT;
	END_VAR
	VAR
		i : USINT;
		j : INT;
		NumOfBeads : ARRAY[0..MAX_NUM_ONOFF_PATTERNS_M1] OF INT;
		GlueLength : ARRAY[0..MAX_NUM_ONOFF_PATTERNS_M1] OF REAL;
		GapLength : ARRAY[0..MAX_NUM_ONOFF_PATTERNS_M1] OF REAL;
		EndCapLength : ARRAY[0..MAX_NUM_ONOFF_PATTERNS_M1] OF REAL;
	END_VAR
END_FUNCTION

FUNCTION SetPatternSDPs : BOOL (*Sets adhesive pattern SDPs based on machine parameters and conditions*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		NumGlueChannels : USINT;
		FieldColormaps : REFERENCE TO ColorMapDatapoints_typ;
		FieldSDPs : REFERENCE TO StatusDatapoints_typ;
	END_VAR
	VAR
		j : INT;
		i : USINT;
	END_VAR
END_FUNCTION
