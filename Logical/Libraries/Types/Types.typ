
TYPE
	AdhesCtrlInterface_Commands_typ : 	STRUCT 
		MelterOn : BOOL;
		MelterStandbyOff : BOOL;
		MelterStandbyOn : BOOL;
		PumpsOn : BOOL;
		PurgeChannel1 : {REDUND_UNREPLICABLE} BOOL;
		PurgeChannel2 : {REDUND_UNREPLICABLE} BOOL;
		PurgeChannel3 : {REDUND_UNREPLICABLE} BOOL;
		PurgeChannel4 : {REDUND_UNREPLICABLE} BOOL;
		WriteChannelTemp : BOOL;
	END_STRUCT;
	AdhesCtrlInterface_Pars_typ : 	STRUCT 
		SavedPatterns : ARRAY[0..3]OF AdhesivePatternCollections_typ;
		AdhesivePatterns : {REDUND_UNREPLICABLE} ARRAY[0..MAX_NUM_GLUE_CHANNELS_M1]OF AdhesivePattern_typ;
		StitchPercentage : {REDUND_UNREPLICABLE} REAL;
		ChannelModulationCtrl : ARRAY[0..MAX_NUM_ONOFF_PATTERNS_M1]OF INT;
		BeadLengths : {REDUND_UNREPLICABLE} ARRAY[0..MAX_NUM_ONOFF_PATTERNS_M1]OF REAL := [4(10)];
		FeedbackIsHardwire : BOOL;
		FeedbackIsModbusTCP : BOOL;
		NordsonComms : NordsonData_typ;
		NordsonFeedbackSelection : NordsonFeedbackSelection_enum;
		NumAdhesiveChannels : {REDUND_UNREPLICABLE} USINT;
		PatternSelection : USINT;
	END_STRUCT;
	AdhesCtrlInterface_Status_typ : 	STRUCT 
		AlarmActive : {REDUND_UNREPLICABLE} BOOL;
		ATS_AddOnOverLimit : BOOL;
		ATS_AddOnUnderLimit : BOOL;
		FeederFault : {REDUND_UNREPLICABLE} BOOL;
		GlueApplicationAllowed : {REDUND_UNREPLICABLE} BOOL;
		GlueCyclePos : {REDUND_UNREPLICABLE} REAL;
		LatchedEncoderPos : {REDUND_UNREPLICABLE} REAL;
		LowLevel : {REDUND_UNREPLICABLE} BOOL;
		NordsonInStandby : BOOL;
		ServiceNeeded : {REDUND_UNREPLICABLE} BOOL;
		UnitFault : {REDUND_UNREPLICABLE} BOOL;
		UnitReady : {REDUND_UNREPLICABLE} BOOL;
	END_STRUCT;
	AdhesiveChannelColormaps_typ : 	STRUCT 
		Delay : {REDUND_UNREPLICABLE} ARRAY[0..MAX_NUM_ONOFF_PATTERNS_M1]OF USINT;
		Glue : {REDUND_UNREPLICABLE} ARRAY[0..MAX_NUM_ONOFF_PATTERNS_M1]OF USINT;
	END_STRUCT;
	AdhesiveChannelDatapoints_typ : 	STRUCT 
		Delay : {REDUND_UNREPLICABLE} ARRAY[0..MAX_NUM_ONOFF_PATTERNS_M1]OF UINT;
		Glue : {REDUND_UNREPLICABLE} ARRAY[0..MAX_NUM_ONOFF_PATTERNS_M1]OF UINT;
		RowLabel : {REDUND_UNREPLICABLE} UINT;
	END_STRUCT;
	AdhesiveCtrlInterface_typ : 	STRUCT 
		Commands : {REDUND_UNREPLICABLE} AdhesCtrlInterface_Commands_typ;
		Parameters : {REDUND_UNREPLICABLE} AdhesCtrlInterface_Pars_typ;
		Status : {REDUND_UNREPLICABLE} AdhesCtrlInterface_Status_typ;
	END_STRUCT;
	AdhesivePatternCollections_typ : 	STRUCT 
		AdhesivePatterns : ARRAY[0..MAX_NUM_GLUE_CHANNELS_M1]OF AdhesivePattern_typ;
	END_STRUCT;
	AdhesivePattern_typ : 	STRUCT 
		DelayDistance : {REDUND_UNREPLICABLE} ARRAY[0..MAX_NUM_ONOFF_PATTERNS_M1]OF REAL;
		GlueOnDistance : {REDUND_UNREPLICABLE} ARRAY[0..MAX_NUM_ONOFF_PATTERNS_M1]OF REAL;
	END_STRUCT;
	AlarmListAdapter_typ : 	STRUCT 
		Acknowledged : {REDUND_UNREPLICABLE} ARRAY[0..49]OF STRING[10];
		Active : {REDUND_UNREPLICABLE} ARRAY[0..49]OF STRING[10];
		Code : {REDUND_UNREPLICABLE} ARRAY[0..49]OF STRING[10];
	END_STRUCT;
	AxisInitStates_enum : 
		( (*Axis Control States*)
		AXIS_INIT_DONE := 500,
		AXIS_INIT_RETRIEVE_PARS := 10,
		AXIS_INIT_TRANSFER_PARS := 0,
		AXIS_INIT_WAIT_FOR_INIT := 20
		);
	AxisStates_enum : 
		( (*Axis Control States*)
		AXIS_STATE_INIT := 0,
		AXIS_STATE_POWERON_PREP := 1,
		AXIS_STATE_POWERON := 2,
		AXIS_STATE_COUPLED := 70,
		AXIS_STATE_ERROR := 999,
		AXIS_STATE_HOME := 30,
		AXIS_STATE_IDLE := 80,
		AXIS_STATE_MOVE := 90,
		AXIS_STATE_MOVE_TO_MASTER := 50,
		AXIS_STATE_MOVE_VELOCITY := 91,
		AXIS_STATE_WAIT_FOR_MASTER_READY := 85,
		AXIS_STATE_W_COUPLE := 60,
		AXIS_STATE_W_HOME := 40
		);
	Axis_enums : 
		( (*Axis enumerations*)
		CCW := 4,
		CC_LEFT := 2,
		CC_RIGHT := 3,
		CSW_LEFT := 0,
		CSW_Left11 := 11,
		CSW_Left12 := 12,
		CSW_Left13 := 13,
		CSW_Left14 := 14,
		CSW_Left15 := 15,
		CSW_Left16 := 16,
		CSW_Left17 := 17,
		CSW_Left18 := 18,
		CSW_Left19 := 19,
		CSW_RIGHT := 1,
		FOLDING_ARM_DA_LEFT := 7,
		FOLDING_ARM_DA_RIGHT := 8,
		FOLDING_BAR := 5,
		FOLDING_TOOL_HA_LEFT := 9,
		FOLDING_TOOL_HA_RIGHT := 10,
		FTCL := 6
		);
	Axis_Interface_Comds_ToMapp_typ : 	STRUCT  (*Axis Commands to Mapp*)
		CoupleToMaster : BOOL;
		Home : BOOL;
		JogNeg : BOOL;
		JogPos : BOOL;
		LoadConfig : BOOL;
		MoveAbs : BOOL;
		MoveAdditive : BOOL;
		MoveVelocity : BOOL;
		Power : BOOL;
		SaveConfig : BOOL;
		Stop : BOOL;
		TorqueLimitingOn : BOOL;
		Update : BOOL;
	END_STRUCT;
	Axis_Interface_Commands_typ : 	STRUCT  (*Axis Commands*)
		Init : BOOL;
		MoveVelocityTrigStop : BOOL;
		RequestCoupleToMaster : BOOL;
		RequestHome : BOOL;
		RequestJogNeg : BOOL;
		RequestJogPos : BOOL;
		RequestMoveAbs : BOOL;
		RequestMoveAdditive : BOOL;
		RequestMoveVelocity : BOOL;
		Stop : USINT;
		ToMapp : Axis_Interface_Comds_ToMapp_typ;
	END_STRUCT;
	Axis_Interface_Parameters_typ : 	STRUCT  (*Axis Parameters*)
		AxisAndDrivePars : MpAxisBasicConfigType;
		CouplingMaster : UDINT;
		CouplingParameters : MpAxisCouplingParType;
		MovementParameters : MpAxisBasicParType;
		TriggerDistance : REAL; (*Distance that should be moved after an axis sees a tigger event when using MC_BR_MoveVelocityTriggStop*)
	END_STRUCT;
	Axis_Interface_Status_typ : 	STRUCT  (*Axis Statuses*)
		ActualTorque : LREAL;
		ActualPosition : LREAL;
		ActualSpeed : REAL;
		AxisInitialized : BOOL;
		AxisState : STRING[50];
		ConfigCommandDone : BOOL;
		DefaultRecipeLoaded : BOOL;
		Error : BOOL;
		Homed : BOOL;
		InMotion : BOOL;
		InPosition : BOOL;
		InSync : BOOL;
		MappCommandBusy : BOOL;
		MoveComplete : BOOL;
		PoweredOn : BOOL;
		ReadyToPowerOn : BOOL;
		TriggerMoveDone : BOOL;
		AxisBasicActive : BOOL;
	END_STRUCT;
	Axis_Interface_typ : 	STRUCT  (*servo Axis Interface*)
		Commands : Axis_Interface_Commands_typ;
		Parameters : Axis_Interface_Parameters_typ;
		Status : Axis_Interface_Status_typ;
	END_STRUCT;
	BitmapSelectDatapoints_typ : 	STRUCT 
		AlarmActive : {REDUND_UNREPLICABLE} USINT;
		ResetPress : {REDUND_UNREPLICABLE} BOOL;
		RunPress : {REDUND_UNREPLICABLE} BOOL;
		StopPress : {REDUND_UNREPLICABLE} BOOL;
		VacuumPress : {REDUND_UNREPLICABLE} BOOL;
	END_STRUCT;
	Channel_typ : 	STRUCT 
		ActualPressure : REAL;
		PressureSetpoint : REAL;
	END_STRUCT;
	ColorMapDatapoints_typ : 	STRUCT 
		AdhesiveChannelsColormaps : {REDUND_UNREPLICABLE} ARRAY[0..MAX_NUM_GLUE_CHANNELS_M1]OF AdhesiveChannelColormaps_typ;
		AdhesiveSystemOK : {REDUND_UNREPLICABLE} USINT;
		AdhesiveUnitFault : {REDUND_UNREPLICABLE} USINT;
		AdhesiveUnitFeederFault : {REDUND_UNREPLICABLE} USINT;
		AdhesiveUnitLevelLow : {REDUND_UNREPLICABLE} USINT;
		AdhesiveUnitReady : {REDUND_UNREPLICABLE} USINT;
		AdhesiveUnitServiceNeeded : {REDUND_UNREPLICABLE} USINT;
		AdhesiveUseageLow : {REDUND_UNREPLICABLE} USINT;
		AirPressureOK : {REDUND_UNREPLICABLE} USINT;
		ATSAddOnOver : USINT;
		ATSAddOnUnder : USINT;
		AutoModeSelected : {REDUND_UNREPLICABLE} USINT;
		DownstreamSensorOK : {REDUND_UNREPLICABLE} USINT;
		DriveFaultOK : {REDUND_UNREPLICABLE} USINT;
		GlueSystemOK : {REDUND_UNREPLICABLE} USINT;
		JogModeSelected : {REDUND_UNREPLICABLE} USINT;
		NordsonEditTemps : USINT;
		RecipeLoaded : {REDUND_UNREPLICABLE} USINT;
		RecipeSystemBusy : {REDUND_UNREPLICABLE} USINT;
		SafetyOK : {REDUND_UNREPLICABLE} USINT;
		VacuumOK : {REDUND_UNREPLICABLE} USINT;
		VacuumPressureOK : {REDUND_UNREPLICABLE} USINT;
		VacuumPumpOn : {REDUND_UNREPLICABLE} USINT;
		Valve1OK : {REDUND_UNREPLICABLE} USINT;
		Valve2OK : {REDUND_UNREPLICABLE} USINT;
		Valve3OK : {REDUND_UNREPLICABLE} USINT;
		Valve4OK : USINT;
	END_STRUCT;
	DigitalInputs_typ : 	STRUCT 
		AdhesiveLevelLow : {REDUND_UNREPLICABLE} BOOL;
		AdhesivePhotoEye : {REDUND_UNREPLICABLE} BOOL;
		AdhesivePhotoEye_2 : {REDUND_UNREPLICABLE} BOOL;
		AdhesiveUnitNotFaulted : {REDUND_UNREPLICABLE} BOOL;
		AdhesiveUnitReady : {REDUND_UNREPLICABLE} BOOL;
		AirPressureOK : {REDUND_UNREPLICABLE} BOOL;
		BodyDetect : BOOL;
		DownstreamSensor : {REDUND_UNREPLICABLE} BOOL;
		DownstreamSensorRaw : {REDUND_UNREPLICABLE} BOOL;
		LeftEndDetect : BOOL;
		LowAdhesiveUseage : {REDUND_UNREPLICABLE} BOOL;
		Pneumatics580StatusWord3 : {REDUND_UNREPLICABLE} UINT;
		PnuematicsHWStatusV0 : BOOL;
		PnuematicsHWStatusV2 : BOOL;
		PnuematicsHWStatusV4 : BOOL;
		PnuematicsHWStatusV6 : BOOL;
		RightEndDetect : BOOL;
		SafetyOK : {REDUND_UNREPLICABLE} BOOL;
		SSI_Parallel : {REDUND_UNREPLICABLE} SSI_Paraller_typ;
		VacHigh : BOOL;
		VacLow : BOOL;
		VacuumPressureOK : {REDUND_UNREPLICABLE} BOOL;
		VacuumTempOK : {REDUND_UNREPLICABLE} BOOL;
		X_PickRetracted : BOOL;
		X_PickExtended : BOOL;
		Y_PickRetract : BOOL;
		X_BlowOff : BOOL;
		BodyHopperLow : BOOL;
		HopperMotor_RUN : BOOL;
		LubricationCounter : BOOL;
		HopperMotor_OFF : BOOL;
		DownstreamSensorON : BOOL;
	END_STRUCT;
	DigitalOutputs_typ : 	STRUCT 
		AirOn : {REDUND_UNREPLICABLE} BOOL;
		AmberLightStack : {REDUND_UNREPLICABLE} BOOL;
		BlowOffOn : BOOL;
		BottomFolder : {REDUND_UNREPLICABLE} BOOL;
		CompressionAirOn : BOOL;
		GlueChannel1 : {REDUND_UNREPLICABLE} BOOL;
		GlueChannel2 : {REDUND_UNREPLICABLE} BOOL;
		GlueChannel3 : {REDUND_UNREPLICABLE} BOOL;
		GlueChannel4 : {REDUND_UNREPLICABLE} BOOL;
		GreenLightStack : {REDUND_UNREPLICABLE} BOOL;
		HighCompression : BOOL;
		LowCompression : BOOL;
		PickAndPlace_X : BOOL;
		Pneumatics580ControlWord1 : {REDUND_UNREPLICABLE} UINT;
		PnuematicsValve0 : BOOL;
		PnuematicsValve2 : BOOL;
		PnuematicsValve4 : BOOL;
		PnuematicsValve6 : BOOL;
		PushOn : {REDUND_UNREPLICABLE} BOOL;
		RedLightStack : {REDUND_UNREPLICABLE} BOOL;
		ResetEuchner : BOOL;
		ResetSafety : {REDUND_UNREPLICABLE} BOOL;
		TopFolder : {REDUND_UNREPLICABLE} BOOL;
		VacuumOn : {REDUND_UNREPLICABLE} BOOL;
		ZeroEncoder : {REDUND_UNREPLICABLE} BOOL;
		SidePanelVacOn : BOOL;
		SidePanelVacBlowOff : BOOL;
		X_PickSolenoid : BOOL;
		Y_PickSolenoid : BOOL;
	END_STRUCT;
	Encoders_typ : {REDUND_UNREPLICABLE} 	STRUCT 
		SickSSIPos : {REDUND_UNREPLICABLE} UDINT;
		SickSSIPosDegrees : {REDUND_UNREPLICABLE} REAL;
		FeedEncoderPos : {REDUND_UNREPLICABLE} UDINT;
		FeedEncoderPosDegrees : {REDUND_UNREPLICABLE} REAL;
		RamEncoderPos : {REDUND_UNREPLICABLE} UDINT;
		RamEncoderPosDegrees : {REDUND_UNREPLICABLE} REAL;
	END_STRUCT;
	FolderTypeSelection_enum : 
		(
		FOLDER_LINMOT := 1,
		FOLDER_PNEUMATIC := 0
		);
	FoldpushCtrlInterface_Pars_typ : 	STRUCT 
		BottomFolderOffPos : REAL;
		BottomFolderOnPos : REAL;
		FolderTypeSelection : FolderTypeSelection_enum;
		HighCompressionOffPos : REAL;
		HighCompressionOnPos : REAL;
		LinMotBotFolder : LinAxis_typ;
		LinMotTopFolder : LinAxis_typ;
		LowCompressionOffPos : REAL;
		LowCompressionOnPos : REAL;
		NumaticsTypeSelection : NumaticsTypeSelection_enum;
		PushOff : {REDUND_UNREPLICABLE} REAL;
		PushOn : {REDUND_UNREPLICABLE} REAL;
		TopFolderOffPos : REAL;
		TopFolderOnPos : REAL;
	END_STRUCT;
	FoldpushCtrlInterface_Status_typ : 	STRUCT 
		BottomFoldValveStatus : {REDUND_UNREPLICABLE} BOOL;
		CompOnValveStatus : BOOL;
		CompressionAllowed : BOOL;
		FoldersActuationAllowed : {REDUND_UNREPLICABLE} BOOL;
		HardwireConfig : BOOL;
		LinMotConfig : BOOL;
		PneumaticConfig : BOOL;
		PowelinkConfig : BOOL;
		PushValveStatus : {REDUND_UNREPLICABLE} BOOL;
		TopFoldValveStatus : {REDUND_UNREPLICABLE} BOOL;
	END_STRUCT;
	FoldPushCtrlInterface_typ : 	STRUCT 
		Commands : {REDUND_UNREPLICABLE} FoldPushCtrlInt_Commands_typ;
		Parameters : {REDUND_UNREPLICABLE} FoldpushCtrlInterface_Pars_typ;
		Status : {REDUND_UNREPLICABLE} FoldpushCtrlInterface_Status_typ;
	END_STRUCT;
	FoldPushCtrlInt_Commands_typ : 	STRUCT 
		placehold : {REDUND_UNREPLICABLE} BOOL;
	END_STRUCT;
	HMIControl_Commands_typ : 	STRUCT 
		CancelBoxChange : BOOL;
		ConfirmBoxChange : BOOL;
		CycleServoHopper : BOOL;
		CycleServoRam : BOOL;
		HomeServoFeed : BOOL;
		HomeServoHopper : BOOL;
		HomeServoRam : BOOL;
		JogForward : BOOL;
		JogReverse : BOOL;
		JogServoFeedNeg : BOOL;
		JogServoFeedPos : BOOL;
		JogServoHopperNeg : BOOL;
		JogServoHopperPos : BOOL;
		JogServoRamNeg : BOOL;
		JogServoRamPos : BOOL;
		LoadRecipe : BOOL;
		LoadRecipeType1 : BOOL;
		LoadRecipeType2 : BOOL;
		RequestBoxType1 : BOOL;
		RequestBoxType2 : BOOL;
		RequestReset : BOOL;
		RequestStop : BOOL;
		RequestVacuumOn : BOOL;
		RequestVFDRun : BOOL;
		SaveRecipe : BOOL;
		SelectAutoMode : BOOL;
		SelectJogMode : BOOL;
		StartServoFeed : BOOL;
		StartServoHopper : BOOL;
		ZeroEncoder : BOOL;
		EnableShowMode : BOOL;
	END_STRUCT;
	HMIControl_Parameters_typ : 	STRUCT 
		ServoFeedAccel : REAL;
		ServoFeedJogVelocity : REAL;
		ServoFeedTorqueLimit : REAL;
		ServoFeedVelocity : REAL;
		ServoHopperAccel : REAL;
		ServoHopperEndDwellTime : UDINT;
		ServoHopperEndPosition : REAL;
		ServoHopperJogVelocity : REAL;
		ServoHopperStartDwellTime : UDINT;
		ServoHopperStartPosition : REAL;
		ServoHopperTorqueLimit : REAL;
		ServoHopperVelocity : REAL;
		ServoRamAccel : REAL;
		ServoRamEndDwellTime : UDINT;
		ServoRamEndPosition : REAL;
		ServoRamJogVelocity : REAL;
		ServoRamStartDwellTime : UDINT;
		ServoRamStartPosition : REAL;
		ServoRamTorqueLimit : REAL;
		ServoRamNegativeVelocity : REAL;
		ServoRamPositiveVelocity : REAL;
		ServoRamClearPosition : REAL;
		PickAndPlaceDwell : UDINT;
		ServoHopperDwellTime : UDINT;
		AtTorqueTime : UDINT;
		PickDwellTime : UDINT;
		TopFeedJamTime : UDINT;
		VacuumOffTime : UDINT;
		DownPulseTime : UDINT;
		Y_DelayTime : UDINT;
		BlowOffTime : UDINT;
		SetCycleCount : UDINT;
		LubeCycleCount : UDINT;
		LowFeedJamTime : UDINT;
		LowHopperTime : UDINT;
	END_STRUCT;
	HMIControl_typ : 	STRUCT 
		BitmapSelectDatapoints : {REDUND_UNREPLICABLE} BitmapSelectDatapoints_typ;
		ColorMapDatapoints : {REDUND_UNREPLICABLE} ColorMapDatapoints_typ;
		Commands : {REDUND_UNREPLICABLE} HMIControl_Commands_typ;
		Parameters : HMIControl_Parameters_typ;
		StatusDatapoints : {REDUND_UNREPLICABLE} StatusDatapoints_typ;
	END_STRUCT;
	Home_Parameters_typ : 	STRUCT  (*Axis Homing Parameters*)
		ServoFeed : MpAxisHomingType;
		ServoHopper : MpAxisHomingType;
		ServoRam : MpAxisHomingType;
	END_STRUCT;
	IO_typ : 	STRUCT 
		DIs : {REDUND_UNREPLICABLE} DigitalInputs_typ;
		DOs : {REDUND_UNREPLICABLE} DigitalOutputs_typ;
		Encoders : {REDUND_UNREPLICABLE} Encoders_typ;
		ModuleOKs : {REDUND_UNREPLICABLE} ARRAY[0..99]OF BOOL;
		SafetyStatus : SafetyStatus_typ;
	END_STRUCT;
	LightStack_typ : 
		(
		LIGHTSTACK_PATLITE := 1,
		LIGHTSTACK_TRI := 0
		);
	LinAxisCommand_typ : 	STRUCT  (*Axis command type*)
		ErrorReset : BOOL; (*Reset error command*)
		Home : BOOL; (*Home command*)
		HomeRequest : BOOL; (*Request for home from HMI*)
		JogNegative : BOOL; (*Jog neg command*)
		JogNegativeRequest : BOOL; (*Request for jog negative*)
		JogPositive : BOOL; (*Jog pos command*)
		JogPositiveRequest : BOOL; (*Request for jog positive*)
		MoveAbsolute : BOOL; (*Move absolute command*)
		MoveAbsoluteRequest : BOOL; (*Request for move absolute*)
		MoveAdditive : BOOL; (*Move additive command*)
		Power : BOOL; (*Power command*)
		SaveConfig : BOOL;
		Stop : BOOL; (*Stop command*)
	END_STRUCT;
	LinAxisParameter_typ : 	STRUCT  (*Axis parameter type*)
		ExtendAccel : REAL;
		ExtendDecel : REAL;
		ExtendPos : LREAL;
		ExtendSpeed : REAL;
		MpBasicConfig : MpAxisBasicConfigType; (*Axis configuration parameters for change at runtime*)
		MpBasicParameters : MpAxisBasicParType; (*Mp params*)
		RetractAccel : REAL;
		RetractDecel : REAL;
		RetractPos : LREAL;
		RetractSpeed : REAL;
	END_STRUCT;
	LinAxisStatus_typ : 	STRUCT  (*Axis status type*)
		EndlessPosValid : BOOL; (*Endless position is valid*)
		Error : BOOL; (*Error active on axis*)
		ErrorId : DINT; (*Error id*)
		HomeCheck : BOOL;
		Info : MpAxisBasicInfoType;
		InPosition : BOOL; (*Axis in position*)
		IsHomed : BOOL; (*Axis is homed*)
		MoveActive : BOOL; (*Move is active on the axis*)
		Position : LREAL; (*Current position of axis*)
		PowerOn : BOOL; (*Axis is on*)
		Ready : BOOL; (*Axis is in standstill and homed*)
		Stopped : BOOL; (*Axis is stopped*)
		Velocity : REAL; (*Current velocity of axis*)
	END_STRUCT;
	LinAxis_typ : 	STRUCT  (*Axis type*)
		Command : LinAxisCommand_typ; (*Command*)
		Parameter : LinAxisParameter_typ; (*Parameter*)
		Status : LinAxisStatus_typ; (*Status*)
	END_STRUCT;
	LinMotState_enum : 
		(
		STATE_ERROR,
		STATE_HOME_CHECK,
		STATE_HOME_RESTORE,
		STATE_HOME_STANDBY,
		STATE_HOME_TORQUE,
		STATE_INIT,
		STATE_IS_HOMED,
		STATE_JOG_NEG,
		STATE_JOG_POS,
		STATE_MOVE,
		STATE_READY
		);
	ModeCtrlInterface_Commands_typ : {REDUND_UNREPLICABLE} 	STRUCT 
		FinishCycle : {REDUND_UNREPLICABLE} BOOL;
		ForceSafetyReset : {REDUND_UNREPLICABLE} BOOL;
		Reset : {REDUND_UNREPLICABLE} BOOL;
		Run : {REDUND_UNREPLICABLE} BOOL;
		SetAutoMode : {REDUND_UNREPLICABLE} BOOL;
		SetJogMode : {REDUND_UNREPLICABLE} BOOL;
		Stop : {REDUND_UNREPLICABLE} BOOL;
		SetShowMode : {REDUND_UNREPLICABLE} BOOL;
	END_STRUCT;
	ModeCtrlInterface_Parameters_typ : 	STRUCT 
		BottomSensor : BOOL;
		DownstreamClear : UDINT := 1000;
		DownstreamIgnored : BOOL;
		DownstreamTimeout : UDINT := 1000;
		DwellTime : {REDUND_UNREPLICABLE} UDINT;
		InPositionTolerance : REAL := 10.0;
		LightStackSelection : LightStack_typ;
		MachineType : USINT;
		MaxPPM : UINT;
		MinPPM : UINT;
		PiecesPerMinute : {REDUND_UNREPLICABLE} UINT;
		SideSensors : BOOL;
		StopPosition : {REDUND_UNREPLICABLE} REAL;
		VaccumStopTime : UDINT := 200;
	END_STRUCT;
	ModeCtrlInterface_Status_typ : 	STRUCT 
		AtStopPosition : {REDUND_UNREPLICABLE} BOOL;
		BlissPanelAlarmActive : BOOL;
		Dwelling : {REDUND_UNREPLICABLE} BOOL;
		DwellModeEnabled : {REDUND_UNREPLICABLE} BOOL;
		InAutoMode : {REDUND_UNREPLICABLE} BOOL;
		InBlissPanelWindow : BOOL;
		Jogging : {REDUND_UNREPLICABLE} BOOL;
		MachineIsBliss : BOOL;
		Running : {REDUND_UNREPLICABLE} BOOL;
		WaitingOnDownstream : BOOL;
	END_STRUCT;
	ModeCtrlInterface_typ : 	STRUCT 
		Commands : {REDUND_UNREPLICABLE} ModeCtrlInterface_Commands_typ;
		Parameters : {REDUND_UNREPLICABLE} ModeCtrlInterface_Parameters_typ;
		Status : ModeCtrlInterface_Status_typ;
	END_STRUCT;
	NordsonData_typ : 	STRUCT 
		AdhesiveUsePerHour : UDINT;
		Alert : BOOL;
		ByPassFeedback : BOOL;
		ChannelActTemp : ARRAY[0..NUM_NORDSON_TEMP_ZONES_M1]OF UINT;
		ChannelDataCmpResult : DINT;
		ChannelDataSize : UDINT;
		ChannelSetTempActual : ARRAY[0..NUM_NORDSON_TEMP_ZONES_M1]OF UINT;
		ChannelSetTempRequested : ARRAY[0..NUM_NORDSON_TEMP_ZONES_M1]OF UINT;
		CommFault : BOOL;
		CommFaultInDataValue : BOOL;
		ConsecutiveErrorCount : USINT;
		FeedbackTime : TIME := T#1s;
		HeatUpPhaseActive : BOOL;
		HoseSetTemp : UINT;
		MelterIsOn : BOOL;
		MelterStatus : UINT;
		PumpStartUpProtectionOn : BOOL;
		ShutDown : BOOL;
		StandbyTimeoutTime : TIME := T#2h;
		TempUnit : USINT;
		UnitFaulted : BOOL;
		UnitReady : BOOL;
	END_STRUCT;
	NordsonFeedbackSelection_enum : 
		(
		NORDSON_HARDWIRE := 0,
		NORDSON_MODBUSTCP := 1
		);
	NordsonRxPacket_typ : 	STRUCT 
		Byte0_1_Status : UINT;
		Byte2_Ack_Data_Index : USINT;
		Byte3_Ack_Channel_Num : USINT;
		Byte4_5_Read_Data_0 : UINT;
		Byte6_7_Read_Data_1 : UINT;
		Byte8_9_Read_Data_2 : UINT;
		Byte10_11_Read_Data_3 : UINT;
		Byte12_13_Read_Data_4 : UINT;
		Byte14_15_Read_Data_5 : UINT;
	END_STRUCT;
	NordsonTxPacket_typ : 	STRUCT 
		Byte0_MelterControl : USINT;
		Byte1_Command : USINT;
		Byte2_Data_Index : USINT;
		Byte3_Channel_Num : USINT;
		Byte4_5_WriteData : UINT;
		Byte6_7_Mot1Spd : UINT;
		Byte8_9_Mot2Spd : UINT;
		Byte10_11_Mot3Spd : UINT;
		Byte12_13_Mot4Spd : UINT;
		Byte14_15_NotUsed : UINT;
	END_STRUCT;
	NumaticsTypeSelection_enum : 
		(
		NUMATICS_HARDWIRE,
		NUMATICS_POWERLINK
		);
	RamControlInterface_typ : 	STRUCT 
		Commands : {REDUND_UNREPLICABLE} RamCtrlInterface_Commands_typ;
		Parameters : {REDUND_UNREPLICABLE} RamCtrlInterface_Parameters_typ;
		Status : {REDUND_UNREPLICABLE} RamCtrlInterface_Status_typ;
	END_STRUCT;
	RamCtrlInterface_Commands_typ : 	STRUCT 
		Home : {REDUND_UNREPLICABLE} BOOL;
		JogNegative : {REDUND_UNREPLICABLE} BOOL;
		JogPositive : {REDUND_UNREPLICABLE} BOOL;
		MoveAbsolute : {REDUND_UNREPLICABLE} BOOL;
		MoveAdditive : {REDUND_UNREPLICABLE} BOOL;
		MoveVelocity : {REDUND_UNREPLICABLE} BOOL;
		PowerOn : {REDUND_UNREPLICABLE} BOOL;
		VFDAlarmReset : {REDUND_UNREPLICABLE} BOOL;
	END_STRUCT;
	RamCtrlInterface_Parameters_typ : 	STRUCT 
		Acceleration : {REDUND_UNREPLICABLE} REAL;
		CurrentLimit : {REDUND_UNREPLICABLE} REAL;
		GearRatio : REAL := 54;
		JogSpeed : {REDUND_UNREPLICABLE} REAL;
		Position : {REDUND_UNREPLICABLE} REAL;
	END_STRUCT;
	RamCtrlInterface_Status_typ : 	STRUCT 
		ActualPosition : {REDUND_UNREPLICABLE} LREAL;
		ActualSpeed : {REDUND_UNREPLICABLE} LREAL;
		AlarmActive : {REDUND_UNREPLICABLE} BOOL;
		DriveSpeed : {REDUND_UNREPLICABLE} INT;
		Home : {REDUND_UNREPLICABLE} BOOL;
		InPosition : {REDUND_UNREPLICABLE} BOOL;
		MotorCurrent : {REDUND_UNREPLICABLE} UINT;
		MoveActive : {REDUND_UNREPLICABLE} BOOL;
		Position : {REDUND_UNREPLICABLE} REAL;
		PoweredOn : {REDUND_UNREPLICABLE} BOOL;
		Running : {REDUND_UNREPLICABLE} BOOL;
		Stopped : BOOL;
		STOStatus : UINT;
		VFDAlarmDetected : {REDUND_UNREPLICABLE} BOOL;
		VFDAlarmNumber : {REDUND_UNREPLICABLE} INT;
		VFDAlarmText : {REDUND_UNREPLICABLE} STRING[80];
	END_STRUCT;
	RecipeCtrlInterface_Commands_typ : 	STRUCT 
		ChangeRecipe : BOOL;
		LoadRecipe : {REDUND_UNREPLICABLE} BOOL;
		SaveRecipe : {REDUND_UNREPLICABLE} BOOL;
	END_STRUCT;
	RecipeCtrlInterface_Pars_typ : 	STRUCT 
		RecipeIndex : USINT;
		RecipeName : {REDUND_UNREPLICABLE} STRING[100];
	END_STRUCT;
	RecipeCtrlInterface_Status_typ : 	STRUCT 
		Busy : {REDUND_UNREPLICABLE} BOOL;
		LoadedRecipeIndex : USINT;
		LoadedRecipeName : {REDUND_UNREPLICABLE} STRING[255];
		RecipeHasBeenLoaded : BOOL;
	END_STRUCT;
	RecipeCtrlInterface_typ : 	STRUCT 
		Commands : {REDUND_UNREPLICABLE} RecipeCtrlInterface_Commands_typ;
		Parameters : {REDUND_UNREPLICABLE} RecipeCtrlInterface_Pars_typ;
		Status : {REDUND_UNREPLICABLE} RecipeCtrlInterface_Status_typ;
	END_STRUCT;
	Register_typ : 	STRUCT 
		ChannelActualPressureWord : UDINT;
		ChannelSetPressureWord : UDINT;
		TankActualLevelWord : UINT;
	END_STRUCT;
	SafetyStatus_typ : 	STRUCT 
		BackEstopOK : BOOL;
		CabinetEStopStatus : UINT;
		FrontEStopOK : BOOL;
		GuardDoorsOK : BOOL;
		SafetyProgramRunning : BOOL;
	END_STRUCT;
	SSI_Paraller_typ : {REDUND_UNREPLICABLE} 	STRUCT 
		Bits : {REDUND_UNREPLICABLE} ARRAY[0..15]OF BOOL;
		FeedBits : {REDUND_UNREPLICABLE} ARRAY[0..15]OF BOOL;
		RamBits : {REDUND_UNREPLICABLE} ARRAY[0..15]OF BOOL;
	END_STRUCT;
	StatusDatapoints_typ : 	STRUCT 
		AdhesiveChannelSDPs : {REDUND_UNREPLICABLE} ARRAY[0..MAX_NUM_GLUE_CHANNELS_M1]OF AdhesiveChannelDatapoints_typ;
		AdhesivePatternDialogSDP : UINT := 1;
		AdhesivePatternConfirmDialogSDP : UINT := 1;
		AdhesivePatternConfirmedSDP : UINT;
		AdhesiveUnitFaultSDP : {REDUND_UNREPLICABLE} UINT;
		AdhesiveUnitLevelLowSDP : {REDUND_UNREPLICABLE} UINT;
		AdhesiveUnitNotReadySDP : {REDUND_UNREPLICABLE} UINT;
		AdhesiveUseageLowSDP : {REDUND_UNREPLICABLE} UINT;
		AutoModeSDP : {REDUND_UNREPLICABLE} UINT;
		BlissSDP : UINT;
		HardwireValveSDP : USINT;
		JogStatusDatapoint : {REDUND_UNREPLICABLE} UINT;
		LinMotBotHomeSDP : UINT;
		LinMotSDP : UINT;
		LinMotTopHomeSDP : UINT;
		LinMotTuningSDP : UINT;
		MaintenanceSDP : {REDUND_UNREPLICABLE} UINT;
		MotorVacuumSDP : UINT;
		NordsonModbusSDP : UINT;
		NordsonStandbyOffSDP : UINT;
		PnuematicFolderSDP : UINT;
		RecipeDialogSDP : UINT;
		RecipeIndexSDP : UINT;
		RecipeReq1SDP : UINT;
		RecipeReq2SDP : UINT;
		RestartInhibitSDP : UINT;
		SafetyStartingSDP : UINT;
		ServoLayerSDP : {REDUND_UNREPLICABLE} UINT;
		ServoRamHomeSDP : UINT;
		SmartVacuumLayerSDP : {REDUND_UNREPLICABLE} UINT;
		TraySDP : UINT;
		VacuumPressureFaultSDP : {REDUND_UNREPLICABLE} UINT;
		VenturiVacuumSDP : UINT;
		ZeroEncoderSDP : {REDUND_UNREPLICABLE} UINT;
		HopperLowSDP : UINT;
		HomeServoRamSDP : UINT;
		LubeSDP : UINT;
	END_STRUCT;
	Tank_typ : 	STRUCT 
		ActualLevel : REAL;
	END_STRUCT;
	VacCtrlConfig_enum : 
		(
		VAC_MOTOR := 0,
		VAC_VENTURI := 1
		);
	VacCtrlInterface_Commands_typ : 	STRUCT 
		BlowOffOnManual : BOOL;
		VacuumOn : {REDUND_UNREPLICABLE} BOOL;
		VenturiOn : BOOL;
		VenturiOnManual : BOOL;
	END_STRUCT;
	VacCtrlInterface_Parameters_typ : 	STRUCT 
		BlowOffTime : UINT;
		ManualVenturiVacuumOff : BOOL;
		VacConfig : VacCtrlConfig_enum;
		VacOffPos : REAL;
		VacOnPos : REAL;
	END_STRUCT;
	VacCtrlInterface_Status_typ : 	STRUCT 
		AlarmActive : {REDUND_UNREPLICABLE} BOOL;
		Pressure : {REDUND_UNREPLICABLE} REAL;
		StandstillTimout : BOOL;
		StandstillTimoutSet : BOOL;
		VacLowAlarm : BOOL;
		VacLowCycle : BOOL;
	END_STRUCT;
	VacCtrlInterface_typ : 	STRUCT 
		Commands : {REDUND_UNREPLICABLE} VacCtrlInterface_Commands_typ;
		Parameters : {REDUND_UNREPLICABLE} VacCtrlInterface_Parameters_typ;
		Status : {REDUND_UNREPLICABLE} VacCtrlInterface_Status_typ;
	END_STRUCT;
END_TYPE
