PROGRAM _CYCLIC
<?xml version="1.0"?>
<?AutomationStudio Version=3.0.71?>
<!-- Automation Studio Generated XML Section -->
<networks maxcolumn="0">
	<network label="" comment="Alarm system needs to be active before any of our tasks try to run, or we could miss an alarm" row="1" column="0" commented="0">
		<row>
			<contact type="closed" name="gAlarmSystemActive"/>
			<line/>
			<line/>
			<coil type="return"/>
		</row>
	</network>
	<network label="" comment="Do not set air pressure alarm unless air pressure has been low for 20 seconds" row="3" column="0" commented="0">
		<row>
			<empty/>
			<empty/>
			<functionblock position="header" name="AirPressureNotOKTimer" type="TON"/>
			<empty/>
		</row>
		<row>
			<contact type="closed" name="gIO.DIs.AirPressureOK"/>
			<contact type="closed" name="gIsSimulated"/>
			<functionblock position="top" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="AirPressureNotOK"/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="T#20s"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<analog type="input" name="gAlarmXCore"/>
			<function position="top" type="MpAlarmXCheckState"><input name="MpLink"/><output name="1"/></function>
			<coil type="open" name="AirPressureAlarmActive"/>
		</row>
		<row>
			<analog type="input" name="ALARM_AIR_PRESSURE_LOW"/>
			<function position="middle" type="MpAlarmXCheckState"><input name="Name"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="mpALARMX_STATE_ACTIVE"/>
			<function position="bottom" type="MpAlarmXCheckState"><input name="State"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="Set/clear air pressure alarm" row="3" column="0" commented="0">
		<row>
			<contact type="open" name="AirPressureNotOK"/>
			<contact type="closed" name="AirPressureAlarmActive"/>
			<function position="top" type="MpAlarmXSet"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="gAlarmXCore"/>
			<function position="middle" type="MpAlarmXSet"><input name="MpLink"/><output name="7"/></function>
			<analog type="output" name="status"/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="ALARM_AIR_PRESSURE_LOW"/>
			<function position="bottom" type="MpAlarmXSet"><input name="Name"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="closed" name="AirPressureNotOK"/>
			<contact type="open" name="AirPressureAlarmActive"/>
			<function position="top" type="MpAlarmXReset"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="gAlarmXCore"/>
			<function position="middle" type="MpAlarmXReset"><input name="MpLink"/><output name="4"/></function>
			<analog type="output" name="status"/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="ALARM_AIR_PRESSURE_LOW"/>
			<function position="bottom" type="MpAlarmXReset"><input name="Name"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<analog type="input" name="gAlarmXCore"/>
			<function position="top" type="MpAlarmXCheckState"><input name="MpLink"/><output name="1"/></function>
			<coil type="open" name="SafetyNotOKActive"/>
		</row>
		<row>
			<analog type="input" name="ALARM_SAFETY_NOTOK"/>
			<function position="middle" type="MpAlarmXCheckState"><input name="Name"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="mpALARMX_STATE_ACTIVE"/>
			<function position="bottom" type="MpAlarmXCheckState"><input name="State"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="Set/Clear Safety Alarm" row="3" column="0" commented="0">
		<row>
			<contact type="closed" name="gIO.DIs.SafetyOK"/>
			<contact type="closed" name="SafetyNotOKActive"/>
			<contact type="open" name="gIO.SafetyStatus.SafetyProgramRunning"/>
			<function position="top" type="MpAlarmXSet"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<analog type="input" name="gAlarmXCore"/>
			<function position="middle" type="MpAlarmXSet"><input name="MpLink"/><output name="7"/></function>
			<analog type="output" name="status"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<analog type="input" name="ALARM_SAFETY_NOTOK"/>
			<function position="bottom" type="MpAlarmXSet"><input name="Name"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="open" name="gIO.DIs.SafetyOK"/>
			<contact type="open" name="SafetyNotOKActive"/>
			<contact type="open" name="gIO.SafetyStatus.SafetyProgramRunning"/>
			<function position="top" type="MpAlarmXReset"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<analog type="input" name="gAlarmXCore"/>
			<function position="middle" type="MpAlarmXReset"><input name="MpLink"/><output name="4"/></function>
			<analog type="output" name="status"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<analog type="input" name="ALARM_SAFETY_NOTOK"/>
			<function position="bottom" type="MpAlarmXReset"><input name="Name"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<analog type="input" name="gAlarmXCore"/>
			<function position="top" type="MpAlarmXCheckState"><input name="MpLink"/><output name="1"/></function>
			<coil type="open" name="GuardDoorNotOKActive"/>
		</row>
		<row>
			<analog type="input" name="ALARM_SAFETY_GUARD_DOOR"/>
			<function position="middle" type="MpAlarmXCheckState"><input name="Name"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="mpALARMX_STATE_ACTIVE"/>
			<function position="bottom" type="MpAlarmXCheckState"><input name="State"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="Set/Clear Safety Alarm" row="3" column="0" commented="0">
		<row>
			<contact type="closed" name="gIO.SafetyStatus.GuardDoorsOK"/>
			<contact type="closed" name="GuardDoorNotOKActive"/>
			<contact type="open" name="gIO.SafetyStatus.SafetyProgramRunning"/>
			<function position="top" type="MpAlarmXSet"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<analog type="input" name="gAlarmXCore"/>
			<function position="middle" type="MpAlarmXSet"><input name="MpLink"/><output name="7"/></function>
			<analog type="output" name="status"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<analog type="input" name="ALARM_SAFETY_GUARD_DOOR"/>
			<function position="bottom" type="MpAlarmXSet"><input name="Name"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="open" name="gIO.SafetyStatus.GuardDoorsOK"/>
			<contact type="open" name="GuardDoorNotOKActive"/>
			<contact type="open" name="gIO.SafetyStatus.SafetyProgramRunning"/>
			<function position="top" type="MpAlarmXReset"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<analog type="input" name="gAlarmXCore"/>
			<function position="middle" type="MpAlarmXReset"><input name="MpLink"/><output name="4"/></function>
			<analog type="output" name="status"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<analog type="input" name="ALARM_SAFETY_GUARD_DOOR"/>
			<function position="bottom" type="MpAlarmXReset"><input name="Name"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<analog type="input" name="gAlarmXCore"/>
			<function position="top" type="MpAlarmXCheckState"><input name="MpLink"/><output name="1"/></function>
			<coil type="open" name="FrontEStopNotOKActive"/>
		</row>
		<row>
			<analog type="input" name="ALARM_SAFETY_FRONT_ESTOP"/>
			<function position="middle" type="MpAlarmXCheckState"><input name="Name"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="mpALARMX_STATE_ACTIVE"/>
			<function position="bottom" type="MpAlarmXCheckState"><input name="State"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="Set/Clear Safety Alarm" row="3" column="0" commented="0">
		<row>
			<contact type="closed" name="gIO.SafetyStatus.FrontEStopOK"/>
			<contact type="closed" name="FrontEStopNotOKActive"/>
			<contact type="open" name="gIO.SafetyStatus.SafetyProgramRunning"/>
			<function position="top" type="MpAlarmXSet"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<analog type="input" name="gAlarmXCore"/>
			<function position="middle" type="MpAlarmXSet"><input name="MpLink"/><output name="7"/></function>
			<analog type="output" name="status"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<analog type="input" name="ALARM_SAFETY_FRONT_ESTOP"/>
			<function position="bottom" type="MpAlarmXSet"><input name="Name"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="open" name="gIO.SafetyStatus.FrontEStopOK"/>
			<contact type="open" name="FrontEStopNotOKActive"/>
			<contact type="open" name="gIO.SafetyStatus.SafetyProgramRunning"/>
			<function position="top" type="MpAlarmXReset"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<analog type="input" name="gAlarmXCore"/>
			<function position="middle" type="MpAlarmXReset"><input name="MpLink"/><output name="4"/></function>
			<analog type="output" name="status"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<analog type="input" name="ALARM_SAFETY_FRONT_ESTOP"/>
			<function position="bottom" type="MpAlarmXReset"><input name="Name"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<analog type="input" name="gAlarmXCore"/>
			<function position="top" type="MpAlarmXCheckState"><input name="MpLink"/><output name="1"/></function>
			<coil type="open" name="RearEStopNotOKActive"/>
		</row>
		<row>
			<analog type="input" name="ALARM_SAFETY_REAR_ESTOP"/>
			<function position="middle" type="MpAlarmXCheckState"><input name="Name"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="mpALARMX_STATE_ACTIVE"/>
			<function position="bottom" type="MpAlarmXCheckState"><input name="State"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="Set/Clear Safety Alarm" row="3" column="0" commented="0">
		<row>
			<contact type="closed" name="gIO.SafetyStatus.BackEstopOK"/>
			<contact type="closed" name="RearEStopNotOKActive"/>
			<contact type="open" name="gIO.SafetyStatus.SafetyProgramRunning"/>
			<function position="top" type="MpAlarmXSet"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<analog type="input" name="gAlarmXCore"/>
			<function position="middle" type="MpAlarmXSet"><input name="MpLink"/><output name="7"/></function>
			<analog type="output" name="status"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<analog type="input" name="ALARM_SAFETY_REAR_ESTOP"/>
			<function position="bottom" type="MpAlarmXSet"><input name="Name"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="open" name="gIO.SafetyStatus.BackEstopOK"/>
			<contact type="open" name="RearEStopNotOKActive"/>
			<contact type="open" name="gIO.SafetyStatus.SafetyProgramRunning"/>
			<function position="top" type="MpAlarmXReset"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<analog type="input" name="gAlarmXCore"/>
			<function position="middle" type="MpAlarmXReset"><input name="MpLink"/><output name="4"/></function>
			<analog type="output" name="status"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<analog type="input" name="ALARM_SAFETY_REAR_ESTOP"/>
			<function position="bottom" type="MpAlarmXReset"><input name="Name"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="If safety is OK, Turn air On and turn off the red light" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="gIO.DIs.SafetyOK"/>
			<line/>
			<line/>
			<coil type="open" name="gIO.DOs.AirOn"/>
		</row>
		<row>
			<empty or="true"/>
			<contact type="closed" name="gModeControlInterface.Status.BlissPanelAlarmActive"/>
			<line/>
			<coil type="negated" name="gIO.DOs.RedLightStack"/>
		</row>
	</network>
	<network label="" comment="If there are no alarms active, turn on the green light" row="1" column="0" commented="0">
		<row>
			<contact type="closed" name="gAlarmActive"/>
			<line/>
			<line/>
			<coil type="open" name="gIO.DOs.GreenLightStack"/>
		</row>
	</network>
	<network label="" comment="If there is an active alarm, or the hopper is low, turn onyellow stack light" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="gAlarmActive"/>
			<line/>
			<line/>
			<coil type="open" name="gIO.DOs.AmberLightStack"/>
		</row>
		<row>
			<contact type="closed" name="gIO.DIs.BodyHopperLow" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="Downstream sensor is OFF when blocked. If downstream sensor is blocked for a set amount of time, set the Downstream sensor input true" row="3" column="0" commented="0">
		<row>
			<empty/>
			<empty/>
			<functionblock position="header" name="DownstreamSensorTimer" type="TON"/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="gIO.DIs.DownstreamSensorRaw"/>
			<contact type="closed" name="gModeControlInterface.Parameters.DownstreamIgnored"/>
			<functionblock position="top" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<coil type="open" name="gIO.DIs.DownstreamSensor"/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="gModeControlInterface.Parameters.DownstreamTimeout"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="If dwell time is anything but 0 seconds, we want to stop at the set position. This flag tells us that we want to stop each cycle" row="2" column="0" commented="0">
		<row>
			<analog type="input" name="gModeControlInterface.Parameters.DwellTime"/>
			<function position="top" type="GT"><input name="" extensible="true"/><output name="1"/></function>
			<analog type="output" name="gModeControlInterface.Status.DwellModeEnabled"/>
		</row>
		<row>
			<analog type="input" name="0"/>
			<function position="bottom" type="GT"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="If an alarm becomes active, or someone presses the stop button, finish the cycle (deleted InfeedBoxPresent) Added RequestVFDRun" row="3" column="0" commented="0">
		<row>
			<contact type="positive transition" name="gAlarmActive"/>
			<contact type="open" name="gHMI.Commands.SelectAutoMode"/>
			<contact type="open" name="gHMI.Commands.RequestVFDRun"/>
			<coil type="set" name="gModeControlInterface.Commands.FinishCycle"/>
		</row>
		<row>
			<contact type="positive transition" name="HoperLowStop" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="positive transition" name="gHMI.Commands.RequestStop" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="If an alarm is active or safety is not ok or jog mode is selected, do not finish the selected cycle" row="8" column="0" commented="0">
		<row>
			<contact type="open" name="gServoFeedInterface.Status.Error"/>
			<line/>
			<line/>
			<coil type="reset" name="gModeControlInterface.Commands.FinishCycle"/>
		</row>
		<row>
			<contact type="open" name="gServoHopperInterface.Status.Error" or="true"/>
			<line/>
			<line/>
			<coil type="reset" name="PickAndPlaceHasBox"/>
		</row>
		<row>
			<contact type="open" name="gServoRamInterface.Status.Error" or="true"/>
			<line/>
			<line/>
			<coil type="reset" name="PickAndPlaceDwelling"/>
		</row>
		<row>
			<contact type="open" name="gFoldPushCtrlInterface.Parameters.LinMotBotFolder.Status.Error" or="true"/>
			<line/>
			<line/>
			<coil type="reset" name="PhotoEyeSeen"/>
		</row>
		<row>
			<contact type="open" name="gFoldPushCtrlInterface.Parameters.LinMotTopFolder.Status.Error" or="true"/>
			<line/>
			<line/>
			<coil type="reset" name="Vacuum_ON"/>
		</row>
		<row>
			<contact type="closed" name="gIO.DIs.SafetyOK" or="true"/>
			<line/>
			<line/>
			<coil type="reset" name="gIO.DOs.X_PickSolenoid"/>
		</row>
		<row>
			<contact type="open" name="gHMI.Commands.SelectJogMode" or="true"/>
			<line/>
			<line/>
			<coil type="reset" name="gIO.DOs.BlowOffOn"/>
		</row>
		<row>
			<contact type="open" name="gHighSeverityAlarmActive" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="Do not allow machine to run if glue system has an alarm or a linmot folder has an error (Removed gLowSeverityAlarmActive)" row="8" column="0" commented="0">
		<row>
			<contact type="open" name="gAdhesiveCtrlInterface.Status.AlarmActive"/>
			<line/>
			<line/>
			<coil type="reset" name="gHMI.Commands.RequestVFDRun"/>
		</row>
		<row>
			<contact type="open" name="gFoldPushCtrlInterface.Parameters.LinMotBotFolder.Status.Error" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="gFoldPushCtrlInterface.Parameters.LinMotTopFolder.Status.Error" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="gServoFeedInterface.Status.Error" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="gServoHopperInterface.Status.Error" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="gServoRamInterface.Status.Error" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="gLowSeverityAlarmActive" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="gHighSeverityAlarmActive" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="If we're in auto mode, and run request has been made or we should finish the running, set move request" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="gHMI.Commands.SelectAutoMode"/>
			<contact type="open" name="gHMI.Commands.RequestVFDRun"/>
			<line/>
			<coil type="open" name="MoveVelocityRequest"/>
		</row>
		<row>
			<empty or="true"/>
			<contact type="open" name="gModeControlInterface.Commands.FinishCycle" or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="This function compares the stop position and the current position and determines how far away the 2 are (360-0 rollover makes this non-trivial)" row="2" column="0" commented="0">
		<row>
			<analog type="input" name="gIO.Encoders.RamEncoderPosDegrees"/>
			<function position="top" type="DetermineDistanceToStopPos"><input name="EncoderPos"/><output name="8"/></function>
			<analog type="output" name="DistanceFromStopPosition"/>
		</row>
		<row>
			<analog type="input" name="gModeControlInterface.Parameters.StopPosition"/>
			<function position="bottom" type="DetermineDistanceToStopPos"><input name="StopPos"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="If the downstream sensor is blocked and we're at the stop position, set a flag saying that we're blocked" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="gIO.DIs.DownstreamSensor"/>
			<contact type="open" name="RamAtStopPosition"/>
			<line/>
			<coil type="open" name="DownstreamBlocked"/>
		</row>
	</network>
	<network label="" comment="If we want to move but downstream is blocked, set a flag indicating this state" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="MoveVelocityRequest"/>
			<contact type="open" name="DownstreamBlocked"/>
			<line/>
			<coil type="open" name="gModeControlInterface.Status.WaitingOnDownstream"/>
		</row>
	</network>
	<network label="" comment="VFD run command was the run command for the old machine. Keep servos cyclin while it is true, or while we have been commanded to stop but need to finish a cycle" row="3" column="0" commented="0">
		<row>
			<contact type="open" name="gHMI.Commands.RequestVFDRun"/>
			<line/>
			<line/>
			<coil type="open" name="gHMI.Commands.StartServoHopper"/>
		</row>
		<row>
			<contact type="open" name="gModeControlInterface.Commands.FinishCycle" or="true"/>
			<contact type="closed" name="StopFeedServo"/>
			<line/>
			<coil type="open" name="gHMI.Commands.StartServoFeed"/>
		</row>
		<row>
			<empty or="true"/>
			<line/>
			<line/>
			<coil type="open" name="gHMI.Commands.CycleServoRam"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="positive transition" name="FeedServoTMR.Q"/>
			<line/>
			<line/>
			<coil type="open" name="StopFeed"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="1">
		<row>
			<contact type="open" name="gIO.DIs.AdhesivePhotoEye"/>
			<contact type="open" name="gIO.DIs.AdhesivePhotoEye_2"/>
			<line/>
			<coil type="open" name="InfeedBoxPresent"/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<empty/>
			<functionblock position="header" name="FeedServoTMR" type="TON"/>
			<empty/>
		</row>
		<row>
			<contact type="closed" name="gIO.DIs.BodyHopperLow"/>
			<functionblock position="top" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<coil type="set" name="HopperLowAlarm"/>
		</row>
		<row>
			<analog type="input" name="gHMI.Parameters.LowHopperTime"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="Timer for the HopperLow to trigger StopFeed" row="3" column="0" commented="0">
		<row>
			<empty/>
			<functionblock position="header" name="FeedStopTimer" type="TON"/>
			<empty/>
		</row>
		<row>
			<contact type="closed" name="gIO.DIs.BodyHopperLow"/>
			<functionblock position="top" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<coil type="open" name="HoperLowStop"/>
		</row>
		<row>
			<analog type="input" name="gHMI.Parameters.LowHopperTime"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="gIO.DIs.BodyHopperLow"/>
			<line/>
			<line/>
			<coil type="reset" name="HopperLowAlarm"/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="1">
		<row>
			<contact type="positive transition" name="InfeedBoxPresent"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<line/>
			<line/>
			<function position="top" type="ADD"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="gServoFeedInterface.Status.ActualPosition"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="56" ENO="true"/></function>
			<analog type="output" name="FeedPositionCapture"/>
			<analog type="input" name="FeedPositionCapture"/>
			<function position="middle" type="ADD"><input name="" extensible="true"/><output name="56"/></function>
			<analog type="output" name="FeedPosFinal"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<analog type="input" name="FeedServoPosSP"/>
			<function position="bottom" type="ADD"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="Logic that allows a pick-and-place cycle to strt. FeedinCycle is used to alert the servo ram that another box will be coming" row="4" column="0" commented="0">
		<row>
			<contact type="open" name="gHMI.Commands.RequestVFDRun"/>
			<contact type="closed" name="gModeControlInterface.Commands.FinishCycle"/>
			<contact type="closed" name="InfeedBoxPresent"/>
			<contact type="open" name="gIO.DIs.X_PickRetracted"/>
			<contact type="open" name="gServoFeedInterface.Commands.RequestMoveVelocity"/>
			<contact type="closed" name="gIO.DIs.X_PickExtended"/>
			<contact type="closed" name="PickAndPlaceHasBox"/>
			<contact type="closed" name="PickAndPlaceDwelling"/>
			<coil type="set" name="gIO.DOs.X_PickSolenoid"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<empty or="true"/>
			<coil type="set" name="FeedInCycle"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<empty or="true"/>
			<coil type="set" name="Vacuum_ON"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<empty or="true"/>
			<coil type="reset" name="Return_Trigger"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="gHMI.Commands.RequestVFDRun"/>
			<contact type="open" name="gIO.DIs.X_PickRetracted"/>
			<contact type="open" name="gServoFeedInterface.Commands.RequestMoveVelocity"/>
			<contact type="open" name="gIO.DOs.VacuumOn"/>
			<contact type="open" name="gIO.DIs.X_PickExtended"/>
			<contact type="open" name="gIO.DOs.BlowOffOn"/>
			<coil type="reset" name="gHMI.Commands.RequestVFDRun"/>
		</row>
	</network>
	<network label="" comment="Turn on DO for vacuum blow off as soon as vacuum is turned off and safety is ok" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="Vacuum_ON"/>
			<contact type="open" name="gIO.DIs.SafetyOK"/>
			<line/>
			<coil type="open" name="gIO.DOs.VacuumOn"/>
		</row>
		<row>
			<contact type="open" name="gVacCtrlInterface.Commands.VenturiOnManual" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="Sets flag for Pick and Place when Cynlider is Extended. PickDwellTime determines how long cylinder stays extended" row="4" column="0" commented="1">
		<row>
			<contact type="open" name="gIO.DIs.X_PickExtended"/>
			<line/>
			<line/>
			<coil type="set" name="PickAndPlaceHasBox"/>
		</row>
		<row>
			<empty or="true"/>
			<functionblock position="header" name="BoxPickTMR" type="TON"/>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<functionblock position="top" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<empty/>
		</row>
		<row>
			<analog type="input" name="gHMI.Parameters.PickDwellTime"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="X Cylinder is retracted if the Vacuum is on and the Ram Servo is clear of the Feed servo, the Return Trigger is set" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="gHMI.Commands.RequestReset"/>
			<line/>
			<line/>
			<coil type="reset" name="gIO.DOs.X_PickSolenoid"/>
		</row>
		<row>
			<contact type="open" name="gIO.DOs.VacuumOn"/>
			<contact type="open" name="BoxPickTMR.Q"/>
			<contact type="open" name="ServoRamClear" or="true"/>
			<coil type="set" name="Return_Trigger"/>
		</row>
	</network>
	<network label="" comment="Turns the Vacuum off after the PT time has elapsed" row="3" column="0" commented="0">
		<row>
			<empty/>
			<empty/>
			<functionblock position="header" name="VacuumTimer" type="TON"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="PickAndPlaceHasBox"/>
			<contact type="open" name="Return_Trigger"/>
			<functionblock position="top" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<line/>
			<coil type="open" name="BlowOff_Trigger"/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="gHMI.Parameters.VacuumOffTime"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty or="true"/>
			<coil type="reset" name="Vacuum_ON"/>
		</row>
	</network>
	<network label="" comment="Turn on DO for vacuum blow off as soon as vacuum is turned off and safety is ok" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="BlowOff_Trigger"/>
			<contact type="open" name="gIO.DIs.SafetyOK"/>
			<line/>
			<coil type="set" name="gIO.DOs.BlowOffOn"/>
		</row>
		<row>
			<contact type="positive transition" name="gVacCtrlInterface.Commands.BlowOffOnManual" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="Turn off blow off after user input time delay. The feed is no longer in cycle once the blowoff finishes" row="4" column="0" commented="0">
		<row>
			<contact type="negative transition" name="gVacCtrlInterface.Commands.BlowOffOnManual"/>
			<line/>
			<line/>
			<coil type="reset" name="gIO.DOs.BlowOffOn"/>
		</row>
		<row>
			<empty/>
			<functionblock position="header" name="TON_BlowOff" type="TON" or="true"/>
			<empty/>
		</row>
		<row>
			<analog type="input" name="gIO.DOs.BlowOffOn"/>
			<functionblock position="top" type="TON" or="true"><input name="IN"/><output name="Q"/></functionblock>
			<empty/>
		</row>
		<row>
			<analog type="input" name="gHMI.Parameters.BlowOffTime"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="1">
		<row>
			<contact type="open" name="gIO.DIs.AdhesivePhotoEye"/>
			<contact type="open" name="gIO.DIs.AdhesivePhotoEye_2"/>
			<line/>
			<coil type="set" name="PhotoEyeSeen"/>
		</row>
		<row>
			<empty/>
			<empty or="true"/>
			<line/>
			<coil type="reset" name="FeedStopTimer.Q"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="1">
		<row>
			<contact type="open" name="gIO.DIs.BodyDetect"/>
			<line/>
			<line/>
			<coil type="reset" name="PhotoEyeSeen"/>
		</row>
	</network>
	<network label="" comment="Latch the encoder position. this marks the start of the glue cycle" row="3" column="0" commented="1">
		<row>
			<contact type="positive transition" name="PhotoEyeSeen"/>
			<contact type="open" name="gHMI.Commands.SelectAutoMode"/>
			<contact type="open" name="gHMI.Commands.RequestVFDRun"/>
			<line/>
			<line/>
			<line/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<line/>
			<line/>
			<line/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty or="true"/>
			<contact type="open" name="gModeControlInterface.Commands.FinishCycle" or="true"/>
			<analog type="input" name="gServoFeedInterface.Status.ActualPosition"/>
			<function position="topbottom" type="LREAL_TO_REAL"><input name="IN"/><output name="56"/></function>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="56"/></function>
			<analog type="output" name="gAdhesiveCtrlInterface.Status.LatchedEncoderPos"/>
			<empty/>
			<analog type="input" name="0"/>
			<function position="middle" type="MOVE"><input name="" extensible="true"/><output name="56"/></function>
			<analog type="output" name="DistanceAfterLatch"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<analog type="input" name="gServoFeedInterface.Status.ActualPosition"/>
			<function position="topbottom" type="LREAL_TO_REAL"><input name="IN"/><output name="56"/></function>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="56"/></function>
			<analog type="output" name="OldEncoderPos"/>
		</row>
	</network>
	<network label="" comment="Determine how far the ram has moved sense the photo eye was last seen" row="2" column="0" commented="1">
		<row>
			<analog type="input" name="gServoFeedInterface.Status.ActualPosition"/>
			<function position="topbottom" type="LREAL_TO_REAL"><input name="IN"/><output name="56"/></function>
			<function position="top" type="ComputeDistanceMoved"><input name="CurentPos"/><output name="56"/></function>
			<line/>
			<function position="top" type="ADD"><input name="" extensible="true"/><output name="56"/></function>
			<analog type="output" name="DistanceAfterLatch"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<analog type="input" name="OldEncoderPos"/>
			<function position="bottom" type="ComputeDistanceMoved"><input name="OldPos"/></function>
			<analog type="input" name="DistanceAfterLatch"/>
			<function position="bottom" type="ADD"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="1">
		<row>
			<analog type="input" name="gServoFeedInterface.Status.ActualPosition"/>
			<function position="topbottom" type="LREAL_TO_REAL"><input name="IN"/><output name="56"/></function>
			<function position="topbottom" type="MOVE"><input name="" extensible="true"/><output name="56"/></function>
			<analog type="output" name="OldEncoderPos"/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<empty/>
			<functionblock position="header" name="PickAndPlaceDwellTimer" type="TON"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="PickAndPlaceDwelling"/>
			<functionblock position="top" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<line/>
			<coil type="reset" name="PickAndPlaceDwelling"/>
		</row>
		<row>
			<analog type="input" name="gHMI.Parameters.PickAndPlaceDwell"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty or="true"/>
			<coil type="reset" name="FeedInCycle"/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="1">
		<row>
			<empty/>
			<empty/>
			<functionblock position="header" name="PhotoEyeTimeout" type="TON"/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="gHMI.Commands.RequestVFDRun"/>
			<line/>
			<functionblock position="top" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<coil type="open" name="GluePhotoEyeAlarmActive"/>
		</row>
		<row>
			<contact type="open" name="gModeControlInterface.Commands.FinishCycle" or="true"/>
			<analog type="input" name="gHMI.Parameters.TopFeedJamTime"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="1">
		<row>
			<contact type="open" name="ForceBodyPanellError"/>
			<line/>
			<line/>
			<line/>
			<coil type="open" name="BodyCheckError"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<functionblock position="header" name="BodyPanelTimeout" type="TON" or="true"/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="gHMI.Commands.RequestVFDRun"/>
			<line/>
			<functionblock position="top" type="TON" or="true"><input name="IN"/><output name="Q"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="open" name="gModeControlInterface.Commands.FinishCycle" or="true"/>
			<analog type="input" name="gHMI.Parameters.LowFeedJamTime"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<analog type="input" name="LubeCount"/>
			<function position="top" type="LT"><input name="IN1" extensible="true"/><output name="1"/></function>
			<coil type="open" name="LubricationOK"/>
		</row>
		<row>
			<analog type="input" name="gHMI.Parameters.SetCycleCount"/>
			<function position="bottom" type="LT"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<empty/>
			<empty/>
			<empty/>
			<functionblock position="header" name="zzCTU00000000" type="CTU"/>
			<empty/>
		</row>
		<row>
			<contact type="positive transition" name="gIO.DIs.LubricationCounter"/>
			<line/>
			<line/>
			<functionblock position="top" type="CTU"><input name="CU"/><output name="Q"/></functionblock>
			<coil type="open" name="CountReset"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<analog type="input" name="LubeReset"/>
			<functionblock position="middle" type="CTU"><input name="RESET"/><output name="CV"/></functionblock>
			<empty/>
		</row>
		<row>
			<analog type="input" name="gHMI.Parameters.LubeCycleCount"/>
			<function position="topbottom" type="UDINT_TO_UINT"><input name="IN"/><output name="6"/></function>
			<functionblock position="bottom" type="CTU"><input name="PV"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="CountReset"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<analog type="output" name="LubeReset"/>
		</row>
		<row>
			<analog type="input" name="0"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="LubeCount"/>
		</row>
	</network>
</networks>
END_PROGRAM


















































































































