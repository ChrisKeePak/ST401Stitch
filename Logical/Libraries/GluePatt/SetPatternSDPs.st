
(* Sets adhesive pattern SDPs based on machine parameters and conditions *)
FUNCTION SetPatternSDPs
	
	FOR i:=0 TO MAX_NUM_GLUE_CHANNELS_M1 DO
		FOR j:=0 TO MAX_NUM_ONOFF_PATTERNS_M1 DO
			
			//find a SDP that indicates the edit popup is open (bit 12). Set the colordata point of that field to 1
			IF(FieldSDPs.AdhesiveChannelSDPs[i].Delay[j].12 = 1) THEN
				FieldColormaps.AdhesiveChannelsColormaps[i].Delay[j] := 1;
			ELSE
				FieldColormaps.AdhesiveChannelsColormaps[i].Delay[j] := 0;
			END_IF
			
			IF(FieldSDPs.AdhesiveChannelSDPs[i].Glue[j].12 = 1) THEN
				FieldColormaps.AdhesiveChannelsColormaps[i].Glue[j] := 1;
			ELSE
				FieldColormaps.AdhesiveChannelsColormaps[i].Glue[j] := 0;
			END_IF
			
			//hide rows if there are not enough active channels
			IF(NumGlueChannels >= (i+1)) THEN
				FieldSDPs.AdhesiveChannelSDPs[i].RowLabel := UNHIDE + UNLOCK;
				FieldSDPs.AdhesiveChannelSDPs[i].Delay[j].0 := 0; //unhide and unlock
				FieldSDPs.AdhesiveChannelSDPs[i].Delay[j].1 := 0;
				FieldSDPs.AdhesiveChannelSDPs[i].Glue[j].0 := 0;
				FieldSDPs.AdhesiveChannelSDPs[i].Glue[j].1 := 0;
			ELSE
				FieldSDPs.AdhesiveChannelSDPs[i].RowLabel := HIDE + LOCK;
				FieldSDPs.AdhesiveChannelSDPs[i].Delay[j].0 := 1; //hide and lock
				FieldSDPs.AdhesiveChannelSDPs[i].Delay[j].1 := 1;
				FieldSDPs.AdhesiveChannelSDPs[i].Glue[j].0 := 1;
				FieldSDPs.AdhesiveChannelSDPs[i].Glue[j].1 := 1;
			END_IF
			
		END_FOR;
	END_FOR;
		
		SetPatternSDPs := 1;
	
END_FUNCTION
