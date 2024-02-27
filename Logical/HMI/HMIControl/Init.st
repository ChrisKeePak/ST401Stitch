

PROGRAM _INIT
	
	gActivePage; //useonce in code so that HMI can see this variable
	
//	gHMI.ColorMapDatapoints.AirPressureOK := OK;
//	gHMI.ColorMapDatapoints.SafetyOK := OK;
	//	gHMI.ColorMapDatapoints.colorma
	gHMI.StatusDatapoints.SmartVacuumLayerSDP := HIDE + LOCK;
	gHMI.StatusDatapoints.ServoLayerSDP := HIDE + LOCK;
	
	gHMI.ColorMapDatapoints.AdhesiveUnitServiceNeeded := OK;
	
	gModeControlInterface.Parameters.MaxPPM := 20; //set the max ppm to the smallest max that you'd see for any machine type. We think we can get into a state where the set PPM is put to 0 on startup if this number is 0
	
	gHMI.StatusDatapoints.RecipeDialogSDP := HIDE;
	
END_PROGRAM