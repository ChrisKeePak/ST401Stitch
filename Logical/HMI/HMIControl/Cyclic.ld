PROGRAM _CYCLIC
<?xml version="1.0"?>
<?AutomationStudio Version=3.0.71?>
<!-- Automation Studio Generated XML Section -->
<networks maxcolumn="0">
	<network label="" comment="" row="8" column="0" commented="0">
		<row>
			<contact type="closed" name="gIO.DIs.SafetyOK"/>
			<line/>
			<line/>
			<coil type="reset" name="gModeControlInterface.Commands.SetAutoMode"/>
		</row>
		<row>
			<contact type="open" name="gServoFeedInterface.Status.Error" or="true"/>
			<line/>
			<line/>
			<coil type="reset" name="gModeControlInterface.Commands.SetJogMode"/>
		</row>
		<row>
			<contact type="open" name="gServoHopperInterface.Status.Error" or="true"/>
			<line/>
			<line/>
			<coil type="reset" name="gHMI.Commands.SelectJogMode"/>
		</row>
		<row>
			<contact type="open" name="gServoRamInterface.Status.Error" or="true"/>
			<line/>
			<line/>
			<coil type="reset" name="gHMI.Commands.SelectAutoMode"/>
		</row>
		<row>
			<contact type="open" name="gModeControlInterface.Status.BlissPanelAlarmActive" or="true"/>
			<line/>
			<line/>
			<coil type="reset" name="gModeControlInterface.Status.Dwelling"/>
		</row>
		<row>
			<contact type="open" name="StopFeed" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="closed" name="gServoRamInterface.Status.Homed" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="gAlarmActive" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="closed" name="gServoRamInterface.Status.Homed"/>
			<line/>
			<line/>
			<coil type="reset" name="gModeControlInterface.Status.Dwelling"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="gHMI.Commands.SelectAutoMode"/>
			<line/>
			<line/>
			<coil type="set" name="gModeControlInterface.Commands.SetAutoMode"/>
		</row>
		<row>
			<empty or="true"/>
			<line/>
			<line/>
			<coil type="reset" name="gModeControlInterface.Commands.SetJogMode"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="gHMI.Commands.EnableShowMode"/>
			<line/>
			<line/>
			<coil type="open" name="gModeControlInterface.Commands.SetShowMode"/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="open" name="gHMI.Commands.SelectJogMode"/>
			<line/>
			<line/>
			<coil type="set" name="gModeControlInterface.Commands.SetJogMode"/>
		</row>
		<row>
			<empty or="true"/>
			<line/>
			<line/>
			<coil type="reset" name="gModeControlInterface.Commands.SetAutoMode"/>
		</row>
		<row>
			<empty or="true"/>
			<line/>
			<line/>
			<coil type="reset" name="gHMI.Commands.RequestVFDRun"/>
		</row>
	</network>
	<network label="" comment="" row="5" column="0" commented="0">
		<row>
			<contact type="open" name="gModeControlInterface.Commands.SetJogMode"/>
			<line/>
			<line/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<analog type="input" name="1"/>
			<function position="middle" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gHMI.ColorMapDatapoints.JogModeSelected"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<analog type="input" name="0"/>
			<function position="middle" type="MOVE"><input name="" extensible="true"/><output name="56"/></function>
			<analog type="output" name="gHMI.ColorMapDatapoints.AutoModeSelected"/>
		</row>
		<row>
			<analog type="input" name="UNHIDE"/>
			<function position="top" type="ADD"><input name="" extensible="true"/><output name="40"/></function>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="56"/></function>
			<analog type="output" name="gHMI.StatusDatapoints.JogStatusDatapoint"/>
		</row>
		<row>
			<analog type="input" name="UNLOCK"/>
			<function position="bottom" type="ADD"><input name="" extensible="true"/></function>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="5" column="0" commented="0">
		<row>
			<contact type="open" name="gModeControlInterface.Commands.SetAutoMode"/>
			<line/>
			<line/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<analog type="input" name="0"/>
			<function position="middle" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gHMI.ColorMapDatapoints.JogModeSelected"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<analog type="input" name="1"/>
			<function position="middle" type="MOVE"><input name="" extensible="true"/><output name="56"/></function>
			<analog type="output" name="gHMI.ColorMapDatapoints.AutoModeSelected"/>
		</row>
		<row>
			<analog type="input" name="HIDE"/>
			<function position="top" type="ADD"><input name="" extensible="true"/><output name="40"/></function>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="56"/></function>
			<analog type="output" name="gHMI.StatusDatapoints.JogStatusDatapoint"/>
		</row>
		<row>
			<analog type="input" name="LOCK"/>
			<function position="bottom" type="ADD"><input name="" extensible="true"/></function>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="5" column="0" commented="0">
		<row>
			<contact type="closed" name="gModeControlInterface.Commands.SetAutoMode"/>
			<contact type="closed" name="gModeControlInterface.Commands.SetJogMode"/>
			<line/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<analog type="input" name="0"/>
			<function position="middle" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gHMI.ColorMapDatapoints.JogModeSelected"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<analog type="input" name="0"/>
			<function position="middle" type="MOVE"><input name="" extensible="true"/><output name="56"/></function>
			<analog type="output" name="gHMI.ColorMapDatapoints.AutoModeSelected"/>
		</row>
		<row>
			<analog type="input" name="HIDE"/>
			<function position="top" type="ADD"><input name="" extensible="true"/><output name="40"/></function>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="56"/></function>
			<analog type="output" name="gHMI.StatusDatapoints.JogStatusDatapoint"/>
		</row>
		<row>
			<analog type="input" name="LOCK"/>
			<function position="bottom" type="ADD"><input name="" extensible="true"/></function>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="open" name="gHMI.Commands.SelectAutoMode"/>
			<line/>
			<line/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="UNHIDE"/>
			<function position="top" type="ADD"><input name="" extensible="true"/><output name="40"/></function>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gHMI.StatusDatapoints.AutoModeSDP"/>
		</row>
		<row>
			<analog type="input" name="UNLOCK"/>
			<function position="bottom" type="ADD"><input name="" extensible="true"/></function>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="closed" name="gHMI.Commands.SelectAutoMode"/>
			<line/>
			<line/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="HIDE"/>
			<function position="top" type="ADD"><input name="" extensible="true"/><output name="40"/></function>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gHMI.StatusDatapoints.AutoModeSDP"/>
		</row>
		<row>
			<analog type="input" name="LOCK"/>
			<function position="bottom" type="ADD"><input name="" extensible="true"/></function>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="General Lamp Flasher Circuit" row="3" column="0" commented="0">
		<row>
			<empty/>
			<functionblock position="header" name="FlashON" type="TON"/>
			<empty/>
		</row>
		<row>
			<contact type="closed" name="FlashOFF.Q"/>
			<functionblock position="top" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<empty/>
		</row>
		<row>
			<analog type="input" name="T#500ms"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="General Lamp Flasher" row="3" column="0" commented="0">
		<row>
			<empty/>
			<functionblock position="header" name="FlashOFF" type="TON"/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="FlashON.Q"/>
			<functionblock position="top" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<empty/>
		</row>
		<row>
			<analog type="input" name="T#500ms"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="closed" name="gIO.DIs.SafetyOK"/>
			<contact type="open" name="FlashON.Q"/>
			<line/>
			<coil type="open" name="gHMI.BitmapSelectDatapoints.ResetPress"/>
		</row>
		<row>
			<contact type="open" name="gHMI.Commands.RequestReset"/>
			<line or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="gIO.DIs.SafetyOK"/>
			<line or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="gHMI.Commands.RequestStop"/>
			<line/>
			<line/>
			<coil type="open" name="gHMI.BitmapSelectDatapoints.StopPress"/>
		</row>
	</network>
	<network label="" comment="" row="6" column="0" commented="0">
		<row>
			<contact type="closed" name="gIO.DIs.SafetyOK"/>
			<line/>
			<line/>
			<coil type="reset" name="gHMI.Commands.RequestVFDRun"/>
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
			<contact type="open" name="gModeControlInterface.Status.BlissPanelAlarmActive" or="true"/>
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
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<contact type="open" name="gIO.DIs.SafetyOK"/>
			<contact type="closed" name="gServoRamInterface.Status.InMotion"/>
			<contact type="open" name="FlashON.Q"/>
			<contact type="open" name="gHMI.Commands.SelectAutoMode"/>
			<coil type="open" name="gHMI.BitmapSelectDatapoints.RunPress"/>
		</row>
		<row>
			<contact type="open" name="gModeControlInterface.Status.Dwelling"/>
			<line/>
			<line or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="gModeControlInterface.Status.WaitingOnDownstream"/>
			<line/>
			<line or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="gServoFeedInterface.Status.InMotion"/>
			<line/>
			<line or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="gHMI.Commands.RequestVacuumOn"/>
			<line/>
			<contact type="open" name="gHMI.Commands.RequestVacuumOn"/>
			<coil type="open" name="gVacCtrlInterface.Commands.VacuumOn"/>
		</row>
		<row>
			<contact type="closed" name="gHMI.Commands.RequestVacuumOn"/>
			<contact type="open" name="FlashON.Q" or="true"/>
			<line/>
			<coil type="open" name="gHMI.BitmapSelectDatapoints.VacuumPress"/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<empty/>
			<analog type="input" name="gAdhesiveCtrlInterface.Parameters.NumAdhesiveChannels"/>
			<function position="top" type="SetPatternSDPs"><input name="NumGlueChannels"/><output name="1"/></function>
			<analog type="output" name="status"/>
		</row>
		<row>
			<empty/>
			<contact type="address" name="gHMI.ColorMapDatapoints"/>
			<function position="middle" type="SetPatternSDPs"><input name="FieldColormaps" vardynamic="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<contact type="address" name="gHMI.StatusDatapoints"/>
			<function position="bottom" type="SetPatternSDPs"><input name="FieldSDPs" vardynamic="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<analog type="input" name="gUserLevel"/>
			<function position="top" type="LT"><input name="" extensible="true"/><output name="1"/></function>
			<line/>
			<line/>
			<line/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="1"/>
			<function position="bottom" type="LT"><input name="" extensible="true"/></function>
			<analog type="input" name="HIDE"/>
			<function position="top" type="ADD"><input name="" extensible="true"/><output name="40"/></function>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gHMI.StatusDatapoints.MaintenanceSDP"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty/>
			<analog type="input" name="LOCK"/>
			<function position="bottom" type="ADD"><input name="" extensible="true"/></function>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<analog type="input" name="gUserLevel"/>
			<function position="top" type="GT"><input name="IN1" extensible="true"/><output name="1"/></function>
			<line/>
			<line/>
			<line/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="0"/>
			<function position="bottom" type="GT"><input name="" extensible="true"/></function>
			<analog type="input" name="UNHIDE"/>
			<function position="top" type="ADD"><input name="" extensible="true"/><output name="40"/></function>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gHMI.StatusDatapoints.MaintenanceSDP"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty/>
			<analog type="input" name="UNLOCK"/>
			<function position="bottom" type="ADD"><input name="" extensible="true"/></function>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="closed" name="gIO.DIs.AdhesiveUnitReady"/>
			<contact type="open" name="gAdhesiveCtrlInterface.Parameters.FeedbackIsHardwire"/>
			<line/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<contact type="closed" name="gAdhesiveCtrlInterface.Parameters.NordsonComms.UnitReady"/>
			<contact type="open" name="gAdhesiveCtrlInterface.Parameters.FeedbackIsModbusTCP" or="true"/>
			<analog type="input" name="UNHIDE"/>
			<function position="middle" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gHMI.StatusDatapoints.AdhesiveUnitNotReadySDP"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<analog type="input" name="NOTOK"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="56"/></function>
			<analog type="output" name="gHMI.ColorMapDatapoints.AdhesiveUnitReady"/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="open" name="gIO.DIs.AdhesiveUnitReady"/>
			<contact type="open" name="gAdhesiveCtrlInterface.Parameters.FeedbackIsHardwire"/>
			<line/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<contact type="open" name="gAdhesiveCtrlInterface.Parameters.NordsonComms.UnitReady"/>
			<contact type="open" name="gAdhesiveCtrlInterface.Parameters.FeedbackIsModbusTCP" or="true"/>
			<analog type="input" name="HIDE"/>
			<function position="middle" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gHMI.StatusDatapoints.AdhesiveUnitNotReadySDP"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<analog type="input" name="OK"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="56"/></function>
			<analog type="output" name="gHMI.ColorMapDatapoints.AdhesiveUnitReady"/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="closed" name="gIO.DIs.AdhesiveUnitNotFaulted"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="UNHIDE"/>
			<function position="middle" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gHMI.StatusDatapoints.AdhesiveUnitFaultSDP"/>
		</row>
		<row>
			<analog type="input" name="NOTOK"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="56"/></function>
			<analog type="output" name="gHMI.ColorMapDatapoints.AdhesiveUnitFault"/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="open" name="gIO.DIs.AdhesiveUnitNotFaulted"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="HIDE"/>
			<function position="middle" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gHMI.StatusDatapoints.AdhesiveUnitFaultSDP"/>
		</row>
		<row>
			<analog type="input" name="OK"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="56"/></function>
			<analog type="output" name="gHMI.ColorMapDatapoints.AdhesiveUnitFault"/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="open" name="gIO.DIs.AdhesiveLevelLow"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="UNHIDE"/>
			<function position="middle" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gHMI.StatusDatapoints.AdhesiveUnitLevelLowSDP"/>
		</row>
		<row>
			<analog type="input" name="NOTOK"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="56"/></function>
			<analog type="output" name="gHMI.ColorMapDatapoints.AdhesiveUnitLevelLow"/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="closed" name="gIO.DIs.AdhesiveLevelLow"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="HIDE"/>
			<function position="middle" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gHMI.StatusDatapoints.AdhesiveUnitLevelLowSDP"/>
		</row>
		<row>
			<analog type="input" name="OK"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="56"/></function>
			<analog type="output" name="gHMI.ColorMapDatapoints.AdhesiveUnitLevelLow"/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="open" name="gIO.DIs.LowAdhesiveUseage"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="UNHIDE"/>
			<function position="middle" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gHMI.StatusDatapoints.AdhesiveUseageLowSDP"/>
		</row>
		<row>
			<analog type="input" name="NOTOK"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="56"/></function>
			<analog type="output" name="gHMI.ColorMapDatapoints.AdhesiveUseageLow"/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="closed" name="gIO.DIs.LowAdhesiveUseage"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="HIDE"/>
			<function position="middle" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gHMI.StatusDatapoints.AdhesiveUseageLowSDP"/>
		</row>
		<row>
			<analog type="input" name="OK"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="56"/></function>
			<analog type="output" name="gHMI.ColorMapDatapoints.AdhesiveUseageLow"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="closed" name="gIO.DIs.VacuumPressureOK"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="OK"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gHMI.StatusDatapoints.VacuumPressureFaultSDP"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="gIO.DIs.VacuumPressureOK"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="NOTOK"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gHMI.StatusDatapoints.VacuumPressureFaultSDP"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="gIO.DOs.VacuumOn"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="OK"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gHMI.ColorMapDatapoints.VacuumPumpOn"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="closed" name="gIO.DOs.VacuumOn"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="NOTOK"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gHMI.ColorMapDatapoints.VacuumPumpOn"/>
		</row>
	</network>
	<network label="" comment="*********************************   RECIPE HANDLING      ******************************************" row="1" column="0" commented="0">
		<row>
			<contact type="positive transition" name="gHMI.Commands.LoadRecipe"/>
			<line/>
			<line/>
			<coil type="set" name="gRecipeInterface.Commands.LoadRecipe"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="positive transition" name="gHMI.Commands.SaveRecipe"/>
			<line/>
			<line/>
			<coil type="set" name="gRecipeInterface.Commands.SaveRecipe"/>
		</row>
	</network>
	<network label="" comment="" row="9" column="0" commented="0">
		<row>
			<contact type="open" name="gHMI.Commands.RequestBoxType1"/>
			<contact type="closed" name="gHMI.Commands.LoadRecipeType1"/>
			<line/>
			<coil type="reset" name="gHMI.StatusDatapoints.RecipeDialogSDP.0"/>
		</row>
		<row>
			<empty or="true"/>
			<empty or="true"/>
			<line/>
			<coil type="reset" name="gHMI.Commands.RequestBoxType2"/>
		</row>
		<row>
			<empty or="true"/>
			<contact type="open" name="gHMI.Commands.CancelBoxChange"/>
			<line/>
			<coil type="reset" name="gHMI.Commands.RequestBoxType1"/>
		</row>
		<row>
			<empty or="true"/>
			<empty or="true"/>
			<line/>
			<coil type="reset" name="gHMI.Commands.CancelBoxChange"/>
		</row>
		<row>
			<empty or="true"/>
			<empty or="true"/>
			<line/>
			<coil type="set" name="gHMI.StatusDatapoints.RecipeDialogSDP.0"/>
		</row>
		<row>
			<empty or="true"/>
			<contact type="open" name="gHMI.Commands.ConfirmBoxChange"/>
			<line/>
			<coil type="set" name="gHMI.Commands.LoadRecipeType1"/>
		</row>
		<row>
			<empty/>
			<empty or="true"/>
			<line/>
			<coil type="reset" name="gHMI.Commands.ConfirmBoxChange"/>
		</row>
		<row>
			<empty/>
			<empty or="true"/>
			<line/>
			<coil type="reset" name="gHMI.Commands.RequestBoxType1"/>
		</row>
		<row>
			<empty/>
			<empty or="true"/>
			<line/>
			<coil type="set" name="gHMI.StatusDatapoints.RecipeDialogSDP.0"/>
		</row>
	</network>
	<network label="" comment="" row="9" column="0" commented="0">
		<row>
			<contact type="open" name="gHMI.Commands.RequestBoxType2"/>
			<contact type="closed" name="gHMI.Commands.LoadRecipeType2"/>
			<line/>
			<coil type="reset" name="gHMI.StatusDatapoints.RecipeDialogSDP.0"/>
		</row>
		<row>
			<empty or="true"/>
			<empty or="true"/>
			<line/>
			<coil type="reset" name="gHMI.Commands.RequestBoxType1"/>
		</row>
		<row>
			<empty or="true"/>
			<contact type="open" name="gHMI.Commands.CancelBoxChange"/>
			<line/>
			<coil type="reset" name="gHMI.Commands.RequestBoxType2"/>
		</row>
		<row>
			<empty or="true"/>
			<empty or="true"/>
			<line/>
			<coil type="reset" name="gHMI.Commands.CancelBoxChange"/>
		</row>
		<row>
			<empty or="true"/>
			<empty or="true"/>
			<line/>
			<coil type="set" name="gHMI.StatusDatapoints.RecipeDialogSDP.0"/>
		</row>
		<row>
			<empty or="true"/>
			<contact type="open" name="gHMI.Commands.ConfirmBoxChange"/>
			<line/>
			<coil type="set" name="gHMI.Commands.LoadRecipeType2"/>
		</row>
		<row>
			<empty/>
			<empty or="true"/>
			<line/>
			<coil type="reset" name="gHMI.Commands.ConfirmBoxChange"/>
		</row>
		<row>
			<empty/>
			<empty or="true"/>
			<line/>
			<coil type="reset" name="gHMI.Commands.RequestBoxType2"/>
		</row>
		<row>
			<empty/>
			<empty or="true"/>
			<line/>
			<coil type="set" name="gHMI.StatusDatapoints.RecipeDialogSDP.0"/>
		</row>
	</network>
	<network label="" comment="" row="6" column="0" commented="0">
		<row>
			<contact type="positive transition" name="gHMI.Commands.LoadRecipeType1"/>
			<line/>
			<line/>
			<coil type="set" name="gRecipeInterface.Commands.LoadRecipe"/>
		</row>
		<row>
			<empty or="true"/>
			<line/>
			<line/>
			<coil type="reset" name="gHMI.Commands.LoadRecipeType2"/>
		</row>
		<row>
			<empty or="true"/>
			<line/>
			<line/>
			<coil type="reset" name="gHMI.StatusDatapoints.RecipeReq2SDP.1"/>
		</row>
		<row>
			<empty or="true"/>
			<line/>
			<line/>
			<coil type="set" name="gHMI.StatusDatapoints.RecipeReq1SDP.1"/>
		</row>
		<row>
			<empty or="true"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="TYPE1_RECIPE_NAME"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gRecipeInterface.Parameters.RecipeName"/>
		</row>
	</network>
	<network label="" comment="" row="6" column="0" commented="0">
		<row>
			<contact type="positive transition" name="gHMI.Commands.LoadRecipeType2"/>
			<line/>
			<line/>
			<coil type="set" name="gRecipeInterface.Commands.LoadRecipe"/>
		</row>
		<row>
			<empty or="true"/>
			<line/>
			<line/>
			<coil type="reset" name="gHMI.Commands.LoadRecipeType1"/>
		</row>
		<row>
			<empty or="true"/>
			<line/>
			<line/>
			<coil type="set" name="gHMI.StatusDatapoints.RecipeReq2SDP.1"/>
		</row>
		<row>
			<empty or="true"/>
			<line/>
			<line/>
			<coil type="reset" name="gHMI.StatusDatapoints.RecipeReq1SDP.1"/>
		</row>
		<row>
			<empty or="true"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="TYPE2_RECIPE_NAME"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gRecipeInterface.Parameters.RecipeName"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<line/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="gRecipeInterface.Status.LoadedRecipeIndex"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gHMI.StatusDatapoints.RecipeIndexSDP"/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="closed" name="gHMI.Commands.LoadRecipeType1"/>
			<contact type="closed" name="gHMI.Commands.LoadRecipeType2"/>
			<function position="top" type="EQ"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="gHMI.StatusDatapoints.RecipeIndexSDP"/>
			<function position="middle" type="EQ"><input name="" extensible="true"/><output name="1"/></function>
			<analog type="output" name="gHMI.Commands.LoadRecipeType1"/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="1"/>
			<function position="bottom" type="EQ"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="closed" name="gHMI.Commands.LoadRecipeType1"/>
			<contact type="closed" name="gHMI.Commands.LoadRecipeType2"/>
			<function position="top" type="EQ"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="gHMI.StatusDatapoints.RecipeIndexSDP"/>
			<function position="middle" type="EQ"><input name="" extensible="true"/><output name="1"/></function>
			<analog type="output" name="gHMI.Commands.LoadRecipeType2"/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="2"/>
			<function position="bottom" type="EQ"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="gRecipeInterface.Status.Busy"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="OK"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gHMI.ColorMapDatapoints.RecipeSystemBusy"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="closed" name="gRecipeInterface.Status.Busy"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="NOTOK"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gHMI.ColorMapDatapoints.RecipeSystemBusy"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<analog type="input" name="gRecipeInterface.Parameters.RecipeName"/>
			<function position="top" type="EQ"><input name="" extensible="true"/><output name="1"/></function>
			<analog type="output" name="SettingsLoaded"/>
		</row>
		<row>
			<analog type="input" name="gRecipeInterface.Status.LoadedRecipeName"/>
			<function position="bottom" type="EQ"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="SettingsLoaded"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="OK"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gHMI.ColorMapDatapoints.RecipeLoaded"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="SettingsLoaded"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="OK"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gHMI.ColorMapDatapoints.RecipeLoaded"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="closed" name="gAlarmActive"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="ALARM_INACTIVE"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gHMI.BitmapSelectDatapoints.AlarmActive"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="gAlarmActive"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="ALARM_ACTIVE"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gHMI.BitmapSelectDatapoints.AlarmActive"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="closed" name="gAdhesiveCtrlInterface.Status.AlarmActive"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="OK"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gHMI.ColorMapDatapoints.AdhesiveSystemOK"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="gAdhesiveCtrlInterface.Status.AlarmActive"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="NOTOK"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gHMI.ColorMapDatapoints.AdhesiveSystemOK"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="closed" name="gAirPressureAlarmActive"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="OK"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gHMI.ColorMapDatapoints.AirPressureOK"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="gAirPressureAlarmActive"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="NOTOK"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gHMI.ColorMapDatapoints.AirPressureOK"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="closed" name="gVacCtrlInterface.Status.AlarmActive"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="OK"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gHMI.ColorMapDatapoints.VacuumOK"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="gVacCtrlInterface.Status.AlarmActive"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="NOTOK"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gHMI.ColorMapDatapoints.VacuumOK"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="closed" name="gSafetyNotOKAlarmActive"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="OK"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gHMI.ColorMapDatapoints.SafetyOK"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="gSafetyNotOKAlarmActive"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="NOTOK"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gHMI.ColorMapDatapoints.SafetyOK"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="closed" name="gServoFeedInterface.Status.Error"/>
			<contact type="closed" name="gServoHopperInterface.Status.Error"/>
			<contact type="closed" name="gServoRamInterface.Status.Error"/>
			<contact type="closed" name="gFoldPushCtrlInterface.Parameters.LinMotBotFolder.Status.Error"/>
			<contact type="closed" name="gFoldPushCtrlInterface.Parameters.LinMotTopFolder.Status.Error"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<analog type="input" name="OK"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gHMI.ColorMapDatapoints.DriveFaultOK"/>
		</row>
	</network>
	<network label="" comment="" row="5" column="0" commented="0">
		<row>
			<contact type="open" name="gServoFeedInterface.Status.Error"/>
			<line/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<contact type="open" name="gServoHopperInterface.Status.Error" or="true"/>
			<analog type="input" name="NOTOK"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gHMI.ColorMapDatapoints.DriveFaultOK"/>
		</row>
		<row>
			<contact type="open" name="gServoRamInterface.Status.Error" or="true"/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="gFoldPushCtrlInterface.Parameters.LinMotBotFolder.Status.Error" or="true"/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="gFoldPushCtrlInterface.Parameters.LinMotTopFolder.Status.Error" or="true"/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="gIO.DIs.DownstreamSensor"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="NOTOK"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gHMI.ColorMapDatapoints.DownstreamSensorOK"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="closed" name="gIO.DIs.DownstreamSensor"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="OK"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gHMI.ColorMapDatapoints.DownstreamSensorOK"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="closed" name="gFoldPushCtrlInterface.Status.TopFoldValveStatus"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="NOTOK"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gHMI.ColorMapDatapoints.Valve1OK"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="gFoldPushCtrlInterface.Status.TopFoldValveStatus"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="OK"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gHMI.ColorMapDatapoints.Valve1OK"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="closed" name="gFoldPushCtrlInterface.Status.BottomFoldValveStatus"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="NOTOK"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gHMI.ColorMapDatapoints.Valve2OK"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="gFoldPushCtrlInterface.Status.BottomFoldValveStatus"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="OK"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gHMI.ColorMapDatapoints.Valve2OK"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="closed" name="gFoldPushCtrlInterface.Status.CompOnValveStatus"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="NOTOK"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gHMI.ColorMapDatapoints.Valve3OK"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="gFoldPushCtrlInterface.Status.CompOnValveStatus"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="OK"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gHMI.ColorMapDatapoints.Valve3OK"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="closed" name="gFoldPushCtrlInterface.Status.PushValveStatus"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="NOTOK"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gHMI.ColorMapDatapoints.Valve4OK"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="gFoldPushCtrlInterface.Status.PushValveStatus"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="OK"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gHMI.ColorMapDatapoints.Valve4OK"/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="open" name="gFoldPushCtrlInterface.Status.HardwireConfig"/>
			<line/>
			<line/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="UNHIDE"/>
			<function position="top" type="ADD"><input name="" extensible="true"/><output name="40"/></function>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gHMI.StatusDatapoints.HardwireValveSDP"/>
		</row>
		<row>
			<analog type="input" name="UNLOCK"/>
			<function position="bottom" type="ADD"><input name="" extensible="true"/></function>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="gIO.SafetyStatus.SafetyProgramRunning"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="HIDE"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gHMI.StatusDatapoints.SafetyStartingSDP"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="closed" name="gIO.SafetyStatus.SafetyProgramRunning"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="UNHIDE"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gHMI.StatusDatapoints.SafetyStartingSDP"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="gAlarmActive"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="PAGE_ALARM"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gChangePage"/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<analog type="input" name="gModeControlInterface.Parameters.MachineType"/>
			<function position="top" type="EQ"><input name="IN1" extensible="true"/><output name="1"/></function>
			<line/>
			<line/>
			<line/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="MACHINE_TYPE_BLISS"/>
			<function position="bottom" type="EQ"><input name="" extensible="true"/></function>
			<analog type="input" name="UNHIDE"/>
			<function position="top" type="ADD"><input name="" extensible="true"/><output name="40"/></function>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gHMI.StatusDatapoints.BlissSDP"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty/>
			<analog type="input" name="UNLOCK"/>
			<function position="bottom" type="ADD"><input name="" extensible="true"/></function>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<analog type="input" name="gModeControlInterface.Parameters.MachineType"/>
			<function position="top" type="NE"><input name="IN1"/><output name="1"/></function>
			<line/>
			<line/>
			<line/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="MACHINE_TYPE_BLISS"/>
			<function position="bottom" type="NE"><input name="IN2"/></function>
			<analog type="input" name="HIDE"/>
			<function position="top" type="ADD"><input name="" extensible="true"/><output name="40"/></function>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gHMI.StatusDatapoints.BlissSDP"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty/>
			<analog type="input" name="LOCK"/>
			<function position="bottom" type="ADD"><input name="" extensible="true"/></function>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<analog type="input" name="gModeControlInterface.Parameters.MachineType"/>
			<function position="top" type="EQ"><input name="" extensible="true"/><output name="1"/></function>
			<line/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="MACHINE_TYPE_CLASSICPAK"/>
			<function position="bottom" type="EQ"><input name="" extensible="true"/></function>
			<analog type="input" name="20"/>
			<function position="middle" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gModeControlInterface.Parameters.MaxPPM"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty/>
			<analog type="input" name="0"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="56"/></function>
			<analog type="output" name="gModeControlInterface.Parameters.MinPPM"/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<analog type="input" name="gModeControlInterface.Parameters.MachineType"/>
			<function position="top" type="EQ"><input name="" extensible="true"/><output name="1"/></function>
			<line/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="MACHINE_TYPE_BLISS"/>
			<function position="bottom" type="EQ"><input name="" extensible="true"/></function>
			<analog type="input" name="25"/>
			<function position="middle" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gModeControlInterface.Parameters.MaxPPM"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty/>
			<analog type="input" name="0"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="56"/></function>
			<analog type="output" name="gModeControlInterface.Parameters.MinPPM"/>
		</row>
	</network>
	<network label="" comment="" row="6" column="0" commented="0">
		<row>
			<analog type="input" name="gModeControlInterface.Parameters.MachineType"/>
			<function position="top" type="EQ"><input name="" extensible="true"/><output name="1"/></function>
			<line/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="MACHINE_TYPE_TRAY"/>
			<function position="bottom" type="EQ" or="true"><input name="" extensible="true"/></function>
			<analog type="input" name="25"/>
			<function position="middle" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gModeControlInterface.Parameters.MaxPPM"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty or="true"/>
			<analog type="input" name="0"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="56"/></function>
			<analog type="output" name="gModeControlInterface.Parameters.MinPPM"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty or="true"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
			<empty/>
		</row>
		<row>
			<analog type="input" name="UNHIDE"/>
			<function position="top" type="ADD"><input name="" extensible="true"/><output name="40"/></function>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gHMI.StatusDatapoints.TraySDP"/>
			<empty/>
		</row>
		<row>
			<analog type="input" name="UNLOCK"/>
			<function position="bottom" type="ADD"><input name="" extensible="true"/></function>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<analog type="input" name="gModeControlInterface.Parameters.MachineType"/>
			<function position="top" type="NE"><input name="IN1"/><output name="1"/></function>
			<line/>
			<line/>
			<line/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="MACHINE_TYPE_TRAY"/>
			<function position="bottom" type="NE"><input name="IN2"/></function>
			<analog type="input" name="HIDE"/>
			<function position="top" type="ADD"><input name="" extensible="true"/><output name="40"/></function>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gHMI.StatusDatapoints.TraySDP"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty/>
			<analog type="input" name="LOCK"/>
			<function position="bottom" type="ADD"><input name="" extensible="true"/></function>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<analog type="input" name="gModeControlInterface.Parameters.MaxPPM"/>
			<function position="top" type="LT"><input name="IN1" extensible="true"/><output name="1"/></function>
			<line/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="gModeControlInterface.Parameters.PiecesPerMinute"/>
			<function position="bottom" type="LT"><input name="" extensible="true"/></function>
			<analog type="input" name="gModeControlInterface.Parameters.MaxPPM"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gModeControlInterface.Parameters.PiecesPerMinute"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<analog type="input" name="gModeControlInterface.Parameters.MinPPM"/>
			<function position="top" type="GT"><input name="" extensible="true"/><output name="1"/></function>
			<line/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="gModeControlInterface.Parameters.PiecesPerMinute"/>
			<function position="bottom" type="GT"><input name="" extensible="true"/></function>
			<analog type="input" name="gModeControlInterface.Parameters.MinPPM"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gModeControlInterface.Parameters.PiecesPerMinute"/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<empty/>
			<functionblock position="header" name="LogoutTimer" type="TON"/>
			<empty/>
		</row>
		<row>
			<contact type="closed" name="ResetTimeoutTimer"/>
			<functionblock position="top" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<coil type="open" name="ResetUserLevel"/>
		</row>
		<row>
			<analog type="input" name="T#120s"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="positive transition" name="ResetUserLevel"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="0"/>
			<function position="middle" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gUserLevel"/>
		</row>
		<row>
			<analog type="input" name="0"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="56"/></function>
			<analog type="output" name="gChangePage"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<analog type="input" name="gActivePage"/>
			<function position="top" type="NE"><input name="IN1"/><output name="1"/></function>
			<coil type="open" name="ResetTimeoutTimer"/>
		</row>
		<row>
			<analog type="input" name="OldPage"/>
			<function position="bottom" type="NE"><input name="IN2"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<analog type="input" name="gActivePage"/>
			<function position="topbottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="OldPage"/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="closed" name="gFoldPushCtrlInterface.Status.LinMotConfig"/>
			<line/>
			<line/>
			<coil type="open" name="gHMI.StatusDatapoints.LinMotSDP.0"/>
		</row>
		<row>
			<empty or="true"/>
			<line/>
			<line/>
			<coil type="open" name="gHMI.StatusDatapoints.LinMotTopHomeSDP.0"/>
		</row>
		<row>
			<empty or="true"/>
			<line/>
			<line/>
			<coil type="open" name="gHMI.StatusDatapoints.LinMotBotHomeSDP.0"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="gHMI.ColorMapDatapoints.AutoModeSelected.0"/>
			<line/>
			<line/>
			<coil type="open" name="gHMI.StatusDatapoints.LinMotTopHomeSDP.1"/>
		</row>
		<row>
			<empty or="true"/>
			<line/>
			<line/>
			<coil type="open" name="gHMI.StatusDatapoints.LinMotBotHomeSDP.1"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="closed" name="gFoldPushCtrlInterface.Status.PneumaticConfig"/>
			<line/>
			<line/>
			<coil type="open" name="gHMI.StatusDatapoints.PnuematicFolderSDP.0"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<analog type="input" name="gAdhesiveCtrlInterface.Status.ATS_AddOnOverLimit"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="NOTOK"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gHMI.ColorMapDatapoints.ATSAddOnOver"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="closed" name="gAdhesiveCtrlInterface.Status.ATS_AddOnOverLimit"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="OK"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gHMI.ColorMapDatapoints.ATSAddOnOver"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<analog type="input" name="gAdhesiveCtrlInterface.Status.ATS_AddOnUnderLimit"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="NOTOK"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gHMI.ColorMapDatapoints.ATSAddOnUnder"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="closed" name="gAdhesiveCtrlInterface.Status.ATS_AddOnUnderLimit"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="OK"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gHMI.ColorMapDatapoints.ATSAddOnUnder"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<line/>
			<function position="top" type="SIZEOF"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="gAdhesiveCtrlInterface.Parameters.NordsonComms.ChannelSetTempActual"/>
			<function position="bottom" type="SIZEOF"><input name="in"/><output name="7"/></function>
			<analog type="output" name="gAdhesiveCtrlInterface.Parameters.NordsonComms.ChannelDataSize"/>
		</row>
	</network>
	<network label="" comment="Flash save set temp button if  requested temps are different from current set temps" row="4" column="0" commented="0">
		<row>
			<empty/>
			<analog type="input" name="TRUE"/>
			<function position="top" type="brsmemcmp"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<contact type="address" name="gAdhesiveCtrlInterface.Parameters.NordsonComms.ChannelSetTempActual"/>
			<function position="middle" type="brsmemcmp"><input name="pMem1"/><output name="4"/></function>
			<analog type="output" name="gAdhesiveCtrlInterface.Parameters.NordsonComms.ChannelDataCmpResult"/>
		</row>
		<row>
			<empty/>
			<contact type="address" name="gAdhesiveCtrlInterface.Parameters.NordsonComms.ChannelSetTempRequested"/>
			<function position="middle" type="brsmemcmp"><input name="pMem2"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="gAdhesiveCtrlInterface.Parameters.NordsonComms.ChannelDataSize"/>
			<function position="bottom" type="brsmemcmp"><input name="length"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<line/>
			<function position="top" type="Compare!"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<function position="middle" type="Compare!"><input name=""/><output name="56"/></function>
			<analog type="output" name="gHMI.ColorMapDatapoints.NordsonEditTemps"/>
		</row>
		<row>
			<empty/>
			<function position="bottom" type="Compare!"><input name="&lt;!gAdhesiveCtrlInterface.Parameters.NordsonComms.ChannelDataCmpResult &lt;&gt; 0"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="gHMI.ColorMapDatapoints.NordsonEditTemps.0"/>
			<contact type="open" name="FlashON.Q"/>
			<line/>
			<coil type="open" name="gHMI.ColorMapDatapoints.NordsonEditTemps.0"/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="open" name="gIO.DIs.BodyHopperLow"/>
			<line/>
			<line/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="UNHIDE"/>
			<function position="top" type="ADD"><input name="" extensible="true"/><output name="40"/></function>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gHMI.StatusDatapoints.HopperLowSDP"/>
		</row>
		<row>
			<analog type="input" name="UNLOCK"/>
			<function position="bottom" type="ADD"><input name="" extensible="true"/></function>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="closed" name="gIO.DIs.BodyHopperLow"/>
			<line/>
			<line/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="HIDE"/>
			<function position="top" type="ADD"><input name="" extensible="true"/><output name="40"/></function>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gHMI.StatusDatapoints.HopperLowSDP"/>
		</row>
		<row>
			<analog type="input" name="LOCK"/>
			<function position="bottom" type="ADD"><input name="" extensible="true"/></function>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="closed" name="gHMI.Commands.CycleServoRam"/>
			<line/>
			<line/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="UNHIDE"/>
			<function position="top" type="ADD"><input name="" extensible="true"/><output name="40"/></function>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gHMI.StatusDatapoints.HomeServoRamSDP"/>
		</row>
		<row>
			<analog type="input" name="UNLOCK"/>
			<function position="bottom" type="ADD"><input name="" extensible="true"/></function>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="open" name="gHMI.Commands.CycleServoRam"/>
			<line/>
			<line/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="HIDE"/>
			<function position="top" type="ADD"><input name="" extensible="true"/><output name="40"/></function>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gHMI.StatusDatapoints.HomeServoRamSDP"/>
		</row>
		<row>
			<analog type="input" name="LOCK"/>
			<function position="bottom" type="ADD"><input name="" extensible="true"/></function>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="open" name="LubricationOK"/>
			<line/>
			<line/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="HIDE"/>
			<function position="top" type="ADD"><input name="" extensible="true"/><output name="40"/></function>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gHMI.StatusDatapoints.LubeSDP"/>
		</row>
		<row>
			<analog type="input" name="LOCK"/>
			<function position="bottom" type="ADD"><input name="" extensible="true"/></function>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="closed" name="LubricationOK"/>
			<line/>
			<line/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="UNHIDE"/>
			<function position="top" type="ADD"><input name="" extensible="true"/><output name="40"/></function>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gHMI.StatusDatapoints.LubeSDP"/>
		</row>
		<row>
			<analog type="input" name="UNLOCK"/>
			<function position="bottom" type="ADD"><input name="" extensible="true"/></function>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="gHMI.StatusDatapoints.AdhesivePatternConfirmedSDP.0"/>
			<line/>
			<line/>
			<coil type="set" name="gHMI.StatusDatapoints.AdhesivePatternConfirmDialogSDP.0"/>
		</row>
		<row>
			<empty or="true"/>
			<line/>
			<line/>
			<coil type="set" name="gHMI.StatusDatapoints.AdhesivePatternDialogSDP.0"/>
		</row>
	</network>
</networks>
END_PROGRAM








































































