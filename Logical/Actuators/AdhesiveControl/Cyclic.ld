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
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<analog type="input" name="gAdhesiveCtrlInterface.Parameters.NordsonFeedbackSelection"/>
			<function position="top" type="EQ"><input name="" extensible="true"/><output name="1"/></function>
			<coil type="open" name="gAdhesiveCtrlInterface.Parameters.FeedbackIsModbusTCP"/>
		</row>
		<row>
			<analog type="input" name="NORDSON_MODBUSTCP"/>
			<function position="bottom" type="EQ"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<analog type="input" name="gAdhesiveCtrlInterface.Parameters.NordsonFeedbackSelection"/>
			<function position="top" type="EQ"><input name="" extensible="true"/><output name="1"/></function>
			<coil type="open" name="gAdhesiveCtrlInterface.Parameters.FeedbackIsHardwire"/>
		</row>
		<row>
			<analog type="input" name="NORDSON_HARDWIRE"/>
			<function position="bottom" type="EQ"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="If we are not in run mode, set the latched position way out of range to avoid glue being applied next time we enter run mode" row="5" column="0" commented="0">
		<row>
			<contact type="closed" name="gHMI.Commands.SelectAutoMode"/>
			<line/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<contact type="open" name="gFoldPushCtrlInterface.Parameters.LinMotBotFolder.Status.Error" or="true"/>
			<analog type="input" name="9999999.0"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gAdhesiveCtrlInterface.Status.LatchedEncoderPos"/>
		</row>
		<row>
			<contact type="open" name="gFoldPushCtrlInterface.Parameters.LinMotTopFolder.Status.Error" or="true"/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="gServoFeedInterface.Status.Error" or="true"/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="closed" name="gIO.DIs.SafetyOK" or="true"/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="1">
		<row>
			<contact type="open" name="gIO.DIs.AdhesivePhotoEye"/>
			<contact type="open" name="gIO.DIs.AdhesivePhotoEye_2"/>
			<line/>
			<coil type="open" name="PhotoEyeSeen"/>
		</row>
	</network>
	<network label="" comment="Latch the encoder position. this marks the start of the glue cycle" row="3" column="0" commented="1">
		<row>
			<contact type="positive transition" name="PhotoEyeSeen"/>
			<contact type="open" name="gHMI.Commands.SelectAutoMode"/>
			<contact type="open" name="gHMI.Commands.RequestVFDRun"/>
			<line/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
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
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="56"/></function>
			<analog type="output" name="gAdhesiveCtrlInterface.Status.LatchedEncoderPos"/>
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
			<analog type="input" name="gServoFeedInterface.Status.ActualPosition"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="56"/></function>
			<analog type="output" name="OldEncoderPos"/>
		</row>
	</network>
	<network label="" comment="Determine how far the ram has moved sense the photo eye was last seen" row="2" column="0" commented="1">
		<row>
			<analog type="input" name="gServoFeedInterface.Status.ActualPosition"/>
			<function position="top" type="ComputeDistanceMoved"><input name="CurentPos"/><output name="56"/></function>
			<line/>
			<function position="top" type="ADD"><input name="" extensible="true"/><output name="56"/></function>
			<analog type="output" name="DistanceAfterLatch"/>
		</row>
		<row>
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
			<function position="topbottom" type="MOVE"><input name="" extensible="true"/><output name="56"/></function>
			<analog type="output" name="OldEncoderPos"/>
		</row>
	</network>
	<network label="" comment="The glue cycle position is the sum of the latched encoder position and the distance the ram has moved sense the encoder position was latched" row="1" column="0" commented="0">
		<row>
			<analog type="input" name="DistanceAfterLatch"/>
			<function position="topbottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gAdhesiveCtrlInterface.Status.GlueCyclePos"/>
		</row>
	</network>
	<network label="" comment="Reset glue channel outputs. If they should be turned on by the pattern, that will be done below" row="1" column="0" commented="0">
		<row>
			<line/>
			<line/>
			<line/>
			<coil type="reset" name="gIO.DOs.GlueChannel1"/>
		</row>
	</network>
	<network label="" comment="Reset glue channel outputs. If they should be turned on by the pattern, that will be done below" row="1" column="0" commented="0">
		<row>
			<line/>
			<line/>
			<line/>
			<coil type="reset" name="gIO.DOs.GlueChannel2"/>
		</row>
	</network>
	<network label="" comment="Reset glue channel outputs. If they should be turned on by the pattern, that will be done below" row="1" column="0" commented="0">
		<row>
			<line/>
			<line/>
			<line/>
			<coil type="reset" name="gIO.DOs.GlueChannel3"/>
		</row>
	</network>
	<network label="" comment="Reset glue channel outputs. If they should be turned on by the pattern, that will be done below" row="1" column="0" commented="0">
		<row>
			<line/>
			<line/>
			<line/>
			<coil type="reset" name="gIO.DOs.GlueChannel4"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<line/>
			<line/>
			<line/>
			<coil type="reset" name="GlueChannel1"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<line/>
			<line/>
			<line/>
			<coil type="reset" name="GlueChannel2"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<line/>
			<line/>
			<line/>
			<coil type="reset" name="GlueChannel3"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<line/>
			<line/>
			<line/>
			<coil type="reset" name="GlueChannel4"/>
		</row>
	</network>
	<network label="" comment="First channel is always evaluated" row="9" column="0" commented="0">
		<row>
			<contact type="open" name="gHMI.Commands.SelectAutoMode"/>
			<contact type="open" name="gHMI.Commands.RequestVFDRun"/>
			<line/>
			<function position="top" type="GluePatternControl"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<contact type="open" name="gModeControlInterface.Commands.FinishCycle" or="true"/>
			<analog type="input" name="gAdhesiveCtrlInterface.Parameters.AdhesivePatterns[0]"/>
			<function position="middle" type="GluePatternControl"><input name="ChannelPattern"/><output name="1" ENO="true"/></function>
			<analog type="output" name="GlueChannel1"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<analog type="input" name="gAdhesiveCtrlInterface.Status.GlueCyclePos"/>
			<function position="middle" type="GluePatternControl"><input name="PositionInCycle"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<analog type="input" name="gAdhesiveCtrlInterface.Parameters.StitchPercentage"/>
			<function position="middle" type="GluePatternControl"><input name="StitchPercentage"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<analog type="input" name="gAdhesiveCtrlInterface.Parameters.BeadLengths"/>
			<function position="middle" type="GluePatternControl"><input name="BeadLengths"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<analog type="input" name="gOnDelayCompensation"/>
			<function position="middle" type="GluePatternControl"><input name="OnDelayCompensation"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<analog type="input" name="gOffDelayCompensation"/>
			<function position="middle" type="GluePatternControl"><input name="OffDelayCompensation"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<contact type="address" name="Switches0"/>
			<function position="middle" type="GluePatternControl"><input name="Switches"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<analog type="input" name="gAdhesiveCtrlInterface.Parameters.ChannelModulationCtrl[0]"/>
			<function position="bottom" type="GluePatternControl"><input name="ChannelModulationCtrl"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="Channels 2/3/4 evalauted only if the machine uses those channels" row="9" column="0" commented="0">
		<row>
			<analog type="input" name="gAdhesiveCtrlInterface.Parameters.NumAdhesiveChannels"/>
			<function position="top" type="GE"><input name="" extensible="true"/><output name="1"/></function>
			<contact type="open" name="gHMI.Commands.RequestVFDRun"/>
			<line/>
			<function position="top" type="GluePatternControl"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="2"/>
			<function position="bottom" type="GE" or="true"><input name="" extensible="true"/></function>
			<contact type="open" name="gModeControlInterface.Commands.FinishCycle" or="true"/>
			<analog type="input" name="gAdhesiveCtrlInterface.Parameters.AdhesivePatterns[1]"/>
			<function position="middle" type="GluePatternControl"><input name="ChannelPattern"/><output name="1" ENO="true"/></function>
			<analog type="output" name="GlueChannel2"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<analog type="input" name="gAdhesiveCtrlInterface.Status.GlueCyclePos"/>
			<function position="middle" type="GluePatternControl"><input name="PositionInCycle"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<analog type="input" name="gAdhesiveCtrlInterface.Parameters.StitchPercentage"/>
			<function position="middle" type="GluePatternControl"><input name="StitchPercentage"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<analog type="input" name="gAdhesiveCtrlInterface.Parameters.BeadLengths"/>
			<function position="middle" type="GluePatternControl"><input name="BeadLengths"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<analog type="input" name="gOnDelayCompensation"/>
			<function position="middle" type="GluePatternControl"><input name="OnDelayCompensation"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<analog type="input" name="gOffDelayCompensation"/>
			<function position="middle" type="GluePatternControl"><input name="OffDelayCompensation"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<contact type="address" name="Switches1"/>
			<function position="middle" type="GluePatternControl"><input name="Switches"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<analog type="input" name="gAdhesiveCtrlInterface.Parameters.ChannelModulationCtrl[1]"/>
			<function position="bottom" type="GluePatternControl"><input name="ChannelModulationCtrl"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="Channels 2/3/4 evalauted only if the machine uses those channels" row="9" column="0" commented="0">
		<row>
			<analog type="input" name="gAdhesiveCtrlInterface.Parameters.NumAdhesiveChannels"/>
			<function position="top" type="GE"><input name="" extensible="true"/><output name="1"/></function>
			<contact type="open" name="gHMI.Commands.RequestVFDRun"/>
			<line/>
			<function position="top" type="GluePatternControl"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="3"/>
			<function position="bottom" type="GE" or="true"><input name="" extensible="true"/></function>
			<contact type="open" name="gModeControlInterface.Commands.FinishCycle" or="true"/>
			<analog type="input" name="gAdhesiveCtrlInterface.Parameters.AdhesivePatterns[2]"/>
			<function position="middle" type="GluePatternControl"><input name="ChannelPattern"/><output name="1" ENO="true"/></function>
			<analog type="output" name="GlueChannel3"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<analog type="input" name="gAdhesiveCtrlInterface.Status.GlueCyclePos"/>
			<function position="middle" type="GluePatternControl"><input name="PositionInCycle"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<analog type="input" name="gAdhesiveCtrlInterface.Parameters.StitchPercentage"/>
			<function position="middle" type="GluePatternControl"><input name="StitchPercentage"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<analog type="input" name="gAdhesiveCtrlInterface.Parameters.BeadLengths"/>
			<function position="middle" type="GluePatternControl"><input name="BeadLengths"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<analog type="input" name="gOnDelayCompensation"/>
			<function position="middle" type="GluePatternControl"><input name="OnDelayCompensation"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<analog type="input" name="gOffDelayCompensation"/>
			<function position="middle" type="GluePatternControl"><input name="OffDelayCompensation"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<contact type="address" name="Switches2"/>
			<function position="middle" type="GluePatternControl"><input name="Switches"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<analog type="input" name="gAdhesiveCtrlInterface.Parameters.ChannelModulationCtrl[2]"/>
			<function position="bottom" type="GluePatternControl"><input name="ChannelModulationCtrl"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="Channels 2/3/4 evalauted only if the machine uses those channels" row="9" column="0" commented="0">
		<row>
			<analog type="input" name="gAdhesiveCtrlInterface.Parameters.NumAdhesiveChannels"/>
			<function position="top" type="GE"><input name="" extensible="true"/><output name="1"/></function>
			<contact type="open" name="gHMI.Commands.RequestVFDRun"/>
			<line/>
			<function position="top" type="GluePatternControl"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="4"/>
			<function position="bottom" type="GE" or="true"><input name="" extensible="true"/></function>
			<contact type="open" name="gModeControlInterface.Commands.FinishCycle" or="true"/>
			<analog type="input" name="gAdhesiveCtrlInterface.Parameters.AdhesivePatterns[3]"/>
			<function position="middle" type="GluePatternControl"><input name="ChannelPattern"/><output name="1" ENO="true"/></function>
			<analog type="output" name="GlueChannel4"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<analog type="input" name="gAdhesiveCtrlInterface.Status.GlueCyclePos"/>
			<function position="middle" type="GluePatternControl"><input name="PositionInCycle"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<analog type="input" name="gAdhesiveCtrlInterface.Parameters.StitchPercentage"/>
			<function position="middle" type="GluePatternControl"><input name="StitchPercentage"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<analog type="input" name="gAdhesiveCtrlInterface.Parameters.BeadLengths"/>
			<function position="middle" type="GluePatternControl"><input name="BeadLengths"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<analog type="input" name="gOnDelayCompensation"/>
			<function position="middle" type="GluePatternControl"><input name="OnDelayCompensation"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<analog type="input" name="gOffDelayCompensation"/>
			<function position="middle" type="GluePatternControl"><input name="OffDelayCompensation"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<contact type="address" name="Switches3"/>
			<function position="middle" type="GluePatternControl"><input name="Switches"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<analog type="input" name="gAdhesiveCtrlInterface.Parameters.ChannelModulationCtrl[3]"/>
			<function position="bottom" type="GluePatternControl"><input name="ChannelModulationCtrl"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="GlueChannel1"/>
			<contact type="open" name="gIO.DIs.SafetyOK"/>
			<line/>
			<coil type="open" name="gIO.DOs.GlueChannel1"/>
		</row>
		<row>
			<contact type="open" name="gAdhesiveCtrlInterface.Commands.PurgeChannel1" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="GlueChannel2"/>
			<contact type="open" name="gIO.DIs.SafetyOK"/>
			<line/>
			<coil type="open" name="gIO.DOs.GlueChannel2"/>
		</row>
		<row>
			<contact type="open" name="gAdhesiveCtrlInterface.Commands.PurgeChannel2" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="GlueChannel3"/>
			<contact type="open" name="gIO.DIs.SafetyOK"/>
			<line/>
			<coil type="open" name="gIO.DOs.GlueChannel3"/>
		</row>
		<row>
			<contact type="open" name="gAdhesiveCtrlInterface.Commands.PurgeChannel3" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="GlueChannel4"/>
			<contact type="open" name="gIO.DIs.SafetyOK"/>
			<line/>
			<coil type="open" name="gIO.DOs.GlueChannel4"/>
		</row>
		<row>
			<contact type="open" name="gAdhesiveCtrlInterface.Commands.PurgeChannel4" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="closed" name="gIO.DIs.AdhesiveUnitNotFaulted"/>
			<contact type="open" name="gAdhesiveCtrlInterface.Parameters.FeedbackIsHardwire"/>
			<line/>
			<coil type="open" name="gAdhesiveCtrlInterface.Status.UnitFault"/>
		</row>
		<row>
			<contact type="open" name="gAdhesiveCtrlInterface.Parameters.NordsonComms.UnitFaulted"/>
			<contact type="open" name="gAdhesiveCtrlInterface.Parameters.FeedbackIsModbusTCP" or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="gIO.DIs.AdhesiveUnitReady"/>
			<contact type="open" name="gAdhesiveCtrlInterface.Parameters.FeedbackIsHardwire"/>
			<line/>
			<coil type="open" name="gAdhesiveCtrlInterface.Status.UnitReady"/>
		</row>
		<row>
			<contact type="open" name="gAdhesiveCtrlInterface.Parameters.NordsonComms.UnitReady"/>
			<contact type="open" name="gAdhesiveCtrlInterface.Parameters.FeedbackIsModbusTCP" or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<analog type="input" name="gAlarmXCore"/>
			<function position="top" type="MpAlarmXCheckState"><input name="MpLink"/><output name="1"/></function>
			<coil type="open" name="AdhesiveUnitReadyAlarmActive"/>
		</row>
		<row>
			<analog type="input" name="ALARM_ADHESIVE_NOT_READY"/>
			<function position="middle" type="MpAlarmXCheckState"><input name="Name"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="mpALARMX_STATE_ACTIVE"/>
			<function position="bottom" type="MpAlarmXCheckState"><input name="State"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="closed" name="gAdhesiveCtrlInterface.Status.UnitReady"/>
			<contact type="closed" name="AdhesiveUnitReadyAlarmActive"/>
			<contact type="open" name="gRecipeInterface.Status.RecipeHasBeenLoaded"/>
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
			<analog type="input" name="ALARM_ADHESIVE_NOT_READY"/>
			<function position="bottom" type="MpAlarmXSet"><input name="Name"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="open" name="gAdhesiveCtrlInterface.Status.UnitReady"/>
			<contact type="open" name="AdhesiveUnitReadyAlarmActive"/>
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
			<analog type="input" name="ALARM_ADHESIVE_NOT_READY"/>
			<function position="bottom" type="MpAlarmXReset"><input name="Name"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<analog type="input" name="gAlarmXCore"/>
			<function position="top" type="MpAlarmXCheckState"><input name="MpLink"/><output name="1"/></function>
			<coil type="open" name="AdhesiveUnitFaultedAlarmActive"/>
		</row>
		<row>
			<analog type="input" name="ALARM_ADHESIVE_FAULT"/>
			<function position="middle" type="MpAlarmXCheckState"><input name="Name"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="mpALARMX_STATE_ACTIVE"/>
			<function position="bottom" type="MpAlarmXCheckState"><input name="State"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="open" name="gAdhesiveCtrlInterface.Status.UnitFault"/>
			<contact type="closed" name="AdhesiveUnitFaultedAlarmActive"/>
			<contact type="open" name="gRecipeInterface.Status.RecipeHasBeenLoaded"/>
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
			<analog type="input" name="ALARM_ADHESIVE_FAULT"/>
			<function position="bottom" type="MpAlarmXSet"><input name="Name"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="closed" name="gAdhesiveCtrlInterface.Status.UnitFault"/>
			<contact type="open" name="AdhesiveUnitFaultedAlarmActive"/>
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
			<analog type="input" name="ALARM_ADHESIVE_FAULT"/>
			<function position="bottom" type="MpAlarmXReset"><input name="Name"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<analog type="input" name="gAlarmXCore"/>
			<function position="top" type="MpAlarmXCheckState"><input name="MpLink"/><output name="1"/></function>
			<coil type="open" name="AdhesiveUnitLevelLowAlarmActive"/>
		</row>
		<row>
			<analog type="input" name="ALARM_ADHESIVE_LOW"/>
			<function position="middle" type="MpAlarmXCheckState"><input name="Name"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="mpALARMX_STATE_ACTIVE"/>
			<function position="bottom" type="MpAlarmXCheckState"><input name="State"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="open" name="gIO.DIs.AdhesiveLevelLow"/>
			<contact type="closed" name="AdhesiveUnitLevelLowAlarmActive"/>
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
			<analog type="input" name="ALARM_ADHESIVE_LOW"/>
			<function position="bottom" type="MpAlarmXSet"><input name="Name"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="closed" name="gIO.DIs.AdhesiveLevelLow"/>
			<contact type="open" name="AdhesiveUnitLevelLowAlarmActive"/>
			<contact type="open" name="gRecipeInterface.Status.RecipeHasBeenLoaded"/>
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
			<analog type="input" name="ALARM_ADHESIVE_LOW"/>
			<function position="bottom" type="MpAlarmXReset"><input name="Name"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<analog type="input" name="gAlarmXCore"/>
			<function position="top" type="MpAlarmXCheckState"><input name="MpLink"/><output name="1"/></function>
			<coil type="open" name="AdhesiveUnitUseageLowAlarmActive"/>
		</row>
		<row>
			<analog type="input" name="ALARM_ADHESIVE_USEAGE_LOW"/>
			<function position="middle" type="MpAlarmXCheckState"><input name="Name"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="mpALARMX_STATE_ACTIVE"/>
			<function position="bottom" type="MpAlarmXCheckState"><input name="State"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="open" name="gIO.DIs.LowAdhesiveUseage"/>
			<contact type="closed" name="AdhesiveUnitUseageLowAlarmActive"/>
			<contact type="open" name="gRecipeInterface.Status.RecipeHasBeenLoaded"/>
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
			<analog type="input" name="ALARM_ADHESIVE_USEAGE_LOW"/>
			<function position="bottom" type="MpAlarmXSet"><input name="Name"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="closed" name="gIO.DIs.LowAdhesiveUseage"/>
			<contact type="open" name="AdhesiveUnitUseageLowAlarmActive"/>
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
			<analog type="input" name="ALARM_ADHESIVE_USEAGE_LOW"/>
			<function position="bottom" type="MpAlarmXReset"><input name="Name"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="Turn outputs off if safety Not OK. Also reset glue channels if the adhesive photo eyes are not true" row="4" column="0" commented="0">
		<row>
			<contact type="closed" name="gIO.DIs.SafetyOK"/>
			<line/>
			<line/>
			<coil type="reset" name="gIO.DOs.GlueChannel1"/>
		</row>
		<row>
			<empty or="true"/>
			<line/>
			<line/>
			<coil type="reset" name="gIO.DOs.GlueChannel2"/>
		</row>
		<row>
			<empty or="true"/>
			<line/>
			<line/>
			<coil type="reset" name="gIO.DOs.GlueChannel3"/>
		</row>
		<row>
			<empty or="true"/>
			<line/>
			<line/>
			<coil type="reset" name="gIO.DOs.GlueChannel4"/>
		</row>
	</network>
</networks>
END_PROGRAM































