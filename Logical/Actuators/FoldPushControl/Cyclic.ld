PROGRAM _CYCLIC
<?xml version="1.0"?>
<?AutomationStudio Version=3.0.71?>
<!-- Automation Studio Generated XML Section -->
<networks maxcolumn="0">
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<analog type="input" name="gServoRamInterface.Status.ActualPosition"/>
			<function position="topbottom" type="LREAL_TO_REAL"><input name="IN"/><output name="8"/></function>
			<function position="top" type="FoldPushControl"><input name="EncoderPosition"/><output name="1"/></function>
			<analog type="output" name="gIO.DOs.TopFolder"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<analog type="input" name="gFoldPushCtrlInterface.Parameters.TopFolderOnPos"/>
			<function position="middle" type="FoldPushControl"><input name="OnPos"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<analog type="input" name="gFoldPushCtrlInterface.Parameters.TopFolderOffPos"/>
			<function position="bottom" type="FoldPushControl"><input name="OffPos"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<analog type="input" name="gServoRamInterface.Status.ActualPosition"/>
			<function position="topbottom" type="LREAL_TO_REAL"><input name="IN"/><output name="8"/></function>
			<function position="top" type="FoldPushControl"><input name="EncoderPosition"/><output name="1"/></function>
			<analog type="output" name="gIO.DOs.BottomFolder"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<analog type="input" name="gFoldPushCtrlInterface.Parameters.BottomFolderOnPos"/>
			<function position="middle" type="FoldPushControl"><input name="OnPos"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<analog type="input" name="gFoldPushCtrlInterface.Parameters.BottomFolderOffPos"/>
			<function position="bottom" type="FoldPushControl"><input name="OffPos"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<analog type="input" name="gServoRamInterface.Status.ActualPosition"/>
			<function position="topbottom" type="LREAL_TO_REAL"><input name="IN"/><output name="8"/></function>
			<function position="top" type="FoldPushControl"><input name="EncoderPosition"/><output name="1"/></function>
			<analog type="output" name="gIO.DOs.HighCompression"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<analog type="input" name="gFoldPushCtrlInterface.Parameters.HighCompressionOnPos"/>
			<function position="middle" type="FoldPushControl"><input name="OnPos"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<analog type="input" name="gFoldPushCtrlInterface.Parameters.HighCompressionOffPos"/>
			<function position="bottom" type="FoldPushControl"><input name="OffPos"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<analog type="input" name="gServoRamInterface.Status.ActualPosition"/>
			<function position="topbottom" type="LREAL_TO_REAL"><input name="IN"/><output name="8"/></function>
			<function position="top" type="FoldPushControl"><input name="EncoderPosition"/><output name="1"/></function>
			<analog type="output" name="gIO.DOs.LowCompression"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<analog type="input" name="gFoldPushCtrlInterface.Parameters.LowCompressionOnPos"/>
			<function position="middle" type="FoldPushControl"><input name="OnPos"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<analog type="input" name="gFoldPushCtrlInterface.Parameters.LowCompressionOffPos"/>
			<function position="bottom" type="FoldPushControl"><input name="OffPos"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<analog type="input" name="gServoRamInterface.Status.ActualPosition"/>
			<function position="topbottom" type="LREAL_TO_REAL"><input name="IN"/><output name="8"/></function>
			<function position="top" type="FoldPushControl"><input name="EncoderPosition"/><output name="1"/></function>
			<analog type="output" name="gIO.DOs.CompressionAirOn"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<analog type="input" name="gFoldPushCtrlInterface.Parameters.HighCompressionOnPos"/>
			<function position="middle" type="FoldPushControl"><input name="OnPos"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<analog type="input" name="gFoldPushCtrlInterface.Parameters.LowCompressionOffPos"/>
			<function position="bottom" type="FoldPushControl"><input name="OffPos"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<analog type="input" name="gServoRamInterface.Status.ActualPosition"/>
			<function position="topbottom" type="LREAL_TO_REAL"><input name="IN"/><output name="8"/></function>
			<function position="top" type="FoldPushControl"><input name="EncoderPosition"/><output name="1"/></function>
			<analog type="output" name="gPusherOn"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<analog type="input" name="gFoldPushCtrlInterface.Parameters.PushOn"/>
			<function position="middle" type="FoldPushControl"><input name="OnPos"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<analog type="input" name="gFoldPushCtrlInterface.Parameters.PushOff"/>
			<function position="bottom" type="FoldPushControl"><input name="OffPos"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="gIO.DOs.PushOn"/>
			<contact type="open" name="gModeControlInterface.Commands.SetAutoMode"/>
			<contact type="closed" name="gModeControlInterface.Status.MachineIsBliss"/>
			<coil type="open" name="Valve4OnNotBliss"/>
		</row>
		<row>
			<empty or="true"/>
			<contact type="open" name="gModeControlInterface.Commands.SetJogMode" or="true"/>
			<contact type="open" name="gModeControlInterface.Status.MachineIsBliss"/>
			<coil type="open" name="Valve4OnBliss"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="1">
		<row>
			<contact type="open" name="gIO.DOs.LowCompression"/>
			<contact type="open" name="gModeControlInterface.Status.MachineIsBliss"/>
			<contact type="open" name="gModeControlInterface.Commands.SetAutoMode"/>
			<coil type="open" name="Valve4OnBliss"/>
		</row>
		<row>
			<empty/>
			<empty or="true"/>
			<contact type="open" name="gModeControlInterface.Commands.SetJogMode" or="true"/>
			<empty/>
		</row>
	</network>
	<network label="" comment="Check if photoye was seen in this cycle and allow compression if so" row="3" column="0" commented="0">
		<row>
			<empty/>
			<function position="top" type="Compare!"><input name=""/><output name="56"/></function>
			<line/>
			<function position="top" type="Compare!"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<function position="bottom" type="Compare!"><input name="&lt;!gAdhesiveCtrlInterface.Status.GlueCyclePos &gt; 0"/></function>
			<empty/>
			<function position="middle" type="Compare!"><input name=""/><output name="56"/></function>
			<analog type="output" name="gFoldPushCtrlInterface.Status.CompressionAllowed"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<function position="bottom" type="Compare!"><input name="&lt;!gAdhesiveCtrlInterface.Status.GlueCyclePos &lt; 360"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="gIO.DOs.LowCompression"/>
			<contact type="open" name="gModeControlInterface.Status.MachineIsBliss"/>
			<contact type="open" name="gModeControlInterface.Commands.SetAutoMode"/>
			<coil type="open" name="Valve2OnBliss"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="gIO.DOs.HighCompression"/>
			<contact type="open" name="gModeControlInterface.Status.MachineIsBliss"/>
			<contact type="open" name="gModeControlInterface.Commands.SetAutoMode"/>
			<coil type="open" name="Valve0OnBliss"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="gIO.DOs.CompressionAirOn"/>
			<contact type="open" name="gModeControlInterface.Status.MachineIsBliss"/>
			<contact type="open" name="gModeControlInterface.Commands.SetAutoMode"/>
			<coil type="open" name="Valve6OnBliss"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="gIO.DIs.Pneumatics580StatusWord3.0"/>
			<line/>
			<line/>
			<coil type="open" name="gFoldPushCtrlInterface.Status.TopFoldValveStatus"/>
		</row>
		<row>
			<contact type="open" name="gFoldPushCtrlInterface.Status.HardwireConfig"/>
			<contact type="closed" name="gIO.DIs.PnuematicsHWStatusV0" or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="gIO.DIs.Pneumatics580StatusWord3.2"/>
			<line/>
			<line/>
			<coil type="open" name="gFoldPushCtrlInterface.Status.BottomFoldValveStatus"/>
		</row>
		<row>
			<contact type="open" name="gFoldPushCtrlInterface.Status.HardwireConfig"/>
			<contact type="closed" name="gIO.DIs.PnuematicsHWStatusV2" or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="gIO.DIs.Pneumatics580StatusWord3.4"/>
			<line/>
			<line/>
			<coil type="open" name="gFoldPushCtrlInterface.Status.PushValveStatus"/>
		</row>
		<row>
			<contact type="open" name="gFoldPushCtrlInterface.Status.HardwireConfig"/>
			<contact type="closed" name="gIO.DIs.PnuematicsHWStatusV4" or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="gFoldPushCtrlInterface.Status.HardwireConfig"/>
			<contact type="closed" name="gIO.DIs.PnuematicsHWStatusV6"/>
			<line/>
			<coil type="open" name="gFoldPushCtrlInterface.Status.CompOnValveStatus"/>
		</row>
	</network>
	<network label="" comment="Check if in pneumatic or linear motor configuration for folders" row="2" column="0" commented="0">
		<row>
			<analog type="input" name="gFoldPushCtrlInterface.Parameters.FolderTypeSelection"/>
			<function position="top" type="EQ"><input name="IN1" extensible="true"/><output name="1"/></function>
			<coil type="open" name="gFoldPushCtrlInterface.Status.LinMotConfig"/>
		</row>
		<row>
			<analog type="input" name="FOLDER_LINMOT"/>
			<function position="bottom" type="EQ"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<analog type="input" name="gFoldPushCtrlInterface.Parameters.FolderTypeSelection"/>
			<function position="top" type="EQ"><input name="IN1" extensible="true"/><output name="1"/></function>
			<coil type="open" name="gFoldPushCtrlInterface.Status.PneumaticConfig"/>
		</row>
		<row>
			<analog type="input" name="FOLDER_PNEUMATIC"/>
			<function position="bottom" type="EQ"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="Check if hardwired or powerlink connection to Numatics module" row="2" column="0" commented="0">
		<row>
			<analog type="input" name="gFoldPushCtrlInterface.Parameters.NumaticsTypeSelection"/>
			<function position="top" type="EQ"><input name="IN1" extensible="true"/><output name="1"/></function>
			<coil type="open" name="gFoldPushCtrlInterface.Status.HardwireConfig"/>
		</row>
		<row>
			<analog type="input" name="NUMATICS_HARDWIRE"/>
			<function position="bottom" type="EQ"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<analog type="input" name="gFoldPushCtrlInterface.Parameters.NumaticsTypeSelection"/>
			<function position="top" type="EQ"><input name="IN1" extensible="true"/><output name="1"/></function>
			<coil type="open" name="gFoldPushCtrlInterface.Status.PowelinkConfig"/>
		</row>
		<row>
			<analog type="input" name="NUMATICS_POWERLINK"/>
			<function position="bottom" type="EQ"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="PNEUMATIC
