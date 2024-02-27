
(* Determines when a glue channel should be turned on/off for a given glue pattern *)
FUNCTION GluePatternControl
	
	GluePatternControl := FALSE; //set output false. If the cycle position falls within one of our patterns, we'll turn it on
	
	//  Creating glue stitching patterns
	FOR i := 0 TO MAX_NUM_ONOFF_PATTERNS_M1 DO
		IF ChannelPattern.GlueOnDistance[i] > 0 THEN
	
			IF BeadLengths[i] = 0 THEN
				BeadLengths[i] := 0.25;
			END_IF;
			
			IF ChannelModulationCtrl = 0 THEN
				StitchPercentage := 1;
			END_IF;
			
			// Calculating a pattern's parameters
			GlueLength[i] := ChannelPattern.GlueOnDistance[i] * StitchPercentage;
			IF BeadLengths[i] > GlueLength[i] THEN
				BeadLengths[i] := GlueLength[i];
			ELSIF TRUNC(GlueLength[i] / BeadLengths[i]) > MAX_NUM_BEADS_M1 THEN
				BeadLengths[i] := GlueLength[i] / MAX_NUM_BEADS;
			END_IF;
			NumOfBeads[i] := TRUNC(GlueLength[i] / BeadLengths[i]);
			GapLength[i] := (ChannelPattern.GlueOnDistance[i] - GlueLength[i]) / NumOfBeads[i];
			EndCapLength[i] := GlueLength[i] - (BeadLengths[i] * NumOfBeads[i]);
			
			// Assigning the on and off locations for a stitch pattern
			FOR j := 0 TO NumOfBeads[i] - 1 DO
				Switches[i].FirstOnPosition[j] := ChannelPattern.DelayDistance[i] + (j * (BeadLengths[i] + GapLength[i]));
				Switches[i].LastOnPosition[j] := ChannelPattern.DelayDistance[i] + (j * (BeadLengths[i] + GapLength[i]) + BeadLengths[i]);
			END_FOR;
			
			// Adding endcap on and off locations if a pattern has one
			IF EndCapLength[i] <> 0 THEN
				Switches[i].FirstOnPosition[NumOfBeads[i]] := ChannelPattern.DelayDistance[i] + (NumOfBeads[i] * (BeadLengths[i] + GapLength[i]));
				Switches[i].LastOnPosition[NumOfBeads[i]] := ChannelPattern.DelayDistance[i] + (NumOfBeads[i] * (BeadLengths[i] + GapLength[i]) + EndCapLength[i]);
				
				FOR j := NumOfBeads[i] + 1 TO MAX_NUM_BEADS_M1 DO
					Switches[i].FirstOnPosition[j] := Switches[i].LastOnPosition[j] := 0;
				END_FOR;
			ELSIF NumOfBeads[i] < MAX_NUM_BEADS THEN
				FOR j := NumOfBeads[i] TO MAX_NUM_BEADS_M1 DO
					Switches[i].FirstOnPosition[j] := Switches[i].LastOnPosition[j] := 0;
				END_FOR;
			END_IF;
		ELSE
			FOR j := 0 TO MAX_NUM_BEADS_M1 DO
				Switches[i].FirstOnPosition[j] := Switches[i].LastOnPosition[j] := 0;
			END_FOR;
		END_IF;
	END_FOR;
	
	//loop over each gluing location's switch points
	//turn on the channel IF we are within a glueing window (adjusted for on/off delays)
	FOR i:=0 TO MAX_NUM_ONOFF_PATTERNS_M1 DO
		FOR j := 0 TO NumOfBeads[i] DO
			IF (ChannelPattern.GlueOnDistance[i] <= 0) THEN
				RETURN;
			ELSIF (((Switches[i].FirstOnPosition[j] - OnDelayCompensation) <= PositionInCycle) AND (PositionInCycle < (Switches[i].LastOnPosition[j] - OffDelayCompensation))) THEN
				GluePatternControl := TRUE;
				RETURN;
			END_IF;
		END_FOR;
	END_FOR;
	
END_FUNCTION
