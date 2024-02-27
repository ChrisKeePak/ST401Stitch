
{REDUND_ERROR} FUNCTION_BLOCK AxisBasic (*Implements config and basic for a mapp axis*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		pMpLink : UDINT;
		pAxis : UDINT;
		pEndlessPosition : {REDUND_UNREPLICABLE} UDINT;
		AxisInterface : REFERENCE TO Axis_Interface_typ;
		OdometerValue : LREAL;
		Override : REAL;
		ErrorReset : BOOL;
	END_VAR
	VAR
		AxisBasic : {REDUND_UNREPLICABLE} MpAxisBasic;
		AxisConfig : MpAxisBasicConfig;
		AbsDistance : LREAL;
		zzInternalMemory : ARRAY[0..40] OF SINT; (*Internal memory*)
		SetOverride : MC_SetOverride;
	END_VAR
END_FUNCTION_BLOCK