Code to run if machine is using pneumatic configuration" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="gFoldPushCtrlInterface.Status.PneumaticConfig"/>
			<contact type="open" name="gIO.DOs.TopFolder"/>
			<contact type="closed" name="gModeControlInterface.Status.MachineIsBliss"/>
			<contact type="open" name="gModeControlInterface.Commands.SetAutoMode"/>
			<coil type="open" name="Valve0OnNotBliss"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty or="true"/>
			<contact type="open" name="gModeControlInterface.Commands.SetJogMode" or="true"/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="gFoldPushCtrlInterface.Status.PneumaticConfig"/>
			<contact type="open" name="gIO.DOs.BottomFolder"/>
			<contact type="closed" name="gModeControlInterface.Status.MachineIsBliss"/>
			<contact type="open" name="gModeControlInterface.Commands.SetAutoMode"/>
			<coil type="open" name="Valve2OnNotBliss"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty or="true"/>
			<contact type="open" name="gModeControlInterface.Commands.SetJogMode" or="true"/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="Valve0OnBliss"/>
			<line/>
			<line/>
			<coil type="open" name="gIO.DOs.Pneumatics580ControlWord1.0"/>
		</row>
		<row>
			<contact type="open" name="Valve0OnNotBliss" or="true"/>
			<contact type="open" name="gFoldPushCtrlInterface.Status.HardwireConfig"/>
			<line/>
			<coil type="open" name="gIO.DOs.PnuematicsValve0"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="Valve2OnBliss"/>
			<line/>
			<line/>
			<coil type="open" name="gIO.DOs.Pneumatics580ControlWord1.2"/>
		</row>
		<row>
			<contact type="open" name="Valve2OnNotBliss" or="true"/>
			<contact type="open" name="gFoldPushCtrlInterface.Status.HardwireConfig"/>
			<line/>
			<coil type="open" name="gIO.DOs.PnuematicsValve2"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="Valve4OnNotBliss"/>
			<line/>
			<line/>
			<coil type="open" name="gIO.DOs.Pneumatics580ControlWord1.4"/>
		</row>
		<row>
			<contact type="open" name="Valve4OnBliss" or="true"/>
			<contact type="open" name="gFoldPushCtrlInterface.Status.HardwireConfig"/>
			<line/>
			<coil type="open" name="gIO.DOs.PnuematicsValve4"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="Valve6OnBliss"/>
			<line/>
			<line/>
			<coil type="open" name="gIO.DOs.Pneumatics580ControlWord1.6"/>
		</row>
		<row>
			<contact type="open" name="Valve6OnNotBliss" or="true"/>
			<contact type="open" name="gFoldPushCtrlInterface.Status.HardwireConfig"/>
			<line/>
			<coil type="open" name="gIO.DOs.PnuematicsValve6"/>
		</row>
	</network>
	<network label="" comment="LINMOT
