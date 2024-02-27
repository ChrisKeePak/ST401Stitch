
FUNCTION AlarmInfoAdapter : BOOL (*Convert some alarm elements from Bool to Str*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		pAlarmListAdapter : REFERENCE TO AlarmListAdapter_typ;
		AlarmList : MpAlarmXListUIAlarmListType;
		NumPendingAlarms : UDINT;
	END_VAR
	VAR
		i : UINT;
	END_VAR
END_FUNCTION

FUNCTION CheckIOModules : BOOL (*TODO: Add your comment here*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		ModuleOKs : ARRAY[0..99] OF BOOL;
		AlarmLink : MpComIdentType;
		pAlarmMsg : UDINT;
	END_VAR
	VAR
		i : USINT;
	END_VAR
	VAR_INPUT
		NumaticsPresent : BOOL;
	END_VAR
END_FUNCTION
