PROGRAM _CYCLIC
<?xml version="1.0"?>
<?AutomationStudio Version=3.0.71?>
<!-- Automation Studio Generated XML Section -->
<networks maxcolumn="0">
	<network label="" comment="" row="8" column="0" commented="0">
		<row>
			<empty/>
			<empty/>
			<functionblock position="header" name="ServoRam" type="AxisBasic"/>
			<empty/>
		</row>
		<row>
			<empty/>
			<contact type="address" name="mpServoRam"/>
			<functionblock position="top" type="AxisBasic"><input name="pMpLink"/></functionblock>
			<empty/>
		</row>
		<row>
			<empty/>
			<contact type="address" name="gServoRam"/>
			<functionblock position="middle" type="AxisBasic"><input name="pAxis"/></functionblock>
			<empty/>
		</row>
		<row>
			<empty/>
			<contact type="address" name="ServoRam_EPD"/>
			<functionblock position="middle" type="AxisBasic"><input name="pEndlessPosition"/></functionblock>
			<empty/>
		</row>
		<row>
			<empty/>
			<contact type="address" name="gServoRamInterface"/>
			<functionblock position="middle" type="AxisBasic"><input name="AxisInterface"/></functionblock>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<functionblock position="middle" type="AxisBasic"><input name="OdometerValue"/></functionblock>
			<empty/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="ServoOverride"/>
			<functionblock position="middle" type="AxisBasic"><input name="Override"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="open" name="gSoftwareReset"/>
			<line/>
			<functionblock position="bottom" type="AxisBasic"><input name="ErrorReset"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="8" column="0" commented="0">
		<row>
			<empty/>
			<empty/>
			<functionblock position="header" name="ServoFeed" type="AxisBasic"/>
			<empty/>
		</row>
		<row>
			<empty/>
			<contact type="address" name="mpServoFeed"/>
			<functionblock position="top" type="AxisBasic"><input name="pMpLink"/></functionblock>
			<empty/>
		</row>
		<row>
			<empty/>
			<contact type="address" name="gServoFeed"/>
			<functionblock position="middle" type="AxisBasic"><input name="pAxis"/></functionblock>
			<empty/>
		</row>
		<row>
			<empty/>
			<contact type="address" name="ServoFeed_EPD"/>
			<functionblock position="middle" type="AxisBasic"><input name="pEndlessPosition"/></functionblock>
			<empty/>
		</row>
		<row>
			<empty/>
			<contact type="address" name="gServoFeedInterface"/>
			<functionblock position="middle" type="AxisBasic"><input name="AxisInterface"/></functionblock>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<functionblock position="middle" type="AxisBasic"><input name="OdometerValue"/></functionblock>
			<empty/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="ServoOverride"/>
			<functionblock position="middle" type="AxisBasic"><input name="Override"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="open" name="gSoftwareReset"/>
			<line/>
			<functionblock position="bottom" type="AxisBasic"><input name="ErrorReset"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="8" column="0" commented="0">
		<row>
			<empty/>
			<empty/>
			<functionblock position="header" name="ServoHopper" type="AxisBasic"/>
			<empty/>
		</row>
		<row>
			<empty/>
			<contact type="address" name="mpServoHopper"/>
			<functionblock position="top" type="AxisBasic"><input name="pMpLink"/></functionblock>
			<empty/>
		</row>
		<row>
			<empty/>
			<contact type="address" name="gServoHopper"/>
			<functionblock position="middle" type="AxisBasic"><input name="pAxis"/></functionblock>
			<empty/>
		</row>
		<row>
			<empty/>
			<contact type="address" name="ServoHopper_EPD"/>
			<functionblock position="middle" type="AxisBasic"><input name="pEndlessPosition"/></functionblock>
			<empty/>
		</row>
		<row>
			<empty/>
			<contact type="address" name="gServoHopperInterface"/>
			<functionblock position="middle" type="AxisBasic"><input name="AxisInterface"/></functionblock>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<functionblock position="middle" type="AxisBasic"><input name="OdometerValue"/></functionblock>
			<empty/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="ServoOverride"/>
			<functionblock position="middle" type="AxisBasic"><input name="Override"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="open" name="gSoftwareReset"/>
			<line/>
			<functionblock position="bottom" type="AxisBasic"><input name="ErrorReset"/></functionblock>
			<empty/>
		</row>
	</network>
</networks>
END_PROGRAM







