Code to use if using linear motor configuration
Top folder" row="4" column="0" commented="0">
		<row>
			<contact type="open" name="gFoldPushCtrlInterface.Status.LinMotConfig"/>
			<contact type="positive transition" name="gIO.DOs.TopFolder"/>
			<contact type="open" name="gModeControlInterface.Commands.SetAutoMode"/>
			<line/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty or="true"/>
			<contact type="open" name="gModeControlInterface.Commands.SetJogMode" or="true"/>
			<analog type="input" name="gFoldPushCtrlInterface.Parameters.LinMotTopFolder.Parameter.ExtendPos"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gFoldPushCtrlInterface.Parameters.LinMotTopFolder.Parameter.MpBasicParameters.Position"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty or="true"/>
			<line/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty/>
			<analog type="input" name="TRUE"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gFoldPushCtrlInterface.Parameters.LinMotTopFolder.Command.MoveAbsoluteRequest"/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<contact type="open" name="gFoldPushCtrlInterface.Status.LinMotConfig"/>
			<contact type="open" name="gModeControlInterface.Commands.SetAutoMode"/>
			<contact type="negative transition" name="gIO.DOs.TopFolder"/>
			<line/>
			<line/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<contact type="open" name="gModeControlInterface.Commands.SetJogMode" or="true"/>
			<contact type="closed" name="gIO.DOs.TopFolder"/>
			<contact type="positive transition" name="gRamCtrlInterface.Status.Running" or="true"/>
			<analog type="input" name="gFoldPushCtrlInterface.Parameters.LinMotTopFolder.Parameter.RetractPos"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gFoldPushCtrlInterface.Parameters.LinMotTopFolder.Parameter.MpBasicParameters.Position"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty/>
			<empty or="true"/>
			<line/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<analog type="input" name="TRUE"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gFoldPushCtrlInterface.Parameters.LinMotTopFolder.Command.MoveAbsoluteRequest"/>
		</row>
	</network>
	<network label="" comment="Bottom folder" row="4" column="0" commented="0">
		<row>
			<contact type="open" name="gFoldPushCtrlInterface.Status.LinMotConfig"/>
			<contact type="positive transition" name="gIO.DOs.BottomFolder"/>
			<contact type="open" name="gModeControlInterface.Commands.SetAutoMode"/>
			<line/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty or="true"/>
			<contact type="open" name="gModeControlInterface.Commands.SetJogMode" or="true"/>
			<analog type="input" name="gFoldPushCtrlInterface.Parameters.LinMotBotFolder.Parameter.ExtendPos"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gFoldPushCtrlInterface.Parameters.LinMotBotFolder.Parameter.MpBasicParameters.Position"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty or="true"/>
			<line/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty/>
			<analog type="input" name="TRUE"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gFoldPushCtrlInterface.Parameters.LinMotBotFolder.Command.MoveAbsoluteRequest"/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<contact type="open" name="gFoldPushCtrlInterface.Status.LinMotConfig"/>
			<contact type="open" name="gModeControlInterface.Commands.SetAutoMode"/>
			<contact type="negative transition" name="gIO.DOs.BottomFolder"/>
			<line/>
			<line/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<contact type="open" name="gModeControlInterface.Commands.SetJogMode" or="true"/>
			<contact type="closed" name="gIO.DOs.BottomFolder"/>
			<contact type="positive transition" name="gRamCtrlInterface.Status.Running" or="true"/>
			<analog type="input" name="gFoldPushCtrlInterface.Parameters.LinMotBotFolder.Parameter.RetractPos"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gFoldPushCtrlInterface.Parameters.LinMotBotFolder.Parameter.MpBasicParameters.Position"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty/>
			<empty or="true"/>
			<line/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<analog type="input" name="TRUE"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gFoldPushCtrlInterface.Parameters.LinMotBotFolder.Command.MoveAbsoluteRequest"/>
		</row>
	</network>
</networks>
END_PROGRAM





























