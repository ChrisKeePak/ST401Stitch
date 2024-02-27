PROGRAM _CYCLIC
<?xml version="1.0"?>
<?AutomationStudio Version=3.0.71?>
<!-- Automation Studio Generated XML Section -->
<networks maxcolumn="0">
	<network label="" comment="" row="7" column="0" commented="0">
		<row>
			<empty/>
			<empty/>
			<functionblock position="header" name="MpAlarmXCore_0" type="MpAlarmXCore"/>
			<empty/>
		</row>
		<row>
			<empty/>
			<contact type="address" name="gAlarmXCore"/>
			<functionblock position="top" type="MpAlarmXCore"><input name="MpLink" vardynamic="true"/><output name="Active"/></functionblock>
			<analog type="output" name="gAlarmSystemActive"/>
		</row>
		<row>
			<line/>
			<line/>
			<functionblock position="middle" type="MpAlarmXCore"><input name="Enable"/><output name="Error"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="open" name="gSoftwareReset"/>
			<line/>
			<functionblock position="middle" type="MpAlarmXCore"><input name="ErrorReset"/><output name="StatusID"/></functionblock>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<functionblock position="middle" type="MpAlarmXCore"><output name="ActiveAlarms"/></functionblock>
			<analog type="output" name="gNumActiveAlarms"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<functionblock position="middle" type="MpAlarmXCore"><output name="PendingAlarms"/></functionblock>
			<analog type="output" name="gNumAlarms"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<functionblock position="bottom" type="MpAlarmXCore"><output name="Info"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="6" column="0" commented="0">
		<row>
			<empty/>
			<empty/>
			<functionblock position="header" name="MpAlarmXListUI_0" type="MpAlarmXListUI"/>
			<empty/>
		</row>
		<row>
			<empty/>
			<contact type="address" name="gAlarmXCore"/>
			<functionblock position="top" type="MpAlarmXListUI"><input name="MpLink" vardynamic="true"/><output name="Active"/></functionblock>
			<empty/>
		</row>
		<row>
			<line/>
			<line/>
			<functionblock position="middle" type="MpAlarmXListUI"><input name="Enable"/><output name="Error"/></functionblock>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<functionblock position="middle" type="MpAlarmXListUI"><input name="ErrorReset"/><output name="StatusID"/></functionblock>
			<empty/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="AlarmUISetup"/>
			<functionblock position="middle" type="MpAlarmXListUI"><input name="UISetup"/><output name="Info"/></functionblock>
			<empty/>
		</row>
		<row>
			<empty/>
			<contact type="address" name="AlarmUIConnect"/>
			<functionblock position="bottom" type="MpAlarmXListUI"><input name="UIConnect" vardynamic="true"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<analog type="input" name="MpAlarmXCore_0.ActiveAlarms"/>
			<function position="top" type="GT"><input name="" extensible="true"/><output name="1"/></function>
			<analog type="output" name="gAlarmActive"/>
		</row>
		<row>
			<analog type="input" name="0"/>
			<function position="bottom" type="GT"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<empty/>
			<contact type="address" name="AlarmListAdapter"/>
			<function position="top" type="AlarmInfoAdapter"><input name="pAlarmListAdapter" vardynamic="true"/><output name="1"/></function>
			<analog type="output" name="status"/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="AlarmUIConnect.AlarmList"/>
			<function position="middle" type="AlarmInfoAdapter"><input name="AlarmList"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="gNumAlarms"/>
			<function position="bottom" type="AlarmInfoAdapter"><input name="NumPendingAlarms"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="7" column="0" commented="0">
		<row>
			<empty/>
			<empty/>
			<functionblock position="header" name="MpAlarmXHistory_0" type="MpAlarmXHistory"/>
			<empty/>
		</row>
		<row>
			<empty/>
			<contact type="address" name="gAlarmXHistory"/>
			<functionblock position="top" type="MpAlarmXHistory"><input name="MpLink" vardynamic="true"/><output name="Active"/></functionblock>
			<empty/>
		</row>
		<row>
			<line/>
			<line/>
			<functionblock position="middle" type="MpAlarmXHistory"><input name="Enable"/><output name="Error"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="open" name="gSoftwareReset"/>
			<line/>
			<functionblock position="middle" type="MpAlarmXHistory"><input name="ErrorReset"/><output name="StatusID"/></functionblock>
			<empty/>
		</row>
		<row>
			<empty/>
			<contact type="address" name="'recipes'"/>
			<functionblock position="middle" type="MpAlarmXHistory"><input name="DeviceName" vardynamic="true"/><output name="CommandBusy"/></functionblock>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<functionblock position="middle" type="MpAlarmXHistory"><input name="Language" vardynamic="true"/><output name="CommandDone"/></functionblock>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<functionblock position="bottom" type="MpAlarmXHistory"><input name="Export"/><output name="Info"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="6" column="0" commented="0">
		<row>
			<empty/>
			<empty/>
			<functionblock position="header" name="MpAlarmXHistoryUI_0" type="MpAlarmXHistoryUI"/>
			<empty/>
		</row>
		<row>
			<empty/>
			<contact type="address" name="gAlarmXHistory"/>
			<functionblock position="top" type="MpAlarmXHistoryUI"><input name="MpLink" vardynamic="true"/><output name="Active"/></functionblock>
			<empty/>
		</row>
		<row>
			<line/>
			<line/>
			<functionblock position="middle" type="MpAlarmXHistoryUI"><input name="Enable"/><output name="Error"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="open" name="gSoftwareReset"/>
			<line/>
			<functionblock position="middle" type="MpAlarmXHistoryUI"><input name="ErrorReset"/><output name="StatusID"/></functionblock>
			<empty/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="AlarmXHistoryUISetup"/>
			<functionblock position="middle" type="MpAlarmXHistoryUI"><input name="UISetup"/><output name="Info"/></functionblock>
			<empty/>
		</row>
		<row>
			<empty/>
			<contact type="address" name="AlarmXHistoryUIConnect"/>
			<functionblock position="bottom" type="MpAlarmXHistoryUI"><input name="UIConnect" vardynamic="true"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<actionblock position="topbottom"><input qualifier="N"/><output name="HistoryCodeToString"/></actionblock>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<analog type="input" name="gAlarmXCore"/>
			<function position="top" type="MpAlarmXCheckReaction"><input name="MpLink"/><output name="1"/></function>
			<coil type="open" name="gLowSeverityAlarmActive"/>
		</row>
		<row>
			<analog type="input" name="'LowSeverityAlarmActive'"/>
			<function position="bottom" type="MpAlarmXCheckReaction"><input name="Name"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<analog type="input" name="gAlarmXCore"/>
			<function position="top" type="MpAlarmXCheckReaction"><input name="MpLink"/><output name="1"/></function>
			<coil type="open" name="gHighSeverityAlarmActive"/>
		</row>
		<row>
			<analog type="input" name="'HighSeverityAlarmActive'"/>
			<function position="bottom" type="MpAlarmXCheckReaction"><input name="Name"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<analog type="input" name="gAlarmXCore"/>
			<function position="top" type="MpAlarmXCheckReaction"><input name="MpLink"/><output name="1"/></function>
			<coil type="open" name="gAdhesiveCtrlInterface.Status.AlarmActive"/>
		</row>
		<row>
			<analog type="input" name="'AdhesiveAlarm'"/>
			<function position="bottom" type="MpAlarmXCheckReaction"><input name="Name"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<analog type="input" name="gAlarmXCore"/>
			<function position="top" type="MpAlarmXCheckReaction"><input name="MpLink"/><output name="1"/></function>
			<coil type="open" name="gVacCtrlInterface.Status.AlarmActive"/>
		</row>
		<row>
			<analog type="input" name="'VacuumAlarm'"/>
			<function position="bottom" type="MpAlarmXCheckReaction"><input name="Name"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<analog type="input" name="gAlarmXCore"/>
			<function position="top" type="MpAlarmXCheckReaction"><input name="MpLink"/><output name="1"/></function>
			<coil type="open" name="gAirPressureAlarmActive"/>
		</row>
		<row>
			<analog type="input" name="'AirAlarm'"/>
			<function position="bottom" type="MpAlarmXCheckReaction"><input name="Name"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<analog type="input" name="gAlarmXCore"/>
			<function position="top" type="MpAlarmXCheckReaction"><input name="MpLink"/><output name="1"/></function>
			<coil type="open" name="gSafetyNotOKAlarmActive"/>
		</row>
		<row>
			<analog type="input" name="'SafetyAlarm'"/>
			<function position="bottom" type="MpAlarmXCheckReaction"><input name="Name"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<analog type="input" name="gAlarmXCore"/>
			<function position="top" type="MpAlarmXCheckReaction"><input name="MpLink"/><output name="1"/></function>
			<coil type="open" name="gModeControlInterface.Status.BlissPanelAlarmActive"/>
		</row>
		<row>
			<analog type="input" name="'BlissPanelAlarm'"/>
			<function position="bottom" type="MpAlarmXCheckReaction"><input name="Name"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="closed" name="gAlarmSystemActive"/>
			<line/>
			<line/>
			<coil type="return"/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<empty/>
			<analog type="input" name="gIO.ModuleOKs"/>
			<function position="top" type="CheckIOModules"><input name="ModuleOKs"/><output name="1"/></function>
			<analog type="output" name="status"/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="gAlarmXCore"/>
			<function position="middle" type="CheckIOModules"><input name="AlarmLink"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<contact type="address" name="IOAlarmText"/>
			<function position="middle" type="CheckIOModules"><input name="pAlarmMsg"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="gFoldPushCtrlInterface.Status.PowelinkConfig"/>
			<function position="bottom" type="CheckIOModules"><input name="NumaticsPresent"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<analog type="input" name="gAlarmXCore"/>
			<function position="top" type="MpAlarmXCheckState"><input name="MpLink"/><output name="1"/></function>
			<coil type="open" name="TestAlarmActive"/>
		</row>
		<row>
			<analog type="input" name="ALARM_TEST_ALARM"/>
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
			<contact type="open" name="TestAlarm"/>
			<contact type="closed" name="TestAlarmActive"/>
			<function position="top" type="MpAlarmXSet"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="gAlarmXCore"/>
			<function position="middle" type="MpAlarmXSet"><input name="MpLink"/><output name="7"/></function>
			<analog type="output" name="AlarmStatus"/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="ALARM_TEST_ALARM"/>
			<function position="bottom" type="MpAlarmXSet"><input name="Name"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="closed" name="TestAlarm"/>
			<contact type="open" name="TestAlarmActive"/>
			<function position="top" type="MpAlarmXReset"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="gAlarmXCore"/>
			<function position="middle" type="MpAlarmXReset"><input name="MpLink"/><output name="4"/></function>
			<analog type="output" name="AlarmStatus"/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="ALARM_TEST_ALARM"/>
			<function position="bottom" type="MpAlarmXReset"><input name="Name"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<analog type="input" name="gAlarmXCore"/>
			<function position="top" type="MpAlarmXCheckState"><input name="MpLink"/><output name="1"/></function>
			<coil type="open" name="TestAlarm2Active"/>
		</row>
		<row>
			<analog type="input" name="ALARM_TEST_ALARM2"/>
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
			<contact type="open" name="TestAlarm2"/>
			<contact type="closed" name="TestAlarm2Active"/>
			<function position="top" type="MpAlarmXSet"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="gAlarmXCore"/>
			<function position="middle" type="MpAlarmXSet"><input name="MpLink"/><output name="7"/></function>
			<analog type="output" name="AlarmStatus"/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="ALARM_TEST_ALARM2"/>
			<function position="bottom" type="MpAlarmXSet"><input name="Name"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="closed" name="TestAlarm2"/>
			<contact type="open" name="TestAlarm2Active"/>
			<function position="top" type="MpAlarmXReset"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="gAlarmXCore"/>
			<function position="middle" type="MpAlarmXReset"><input name="MpLink"/><output name="4"/></function>
			<analog type="output" name="AlarmStatus"/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="ALARM_TEST_ALARM2"/>
			<function position="bottom" type="MpAlarmXReset"><input name="Name"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="Set/clear axis not homed alarm" row="4" column="0" commented="1">
		<row>
			<analog type="input" name="gFoldPushCtrlInterface.Parameters.FolderTypeSelection"/>
			<function position="top" type="EQ"><input name="IN1" extensible="true"/><output name="56"/></function>
			<function position="top" type="AND"><input name="" extensible="true"/><output name="56"/></function>
			<line/>
			<function position="top" type="MpAlarmXSet"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="FOLDER_LINMOT"/>
			<function position="bottom" type="EQ"><input name="" extensible="true"/></function>
			<function position="middle" type="AND"/>
			<analog type="input" name="gAlarmXCore"/>
			<function position="middle" type="MpAlarmXSet"><input name="MpLink"/><output name="56"/></function>
			<analog type="output" name="AlarmStatus"/>
		</row>
		<row>
			<contact type="closed" name="gFoldPushCtrlInterface.Parameters.LinMotTopFolder.Status.IsHomed"/>
			<line/>
			<line/>
			<function position="bottom" type="AND"><input name="" extensible="true"/></function>
			<analog type="input" name="ALARM_NOT_HOMED"/>
			<function position="bottom" type="MpAlarmXSet"><input name="Name"/></function>
			<empty/>
		</row>
		<row>
			<contact type="closed" name="gFoldPushCtrlInterface.Parameters.LinMotBotFolder.Status.IsHomed" or="true"/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="1">
		<row>
			<analog type="input" name="gFoldPushCtrlInterface.Parameters.FolderTypeSelection"/>
			<function position="top" type="EQ"><input name="IN1" extensible="true"/><output name="56"/></function>
			<function position="top" type="AND"><input name="" extensible="true"/><output name="56"/></function>
			<line/>
			<function position="top" type="MpAlarmXReset"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="FOLDER_LINMOT"/>
			<function position="bottom" type="EQ"><input name="" extensible="true"/></function>
			<function position="middle" type="AND"/>
			<analog type="input" name="gAlarmXCore"/>
			<function position="middle" type="MpAlarmXReset"><input name="MpLink"/><output name="56"/></function>
			<analog type="output" name="AlarmStatus"/>
		</row>
		<row>
			<contact type="open" name="gFoldPushCtrlInterface.Parameters.LinMotTopFolder.Status.IsHomed"/>
			<line/>
			<line/>
			<function position="bottom" type="AND"><input name="" extensible="true"/></function>
			<analog type="input" name="ALARM_NOT_HOMED"/>
			<function position="bottom" type="MpAlarmXReset"><input name="Name"/></function>
			<empty/>
		</row>
		<row>
			<contact type="open" name="gFoldPushCtrlInterface.Parameters.LinMotBotFolder.Status.IsHomed" or="true"/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
</networks>
END_PROGRAM























