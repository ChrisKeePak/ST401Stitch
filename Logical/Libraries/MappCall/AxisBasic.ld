(* Implements config and basic for a mapp axis *)
FUNCTION_BLOCK AxisBasic
<?xml version="1.0"?>
<?AutomationStudio Version=3.0.71?>
<!-- Automation Studio Generated XML Section -->
<networks xmlns:dt="urn:schemas-microsoft-com:datatypes" maxcolumn="0">
	<network label="" comment="&lt;axis&gt; Configuration Function" row="7" column="0" commented="0">
		<row>
			<empty/>
			<empty/>
			<functionblock position="header" name="AxisConfig" type="MpAxisBasicConfig"/>
			<empty/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="pMpLink"/>
			<functionblock position="top" type="MpAxisBasicConfig"><input name="MpLink" vardynamic="true"/><output name="Active"/></functionblock>
			<empty/>
		</row>
		<row>
			<line/>
			<line/>
			<functionblock position="middle" type="MpAxisBasicConfig"><input name="Enable"/><output name="Error"/></functionblock>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<functionblock position="middle" type="MpAxisBasicConfig"><input name="ErrorReset"/><output name="StatusID"/></functionblock>
			<empty/>
		</row>
		<row>
			<empty/>
			<contact type="address" name="AxisInterface.Parameters.AxisAndDrivePars"/>
			<functionblock position="middle" type="MpAxisBasicConfig"><input name="Configuration" vardynamic="true"/><output name="CommandBusy"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="open" name="AxisInterface.Commands.ToMapp.LoadConfig"/>
			<line/>
			<functionblock position="middle" type="MpAxisBasicConfig"><input name="Load"/><output name="CommandDone"/></functionblock>
			<analog type="output" name="AxisInterface.Status.ConfigCommandDone"/>
		</row>
		<row>
			<contact type="open" name="AxisInterface.Commands.ToMapp.SaveConfig"/>
			<line/>
			<functionblock position="bottom" type="MpAxisBasicConfig"><input name="Save"/><output name="Info"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="1">
		<row>
			<analog type="input" name="pEndlessPosition"/>
			<function position="topbottom" type="MOVE"><input name="" extensible="true"/><output name="56"/></function>
			<analog type="output" name="AxisInterface.Parameters.MovementParameters.Home.EndlessPositionDataRef"/>
		</row>
	</network>
	<network label="" comment="&lt;axis&gt; Motion Control Function" row="20" column="0" commented="0">
		<row>
			<empty/>
			<empty/>
			<empty/>
			<functionblock position="header" name="AxisBasic" type="MpAxisBasic"/>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<analog type="input" name="pMpLink"/>
			<functionblock position="top" type="MpAxisBasic"><input name="MpLink" vardynamic="true"/><output name="Active"/></functionblock>
			<analog type="output" name="AxisInterface.Status.AxisBasicActive"/>
		</row>
		<row>
			<line/>
			<line/>
			<line/>
			<functionblock position="middle" type="MpAxisBasic"><input name="Enable"/><output name="Error"/></functionblock>
			<analog type="output" name="AxisInterface.Status.Error"/>
		</row>
		<row>
			<contact type="open" name="ErrorReset"/>
			<line/>
			<line/>
			<functionblock position="middle" type="MpAxisBasic"><input name="ErrorReset"/><output name="StatusID"/></functionblock>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<contact type="address" name="AxisInterface.Parameters.MovementParameters"/>
			<functionblock position="middle" type="MpAxisBasic"><input name="Parameters" vardynamic="true"/><output name="UpdateDone"/></functionblock>
			<coil type="reset" name="AxisInterface.Commands.ToMapp.Update"/>
		</row>
		<row>
			<contact type="open" name="AxisInterface.Commands.ToMapp.Update"/>
			<contact type="open" name="AxisInterface.Status.AxisBasicActive"/>
			<contact type="closed" name="AxisBasic.UpdateDone"/>
			<functionblock position="middle" type="MpAxisBasic"><input name="Update"/><output name="Position"/></functionblock>
			<analog type="output" name="AxisInterface.Status.ActualPosition"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<analog type="input" name="pAxis"/>
			<functionblock position="middle" type="MpAxisBasic"><input name="Axis"/><output name="Velocity"/></functionblock>
			<analog type="output" name="AxisInterface.Status.ActualSpeed"/>
		</row>
		<row>
			<contact type="open" name="AxisInterface.Commands.ToMapp.Power"/>
			<line/>
			<line/>
			<functionblock position="middle" type="MpAxisBasic"><input name="Power"/><output name="CommandBusy"/></functionblock>
			<coil type="open" name="AxisInterface.Status.MappCommandBusy"/>
		</row>
		<row>
			<contact type="open" name="AxisInterface.Commands.ToMapp.Home"/>
			<line/>
			<line/>
			<functionblock position="middle" type="MpAxisBasic"><input name="Home"/><output name="CommandAborted"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="open" name="AxisInterface.Commands.ToMapp.MoveVelocity"/>
			<line/>
			<line/>
			<functionblock position="middle" type="MpAxisBasic"><input name="MoveVelocity"/><output name="PowerOn"/></functionblock>
			<coil type="open" name="AxisInterface.Status.PoweredOn"/>
		</row>
		<row>
			<contact type="open" name="AxisInterface.Commands.ToMapp.MoveAbs"/>
			<line/>
			<line/>
			<functionblock position="middle" type="MpAxisBasic"><input name="MoveAbsolute"/><output name="IsHomed"/></functionblock>
			<coil type="open" name="AxisInterface.Status.Homed"/>
		</row>
		<row>
			<contact type="open" name="AxisInterface.Commands.ToMapp.MoveAdditive"/>
			<line/>
			<line/>
			<functionblock position="middle" type="MpAxisBasic"><input name="MoveAdditive"/><output name="InVelocity"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="open" name="AxisInterface.Commands.ToMapp.Stop"/>
			<line/>
			<line/>
			<functionblock position="middle" type="MpAxisBasic"><input name="Stop"/><output name="InPosition"/></functionblock>
			<coil type="open" name="AxisInterface.Status.InPosition"/>
		</row>
		<row>
			<contact type="open" name="AxisInterface.Commands.ToMapp.JogPos"/>
			<line/>
			<line/>
			<functionblock position="middle" type="MpAxisBasic"><input name="JogPositive"/><output name="MoveActive"/></functionblock>
			<coil type="open" name="AxisInterface.Status.InMotion"/>
		</row>
		<row>
			<contact type="open" name="AxisInterface.Commands.ToMapp.JogNeg"/>
			<line/>
			<line/>
			<functionblock position="middle" type="MpAxisBasic"><input name="JogNegative"/><output name="Stopped"/></functionblock>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty/>
			<functionblock position="middle" type="MpAxisBasic"><input name="Autotune"/><output name="TuningDone"/></functionblock>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty/>
			<functionblock position="middle" type="MpAxisBasic"><input name="Simulate"/><output name="Simulation"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="open" name="AxisInterface.Commands.ToMapp.TorqueLimitingOn"/>
			<line/>
			<line/>
			<functionblock position="middle" type="MpAxisBasic"><input name="TorqueLimit"/><output name="TorqueLimited"/></functionblock>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty/>
			<functionblock position="middle" type="MpAxisBasic"><input name="ReleaseBrake"/><output name="BrakeReleased"/></functionblock>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty/>
			<functionblock position="bottom" type="MpAxisBasic"><output name="Info"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<analog type="input" name="AxisBasic.Info.AxisInitialized"/>
			<function position="top" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="AxisInterface.Status.AxisInitialized"/>
		</row>
		<row>
			<analog type="input" name="AxisBasic.Info.ReadyToPowerOn"/>
			<function position="middle" type="MOVE"><input name="" extensible="true"/><output name="56"/></function>
			<analog type="output" name="AxisInterface.Status.ReadyToPowerOn"/>
		</row>
		<row>
			<analog type="input" name="AxisBasic.Info.CyclicRead.Torque.Value"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="56"/></function>
			<analog type="output" name="AxisInterface.Status.ActualTorque"/>
		</row>
	</network>
	<network label="" comment="The move distance for absolute moves should be the difference between where you are and where you are going" row="3" column="0" commented="0">
		<row>
			<contact type="positive transition" name="AxisBasic.MoveAbsolute"/>
			<function position="top" type="Compute!"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<function position="middle" type="Compute!"><input name=""/><output name="56"/></function>
			<analog type="output" name="AbsDistance"/>
		</row>
		<row>
			<empty/>
			<function position="bottom" type="Compute!"><input name="&lt;!ABS(AxisInterface.Parameters.MovementParameters.Position - AxisBasic.Position)"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="If the Position Parameter of &lt;axis&gt; has changed, When the move starts add the Calculated distance to the &lt;axis&gt;-Axis Odometer" row="3" column="0" commented="0">
		<row>
			<contact type="positive transition" name="AxisBasic.MoveActive"/>
			<contact type="open" name="AxisBasic.MoveAbsolute"/>
			<function position="top" type="ADD"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="OdometerValue"/>
			<function position="middle" type="ADD"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="OdometerValue"/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="AbsDistance"/>
			<function position="bottom" type="ADD"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="5" column="0" commented="0">
		<row>
			<empty/>
			<functionblock position="header" name="SetOverride" type="MC_SetOverride"/>
			<empty/>
		</row>
		<row>
			<analog type="input" name="pAxis"/>
			<functionblock position="top" type="MC_SetOverride"><input name="Axis"/><output name="Enabled"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="open" name="AxisInterface.Status.PoweredOn"/>
			<functionblock position="middle" type="MC_SetOverride"><input name="Enable"/><output name="Busy"/></functionblock>
			<empty/>
		</row>
		<row>
			<analog type="input" name="Override"/>
			<functionblock position="middle" type="MC_SetOverride"><input name="VelFactor"/><output name="Error"/></functionblock>
			<empty/>
		</row>
		<row>
			<analog type="input" name="1.0"/>
			<functionblock position="bottom" type="MC_SetOverride"><input name="AccFactor"/><output name="ErrorID"/></functionblock>
			<empty/>
		</row>
	</network>
</networks>
END_FUNCTION_BLOCK












