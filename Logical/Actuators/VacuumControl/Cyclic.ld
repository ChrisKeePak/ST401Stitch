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
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<analog type="input" name="gVacCtrlInterface.Parameters.VacConfig"/>
			<function position="top" type="EQ"><input name="" extensible="true"/><output name="1"/></function>
			<line/>
			<line/>
			<line/>
			<line/>
			<line/>
			<line/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="VAC_VENTURI"/>
			<function position="bottom" type="EQ"><input name="" extensible="true"/></function>
			<analog type="input" name="UNHIDE"/>
			<function position="top" type="ADD"><input name="" extensible="true"/><output name="40"/></function>
			<line/>
			<line/>
			<line/>
			<function position="middle" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gHMI.StatusDatapoints.VenturiVacuumSDP"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty/>
			<analog type="input" name="UNLOCK"/>
			<function position="bottom" type="ADD"><input name="" extensible="true"/></function>
			<analog type="input" name="HIDE"/>
			<function position="top" type="ADD"><input name="" extensible="true"/><output name="40"/></function>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="56"/></function>
			<analog type="output" name="gHMI.StatusDatapoints.MotorVacuumSDP"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty/>
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
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<analog type="input" name="gVacCtrlInterface.Parameters.VacConfig"/>
			<function position="top" type="EQ"><input name="" extensible="true"/><output name="1"/></function>
			<line/>
			<line/>
			<line/>
			<line/>
			<line/>
			<line/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="VAC_MOTOR"/>
			<function position="bottom" type="EQ"><input name="" extensible="true"/></function>
			<analog type="input" name="HIDE"/>
			<function position="top" type="ADD"><input name="" extensible="true"/><output name="40"/></function>
			<line/>
			<line/>
			<line/>
			<function position="middle" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gHMI.StatusDatapoints.VenturiVacuumSDP"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty/>
			<analog type="input" name="LOCK"/>
			<function position="bottom" type="ADD"><input name="" extensible="true"/></function>
			<analog type="input" name="UNHIDE"/>
			<function position="top" type="ADD"><input name="" extensible="true"/><output name="40"/></function>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="56"/></function>
			<analog type="output" name="gHMI.StatusDatapoints.MotorVacuumSDP"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty/>
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
	<network label="" comment="Check for vacuum motor or venturi configuration" row="2" column="0" commented="0">
		<row>
			<analog type="input" name="gVacCtrlInterface.Parameters.VacConfig"/>
			<function position="top" type="EQ"><input name="IN1" extensible="true"/><output name="1"/></function>
			<coil type="jump" name="VacMotor"/>
		</row>
		<row>
			<analog type="input" name="VAC_MOTOR"/>
			<function position="bottom" type="EQ"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<analog type="input" name="gVacCtrlInterface.Parameters.VacConfig"/>
			<function position="top" type="EQ"><input name="IN1" extensible="true"/><output name="1"/></function>
			<coil type="jump" name="VacVenturi"/>
		</row>
		<row>
			<analog type="input" name="VAC_VENTURI"/>
			<function position="bottom" type="EQ"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="VacMotor" comment="MOTOR:
Code to be run when MOTOR configuration is selected (vacuum on constantly)" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="gVacCtrlInterface.Commands.VacuumOn"/>
			<line/>
			<line/>
			<coil type="open" name="gIO.DOs.VacuumOn"/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="closed" name="gIO.DIs.VacuumPressureOK"/>
			<function position="top" type="MpAlarmXSet"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="gAlarmXCore"/>
			<function position="middle" type="MpAlarmXSet"><input name="MpLink"/><output name="7"/></function>
			<analog type="output" name="status"/>
		</row>
		<row>
			<analog type="input" name="ALARM_VACUUM_PRESSURE_LOW"/>
			<function position="bottom" type="MpAlarmXSet"><input name="Name"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="open" name="gIO.DIs.VacuumPressureOK"/>
			<function position="top" type="MpAlarmXReset"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="gAlarmXCore"/>
			<function position="middle" type="MpAlarmXReset"><input name="MpLink"/><output name="4"/></function>
			<analog type="output" name="status"/>
		</row>
		<row>
			<analog type="input" name="ALARM_VACUUM_PRESSURE_LOW"/>
			<function position="bottom" type="MpAlarmXReset"><input name="Name"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="negative transition" name="gIO.DIs.VacuumTempOK"/>
			<function position="top" type="MpAlarmXSet"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="gAlarmXCore"/>
			<function position="middle" type="MpAlarmXSet"><input name="MpLink"/><output name="7"/></function>
			<analog type="output" name="status"/>
		</row>
		<row>
			<analog type="input" name="ALARM_VACUUM_OVER_TEMP"/>
			<function position="bottom" type="MpAlarmXSet"><input name="Name"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="positive transition" name="gIO.DIs.VacuumTempOK"/>
			<function position="top" type="MpAlarmXReset"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="gAlarmXCore"/>
			<function position="middle" type="MpAlarmXReset"><input name="MpLink"/><output name="4"/></function>
			<analog type="output" name="status"/>
		</row>
		<row>
			<analog type="input" name="ALARM_VACUUM_OVER_TEMP"/>
			<function position="bottom" type="MpAlarmXReset"><input name="Name"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="Return from VacMotor section" row="1" column="0" commented="0">
		<row>
			<line/>
			<line/>
			<line/>
			<coil type="return"/>
		</row>
	</network>
	<network label="VacVenturi" comment="VENTURI:
