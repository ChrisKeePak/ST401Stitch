
{REDUND_ERROR} FUNCTION_BLOCK AxisHandler (*Implements state machine for single axis handling*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		FirstHomeExecuted : REFERENCE TO BOOL;
		pInterface : REFERENCE TO Axis_Interface_typ;
		pHomingParameters : REFERENCE TO MpAxisHomingType;
		AlarmActive : BOOL;
		IsSimulated : BOOL;
	END_VAR
	VAR
		state : AxisStates_enum := 0;
		axisInitState : AxisInitStates_enum;
		DriveReadyTimeout : TON;
		SetOverride : MC_SetOverride;
	END_VAR
END_FUNCTION_BLOCK
