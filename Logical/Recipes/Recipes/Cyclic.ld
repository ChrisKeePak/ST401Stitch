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
	<network label="" comment="" row="6" column="0" commented="0">
		<row>
			<empty/>
			<empty/>
			<functionblock position="header" name="MpRecipeRegPar_0" type="MpRecipeRegPar"/>
			<empty/>
		</row>
		<row>
			<empty/>
			<contact type="address" name="gRecipeXml"/>
			<functionblock position="top" type="MpRecipeRegPar"><input name="MpLink" vardynamic="true"/><output name="Active"/></functionblock>
			<coil type="open" name="RegParActive0"/>
		</row>
		<row>
			<line/>
			<line/>
			<functionblock position="middle" type="MpRecipeRegPar"><input name="Enable"/><output name="Error"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="open" name="gSoftwareReset"/>
			<line/>
			<functionblock position="middle" type="MpRecipeRegPar"><input name="ErrorReset"/><output name="StatusID"/></functionblock>
			<empty/>
		</row>
		<row>
			<empty/>
			<contact type="address" name="'gModeControlInterface.Parameters'"/>
			<functionblock position="middle" type="MpRecipeRegPar"><input name="PVName" vardynamic="true"/><output name="UpdateNotification"/></functionblock>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<functionblock position="bottom" type="MpRecipeRegPar"><input name="Category" vardynamic="true"/><output name="Info"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="6" column="0" commented="0">
		<row>
			<empty/>
			<empty/>
			<functionblock position="header" name="MpRecipeRegPar_1" type="MpRecipeRegPar"/>
			<empty/>
		</row>
		<row>
			<empty/>
			<contact type="address" name="gRecipeXml"/>
			<functionblock position="top" type="MpRecipeRegPar"><input name="MpLink" vardynamic="true"/><output name="Active"/></functionblock>
			<coil type="open" name="RegParActive1"/>
		</row>
		<row>
			<line/>
			<line/>
			<functionblock position="middle" type="MpRecipeRegPar"><input name="Enable"/><output name="Error"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="open" name="gSoftwareReset"/>
			<line/>
			<functionblock position="middle" type="MpRecipeRegPar"><input name="ErrorReset"/><output name="StatusID"/></functionblock>
			<empty/>
		</row>
		<row>
			<empty/>
			<contact type="address" name="'gAdhesiveCtrlInterface.Parameters'"/>
			<functionblock position="middle" type="MpRecipeRegPar"><input name="PVName" vardynamic="true"/><output name="UpdateNotification"/></functionblock>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<functionblock position="bottom" type="MpRecipeRegPar"><input name="Category" vardynamic="true"/><output name="Info"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="6" column="0" commented="0">
		<row>
			<empty/>
			<empty/>
			<functionblock position="header" name="MpRecipeRegPar_2" type="MpRecipeRegPar"/>
			<empty/>
		</row>
		<row>
			<empty/>
			<contact type="address" name="gRecipeXml"/>
			<functionblock position="top" type="MpRecipeRegPar"><input name="MpLink" vardynamic="true"/><output name="Active"/></functionblock>
			<coil type="open" name="RegParActive2"/>
		</row>
		<row>
			<line/>
			<line/>
			<functionblock position="middle" type="MpRecipeRegPar"><input name="Enable"/><output name="Error"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="open" name="gSoftwareReset"/>
			<line/>
			<functionblock position="middle" type="MpRecipeRegPar"><input name="ErrorReset"/><output name="StatusID"/></functionblock>
			<empty/>
		</row>
		<row>
			<empty/>
			<contact type="address" name="'gFoldPushCtrlInterface.Parameters'"/>
			<functionblock position="middle" type="MpRecipeRegPar"><input name="PVName" vardynamic="true"/><output name="UpdateNotification"/></functionblock>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<functionblock position="bottom" type="MpRecipeRegPar"><input name="Category" vardynamic="true"/><output name="Info"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="6" column="0" commented="0">
		<row>
			<empty/>
			<empty/>
			<functionblock position="header" name="MpRecipeRegPar_3" type="MpRecipeRegPar"/>
			<empty/>
		</row>
		<row>
			<empty/>
			<contact type="address" name="gRecipeXml"/>
			<functionblock position="top" type="MpRecipeRegPar"><input name="MpLink" vardynamic="true"/><output name="Active"/></functionblock>
			<coil type="open" name="RegParActive3"/>
		</row>
		<row>
			<line/>
			<line/>
			<functionblock position="middle" type="MpRecipeRegPar"><input name="Enable"/><output name="Error"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="open" name="gSoftwareReset"/>
			<line/>
			<functionblock position="middle" type="MpRecipeRegPar"><input name="ErrorReset"/><output name="StatusID"/></functionblock>
			<empty/>
		</row>
		<row>
			<empty/>
			<contact type="address" name="'gPassword'"/>
			<functionblock position="middle" type="MpRecipeRegPar"><input name="PVName" vardynamic="true"/><output name="UpdateNotification"/></functionblock>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<functionblock position="bottom" type="MpRecipeRegPar"><input name="Category" vardynamic="true"/><output name="Info"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="6" column="0" commented="0">
		<row>
			<empty/>
			<empty/>
			<functionblock position="header" name="MpRecipeRegPar_4" type="MpRecipeRegPar"/>
			<empty/>
		</row>
		<row>
			<empty/>
			<contact type="address" name="gRecipeXml"/>
			<functionblock position="top" type="MpRecipeRegPar"><input name="MpLink" vardynamic="true"/><output name="Active"/></functionblock>
			<coil type="open" name="RegParActive4"/>
		</row>
		<row>
			<line/>
			<line/>
			<functionblock position="middle" type="MpRecipeRegPar"><input name="Enable"/><output name="Error"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="open" name="gSoftwareReset"/>
			<line/>
			<functionblock position="middle" type="MpRecipeRegPar"><input name="ErrorReset"/><output name="StatusID"/></functionblock>
			<empty/>
		</row>
		<row>
			<empty/>
			<contact type="address" name="'gHMI.Parameters'"/>
			<functionblock position="middle" type="MpRecipeRegPar"><input name="PVName" vardynamic="true"/><output name="UpdateNotification"/></functionblock>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<functionblock position="bottom" type="MpRecipeRegPar"><input name="Category" vardynamic="true"/><output name="Info"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="6" column="0" commented="0">
		<row>
			<empty/>
			<empty/>
			<functionblock position="header" name="MpRecipeRegPar_5" type="MpRecipeRegPar"/>
			<empty/>
		</row>
		<row>
			<empty/>
			<contact type="address" name="gRecipeXml"/>
			<functionblock position="top" type="MpRecipeRegPar"><input name="MpLink" vardynamic="true"/><output name="Active"/></functionblock>
			<coil type="open" name="RegParActive5"/>
		</row>
		<row>
			<line/>
			<line/>
			<functionblock position="middle" type="MpRecipeRegPar"><input name="Enable"/><output name="Error"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="open" name="gSoftwareReset"/>
			<line/>
			<functionblock position="middle" type="MpRecipeRegPar"><input name="ErrorReset"/><output name="StatusID"/></functionblock>
			<empty/>
		</row>
		<row>
			<empty/>
			<contact type="address" name="'gVacCtrlInterface.Parameters'"/>
			<functionblock position="middle" type="MpRecipeRegPar"><input name="PVName" vardynamic="true"/><output name="UpdateNotification"/></functionblock>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<functionblock position="bottom" type="MpRecipeRegPar"><input name="Category" vardynamic="true"/><output name="Info"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="RegParActive0"/>
			<contact type="open" name="RegParActive1"/>
			<contact type="open" name="RegParActive2"/>
			<contact type="open" name="RegParActive3"/>
			<contact type="open" name="RegParActive4"/>
			<contact type="open" name="RegParActive5"/>
			<coil type="open" name="AllParsRegistered"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="positive transition" name="AllParsRegistered"/>
			<line/>
			<line/>
			<coil type="set" name="gRecipeInterface.Commands.LoadRecipe"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="gSoftwareReset"/>
			<contact type="open" name="MpRecipeXml_0.Error"/>
			<line/>
			<coil type="reset" name="gRecipeInterface.Commands.LoadRecipe"/>
		</row>
		<row>
			<empty/>
			<empty or="true"/>
			<line/>
			<coil type="reset" name="gRecipeInterface.Commands.SaveRecipe"/>
		</row>
	</network>
	<network label="" comment="" row="12" column="0" commented="0">
		<row>
			<empty/>
			<empty/>
			<functionblock position="header" name="MpRecipeXml_0" type="MpRecipeXml"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<empty/>
			<contact type="address" name="gRecipeXml"/>
			<functionblock position="top" type="MpRecipeXml"><input name="MpLink" vardynamic="true"/><output name="Active"/></functionblock>
			<empty/>
			<empty/>
		</row>
		<row>
			<line/>
			<line/>
			<functionblock position="middle" type="MpRecipeXml"><input name="Enable"/><output name="Error"/></functionblock>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="gSoftwareReset"/>
			<line/>
			<functionblock position="middle" type="MpRecipeXml"><input name="ErrorReset"/><output name="StatusID"/></functionblock>
			<empty/>
			<empty/>
		</row>
		<row>
			<empty/>
			<contact type="address" name="'recipes'"/>
			<functionblock position="middle" type="MpRecipeXml"><input name="DeviceName" vardynamic="true"/><output name="CommandBusy"/></functionblock>
			<line/>
			<coil type="open" name="gRecipeInterface.Status.Busy"/>
		</row>
		<row>
			<empty/>
			<contact type="address" name="gRecipeInterface.Parameters.RecipeName"/>
			<functionblock position="middle" type="MpRecipeXml"><input name="FileName" vardynamic="true"/><output name="CommandDone"/></functionblock>
			<line/>
			<coil type="reset" name="gRecipeInterface.Commands.LoadRecipe"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<functionblock position="middle" type="MpRecipeXml"><input name="Header" vardynamic="true"/><output name="Info"/></functionblock>
			<empty or="true"/>
			<coil type="reset" name="gRecipeInterface.Commands.SaveRecipe"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<functionblock position="middle" type="MpRecipeXml"><input name="Category" vardynamic="true"/></functionblock>
			<empty/>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<functionblock position="middle" type="MpRecipeXml"><input name="LoadType"/></functionblock>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="gRecipeInterface.Commands.LoadRecipe"/>
			<contact type="open" name="MpRecipeXml_0.Active"/>
			<functionblock position="middle" type="MpRecipeXml"><input name="Load"/></functionblock>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="gRecipeInterface.Commands.SaveRecipe"/>
			<contact type="open" name="MpRecipeXml_0.Active"/>
			<functionblock position="middle" type="MpRecipeXml"><input name="Save"/></functionblock>
			<empty/>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<functionblock position="bottom" type="MpRecipeXml"><input name="UpdateNotification"/></functionblock>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<analog type="input" name="MpRecipeXml_0.Info.LastLoadedRecipe"/>
			<function position="topbottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gRecipeInterface.Status.LoadedRecipeName"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<analog type="input" name="gRecipeInterface.Status.LoadedRecipeName"/>
			<function position="top" type="EQ"><input name="" extensible="true"/><output name="1"/></function>
			<analog type="output" name="gRecipeInterface.Status.RecipeHasBeenLoaded"/>
		</row>
		<row>
			<analog type="input" name="gRecipeInterface.Parameters.RecipeName"/>
			<function position="bottom" type="EQ"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<analog type="input" name="gRecipeInterface.Status.LoadedRecipeName"/>
			<function position="top" type="EQ"><input name="" extensible="true"/><output name="1"/></function>
			<line/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="TYPE1_RECIPE_NAME"/>
			<function position="bottom" type="EQ"><input name="" extensible="true"/></function>
			<analog type="input" name="1"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gRecipeInterface.Status.LoadedRecipeIndex"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<analog type="input" name="gRecipeInterface.Status.LoadedRecipeName"/>
			<function position="top" type="EQ"><input name="" extensible="true"/><output name="1"/></function>
			<line/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="TYPE2_RECIPE_NAME"/>
			<function position="bottom" type="EQ"><input name="" extensible="true"/></function>
			<analog type="input" name="2"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="gRecipeInterface.Status.LoadedRecipeIndex"/>
		</row>
	</network>
</networks>
END_PROGRAM


