Code to be run when VENTURI configuration is selected (vacuum on in cam range)" row="4" column="0" commented="0">
		<row>
			<contact type="open" name="gModeControlInterface.Commands.SetAutoMode"/>
			<contact type="closed" name="gVacCtrlInterface.Status.StandstillTimoutSet"/>
			<contact type="open" name="gVacCtrlInterface.Commands.VacuumOn"/>
			<line/>
			<line/>
			<function position="top" type="VenturiControl"><input name="Enable"/><output name="1"/></function>
			<analog type="output" name="gVacCtrlInterface.Commands.VenturiOn"/>
		</row>
		<row>
			<contact type="open" name="gModeControlInterface.Commands.SetJogMode"/>
			<line or="true"/>
			<analog type="input" name="gServoFeedInterface.Status.ActualPosition"/>
			<function position="topbottom" type="LREAL_TO_REAL"><input name="IN"/><output name="8"/></function>
			<function position="middle" type="VenturiControl"><input name="EncoderPosition"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<analog type="input" name="gVacCtrlInterface.Parameters.VacOnPos"/>
			<function position="middle" type="VenturiControl"><input name="OnPos"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<analog type="input" name="gVacCtrlInterface.Parameters.VacOffPos"/>
			<function position="bottom" type="VenturiControl"><input name="OffPos"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="
