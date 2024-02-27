
ACTION DecodeStatus: 
	
	gAdhesiveCtrlInterface.Parameters.NordsonComms.UnitReady := NordsonRxPacket.Byte0_1_Status.0; //status word description from nordson manual
	gAdhesiveCtrlInterface.Parameters.NordsonComms.PumpStartUpProtectionOn := NordsonRxPacket.Byte0_1_Status.1;
	gAdhesiveCtrlInterface.Parameters.NordsonComms.Alert := NordsonRxPacket.Byte0_1_Status.2;
	gAdhesiveCtrlInterface.Parameters.NordsonComms.UnitFaulted := NordsonRxPacket.Byte0_1_Status.3;
	gAdhesiveCtrlInterface.Parameters.NordsonComms.ShutDown := NordsonRxPacket.Byte0_1_Status.4;
	gAdhesiveCtrlInterface.Parameters.NordsonComms.HeatUpPhaseActive := NordsonRxPacket.Byte0_1_Status.5;
	gAdhesiveCtrlInterface.Status.NordsonInStandby := NordsonRxPacket.Byte0_1_Status.6;
	gAdhesiveCtrlInterface.Parameters.NordsonComms.CommFault := NordsonRxPacket.Byte0_1_Status.14;
	gAdhesiveCtrlInterface.Parameters.NordsonComms.CommFaultInDataValue := NordsonRxPacket.Byte0_1_Status.15;

END_ACTION
