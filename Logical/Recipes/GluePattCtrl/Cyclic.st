
PROGRAM _CYCLIC
	
	SaveButton_RTrig.CLK := gRecipeInterface.Commands.SaveRecipe;
	
	IF SaveButton_RTrig.Q THEN
		gAdhesiveCtrlInterface.Parameters.SavedPatterns[gAdhesiveCtrlInterface.Parameters.PatternSelection].AdhesivePatterns := gAdhesiveCtrlInterface.Parameters.AdhesivePatterns;
	END_IF
	
	IF gHMI.StatusDatapoints.AdhesivePatternConfirmedSDP.0 THEN
		gAdhesiveCtrlInterface.Parameters.AdhesivePatterns := gAdhesiveCtrlInterface.Parameters.SavedPatterns[gAdhesiveCtrlInterface.Parameters.PatternSelection].AdhesivePatterns;
		gHMI.StatusDatapoints.AdhesivePatternConfirmedSDP.0 := FALSE;
	END_IF
	
    SaveButton_RTrig();
    
END_PROGRAM