********** Inputs from Application Software *******
Check vacuum on time for exceeded timeout threshold" row="4" column="0" commented="1">
		<row>
			<empty/>
			<functionblock position="header" name="TON_VenturiStandstill" type="TON"/>
			<empty/>
		</row>
		<row>
			<line/>
			<functionblock position="top" type="TON"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="open" name="gIO.DOs.VacuumOn"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="gVacCtrlInterface.Status.StandstillTimout"/>
		</row>
		<row>
			<analog type="input" name="STANDSTILL_TIMOUT_THRESH"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="Set timeout flag when a vacuum timeout occurs" row="1" column="0" commented="1">
		<row>
			<contact type="open" name="gVacCtrlInterface.Status.StandstillTimout"/>
			<line/>
			<line/>
			<coil type="set" name="gVacCtrlInterface.Status.StandstillTimoutSet"/>
		</row>
	</network>
	<network label="" comment="Reset vacuum timeout when a control command is given" row="3" column="0" commented="1">
		<row>
			<contact type="open" name="gRamCtrlInterface.Commands.JogPositive"/>
			<line/>
			<line/>
			<coil type="reset" name="gVacCtrlInterface.Status.StandstillTimoutSet"/>
		</row>
		<row>
			<contact type="open" name="gRamCtrlInterface.Commands.JogNegative" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="gRamCtrlInterface.Commands.MoveVelocity" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="Send vacuum command to IO if safety is OK" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="gVacCtrlInterface.Commands.VenturiOn"/>
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
	<network label="" comment="Turn on DO for vacuum blow off as soon as vacuum is turned off and safety is ok" row="2" column="0" commented="0">
		<row>
			<contact type="negative transition" name="gIO.DOs.VacuumOn"/>
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
	<network label="" comment="Turn off blow off after user input time delay" row="4" column="0" commented="0">
		<row>
			<contact type="negative transition" name="gVacCtrlInterface.Commands.BlowOffOnManual"/>
			<line/>
			<line/>
			<line/>
			<line/>
			<coil type="reset" name="gIO.DOs.BlowOffOn"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty/>
			<functionblock position="header" name="TON_BlowOff" type="TON" or="true"/>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<analog type="input" name="gIO.DOs.BlowOffOn"/>
			<functionblock position="top" type="TON" or="true"><input name="IN"/><output name="Q"/></functionblock>
			<empty/>
		</row>
		<row>
			<analog type="input" name="gVacCtrlInterface.Parameters.BlowOffTime"/>
			<function position="topbottom" type="UINT_TO_TIME"><input name="IN"/><output name="12"/></function>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="Check if Vacuum Low never goes false through the entire On-range of vacuum cycle" row="2" column="0" commented="0">
		<row>
			<analog type="input" name="gIO.Encoders.SickSSIPosDegrees"/>
			<function position="top" type="EQ"><input name="IN1" extensible="true"/><output name="1"/></function>
			<line/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="gVacCtrlInterface.Parameters.VacOnPos"/>
			<function position="bottom" type="EQ"><input name="" extensible="true"/></function>
			<analog type="input" name="TRUE"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gVacCtrlInterface.Status.VacLowCycle"/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<empty/>
			<function position="top" type="Compare!"><input name=""/><output name="56"/></function>
			<line/>
			<line/>
			<line/>
			<function position="top" type="AND"><input name="" extensible="true"/><output name="40"/></function>
			<line/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<function position="bottom" type="Compare!"><input name="&lt;!(gIO.Encoders.SickSSIPosDegrees &gt;= gVacCtrlInterface.Parameters.VacOnPos)"/></function>
			<empty/>
			<function position="top" type="Compare!"><input name=""/><output name="56"/></function>
			<function position="middle" type="AND"><input name="" extensible="true"/></function>
			<analog type="input" name="FALSE"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gVacCtrlInterface.Status.VacLowCycle"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<function position="bottom" type="Compare!"><input name="&lt;!(gIO.Encoders.SickSSIPosDegrees &lt;= gVacCtrlInterface.Parameters.VacOffPos)"/></function>
			<function position="middle" type="AND"/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="closed" name="gIO.DIs.VacLow"/>
			<line/>
			<line/>
			<line/>
			<line/>
			<line/>
			<function position="bottom" type="AND"><input name="" extensible="true"/></function>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="If outside vacuum on range, check vac low cycle variable - if it is true, then a fault has occurred" row="3" column="0" commented="0">
		<row>
			<empty/>
			<function position="top" type="Compare!"><input name=""/><output name="56"/></function>
			<line/>
			<line/>
			<line/>
			<line/>
			<function position="top" type="AND"><input name="" extensible="true"/><output name="40"/></function>
			<line/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<function position="bottom" type="Compare!"><input name="&lt;!(gIO.Encoders.SickSSIPosDegrees &lt; gVacCtrlInterface.Parameters.VacOnPos)"/></function>
			<empty/>
			<function position="top" type="Compare!" or="true"><input name=""/><output name="56"/></function>
			<analog type="input" name="gVacCtrlInterface.Status.VacLowCycle"/>
			<function position="bottom" type="AND"><input name="" extensible="true"/></function>
			<analog type="input" name="TRUE"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gVacCtrlInterface.Status.VacLowAlarm"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<function position="bottom" type="Compare!"><input name="&lt;!(gIO.Encoders.SickSSIPosDegrees &gt; gVacCtrlInterface.Parameters.VacOffPos)"/></function>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="Set vacuum low alarm on position edge of vacuum low bit" row="3" column="0" commented="0">
		<row>
			<contact type="positive transition" name="gVacCtrlInterface.Status.VacLowAlarm"/>
			<function position="top" type="MpAlarmXSet"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="gAlarmXCore"/>
			<function position="middle" type="MpAlarmXSet"><input name="MpLink"/><output name="7"/></function>
			<analog type="output" name="status"/>
		</row>
		<row>
			<analog type="input" name="ALARM_VENTURI_LOW"/>
			<function position="bottom" type="MpAlarmXSet"><input name="Name"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="Set vacuum low alarm on position edge of vacuum low bit" row="3" column="0" commented="0">
		<row>
			<contact type="closed" name="gVacCtrlInterface.Status.VacLowAlarm"/>
			<function position="top" type="MpAlarmXReset"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="gAlarmXCore"/>
			<function position="middle" type="MpAlarmXReset"><input name="MpLink"/><output name="4" ENO="true"/></function>
			<analog type="output" name="status"/>
		</row>
		<row>
			<analog type="input" name="ALARM_VENTURI_LOW"/>
			<function position="bottom" type="MpAlarmXReset"><input name="Name"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="Reset vacuum low alarm once next vacuum cycle begins" row="3" column="0" commented="0">
		<row>
			<analog type="input" name="gIO.Encoders.SickSSIPosDegrees"/>
			<function position="top" type="EQ"><input name="IN1" extensible="true"/><output name="1"/></function>
			<line/>
			<function position="top" type="MpAlarmXReset"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<line/>
			<line/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="gVacCtrlInterface.Parameters.VacOnPos"/>
			<function position="bottom" type="EQ"><input name="" extensible="true"/></function>
			<analog type="input" name="gAlarmXCore"/>
			<function position="middle" type="MpAlarmXReset"><input name="MpLink"/><output name="4" ENO="true"/></function>
			<analog type="output" name="status"/>
			<analog type="input" name="FALSE"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gVacCtrlInterface.Status.VacLowAlarm"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty/>
			<analog type="input" name="ALARM_VENTURI_LOW"/>
			<function position="bottom" type="MpAlarmXReset"><input name="Name"/></function>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="Return from VacVenturi section" row="1" column="0" commented="0">
		<row>
			<line/>
			<line/>
			<line/>
			<coil type="return"/>
		</row>
	</network>
</networks>
END_PROGRAM












