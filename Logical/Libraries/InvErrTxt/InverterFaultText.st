(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: ErrTxt
 * File: ErrTxt.st
 * Author: scoccimaroj
 * Created: November 09, 2010
 ********************************************************************
 * Implementation of function InverterFaultText
 ********************************************************************)


FUNCTION_BLOCK InverterFaultText
	

(*****************************************************************
		Initializing the Fault Tables
 ****************************************************************)	
 
	IF ( isInitialized = FALSE) THEN
        (*ensure the fault table array creation is only run once upon start up*)
		isInitialized := TRUE;
        (*initialize internal fault comparison variable so that the first error is correctly written by the FUB *)
		PreviousFault :=  -1;
        (*initialize the output variable value*)
        LastFault := 0;
        (*this status will most likely not be seen by the FUB user but is written in case the table creation arrays are expanded enough for a visible delay to be seen*)
	    Status := INITIALIZING_ERROR_TEXT;

		(* Initialize the S44 Fault table first *)
		S44FaultTable[0].FaultNumber := 0;
		strcpy( ADR(S44FaultTable[0].FaultDescription), ADR('nOF - No Fault Present') );
 
		S44FaultTable[1].FaultNumber := 1;
		strcpy( ADR(S44FaultTable[1].FaultDescription), ADR('InF - Calibration Error') );
	
		S44FaultTable[2].FaultNumber := 3;
		strcpy( ADR(S44FaultTable[2].FaultDescription), ADR('CFF - Incorrect Configuration') );
	
		S44FaultTable[3].FaultNumber := 4;
		strcpy( ADR(S44FaultTable[3].FaultDescription), ADR('CFI - Invalid Configuration') );
	
		S44FaultTable[4].FaultNumber := 5;
		strcpy( ADR(S44FaultTable[4].FaultDescription), ADR('SLF1 - ModBus Communication Fault') );
	
		S44FaultTable[5].FaultNumber := 9;
		strcpy( ADR(S44FaultTable[5].FaultDescription), ADR('OCF - Over Current Fault') );
	
		S44FaultTable[6].FaultNumber := 10;
		strcpy( ADR(S44FaultTable[6].FaultDescription), ADR('CrF1 - Precharge Fault') );
	
		S44FaultTable[7].FaultNumber := 16;
		strcpy( ADR(S44FaultTable[7].FaultDescription), ADR('OHF - Drive Overheat') );
	
		S44FaultTable[8].FaultNumber := 17;
		strcpy( ADR(S44FaultTable[8].FaultDescription), ADR('OLF - Motor Overload') );
	
		S44FaultTable[9].FaultNumber := 18;
		strcpy( ADR(S44FaultTable[9].FaultDescription), ADR('ObF - Overbraking') );
	
		S44FaultTable[10].FaultNumber := 19;
		strcpy( ADR(S44FaultTable[10].FaultDescription), ADR('OSF - Mains Overvoltage') );
	
		S44FaultTable[11].FaultNumber := 20;
		strcpy( ADR(S44FaultTable[11].FaultDescription), ADR('OPF1 - 1 Output Phase Loss') );
	
		S44FaultTable[12].FaultNumber := 21;
		strcpy( ADR(S44FaultTable[12].FaultDescription), ADR('PHF - Input Phase Loss') );
	
		S44FaultTable[13].FaultNumber := 22;
		strcpy( ADR(S44FaultTable[13].FaultDescription), ADR('USF - Undervoltage') );
	
		S44FaultTable[14].FaultNumber := 23;
		strcpy( ADR(S44FaultTable[14].FaultDescription), ADR('SCF1 - Motor Short Circuit') );
	
		S44FaultTable[15].FaultNumber := 24;
		strcpy( ADR(S44FaultTable[15].FaultDescription), ADR('SOF - Overspeed') );
	
		S44FaultTable[16].FaultNumber := 25;
		strcpy( ADR(S44FaultTable[16].FaultDescription), ADR('tnF - Auto-tuning Fault') );
	
		S44FaultTable[17].FaultNumber := 26;
		strcpy( ADR(S44FaultTable[17].FaultDescription), ADR('InF1 - Rating Error') );
	
		S44FaultTable[18].FaultNumber := 27;
		strcpy( ADR(S44FaultTable[18].FaultDescription), ADR('InF2 - Power Calibration') );
	
		S44FaultTable[19].FaultNumber := 28;
		strcpy( ADR(S44FaultTable[19].FaultDescription), ADR('InF3 - Internal Serial Link') );
	
		S44FaultTable[20].FaultNumber := 29;
		strcpy( ADR(S44FaultTable[20].FaultDescription), ADR('InF4 - Internal Mfg area') );
	
		S44FaultTable[21].FaultNumber := 32;
		strcpy( ADR(S44FaultTable[21].FaultDescription), ADR('SCF3 - Ground Short Circuit') );
	
		S44FaultTable[22].FaultNumber := 33;
		strcpy( ADR(S44FaultTable[22].FaultDescription), ADR('OPF2 - 3 Output Phase Loss') );
	
		S44FaultTable[23].FaultNumber := 42;
		strcpy( ADR(S44FaultTable[23].FaultDescription), ADR('SLF2 - PowerSuite Communication') );
	
		S44FaultTable[24].FaultNumber := 45;
		strcpy( ADR(S44FaultTable[24].FaultDescription), ADR('SLF3 - HMI Communication Fault') );
	
		S44FaultTable[25].FaultNumber := 51;
		strcpy( ADR(S44FaultTable[25].FaultDescription), ADR('InF9 - Internal I measure') );
	
		S44FaultTable[26].FaultNumber := 53;
		strcpy( ADR(S44FaultTable[26].FaultDescription), ADR('InFb - Internal th. sensor') );
	
		S44FaultTable[27].FaultNumber := 54;
		strcpy( ADR(S44FaultTable[27].FaultDescription), ADR('tJF - IGBT Overheat') );
	
		S44FaultTable[28].FaultNumber := 55;
		strcpy( ADR(S44FaultTable[28].FaultDescription), ADR('SCF4 - IGBT Short Circuit') );
	
		S44FaultTable[29].FaultNumber := 56;
		strcpy( ADR(S44FaultTable[29].FaultDescription), ADR('SCF5 - Motor Short Circuit') );
	
		S44FaultTable[30].FaultNumber := 69;
		strcpy( ADR(S44FaultTable[30].FaultDescription), ADR('InFE - Internal CPU Fault') );
	
		S44FaultTable[31].FaultNumber := 77;
		strcpy( ADR(S44FaultTable[31].FaultDescription), ADR('CFI2') );
	
		S44FaultTable[32].FaultNumber := 100;
		strcpy( ADR(S44FaultTable[32].FaultDescription), ADR('ULF - Underload Fault') );
	
		S44FaultTable[33].FaultNumber := 101;
		strcpy( ADR(S44FaultTable[33].FaultDescription), ADR('OLC - Overload Fault') );
	
		S44FaultTable[34].FaultNumber := 106;
		strcpy( ADR(S44FaultTable[34].FaultDescription), ADR('LFF1') );
	
		S44FaultTable[35].FaultNumber := 253;
		strcpy( ADR(S44FaultTable[35].FaultDescription), ADR('XXXX') );
	
		(* Initialize the X64 Table *)
		X64FaultTable[0].FaultNumber := 0;
		strcpy( ADR(X64FaultTable[0].FaultDescription), ADR('nOF - No Fault Code') );
	
		X64FaultTable[1].FaultNumber := 3;
		strcpy( ADR(X64FaultTable[1].FaultDescription), ADR('CFF - Incorrect Configuration') );
	
		X64FaultTable[2].FaultNumber := 4;
		strcpy( ADR(X64FaultTable[2].FaultDescription), ADR('CFI - Invalid Configuration') );
	
		X64FaultTable[3].FaultNumber := 5;
		strcpy( ADR(X64FaultTable[3].FaultDescription), ADR('SLF - Communication Fault') );
	
		X64FaultTable[4].FaultNumber := 6;
		strcpy( ADR(X64FaultTable[4].FaultDescription), ADR('ILF - Internal Communication Interuption') );
	
		X64FaultTable[5].FaultNumber := 7;
		strcpy( ADR(X64FaultTable[5].FaultDescription), ADR('CnF - Communication Option Card') );
	
		X64FaultTable[6].FaultNumber := 8;
		strcpy( ADR(X64FaultTable[6].FaultDescription), ADR('EPF - External Fault') );
	
		X64FaultTable[7].FaultNumber := 9;
		strcpy( ADR(X64FaultTable[7].FaultDescription), ADR('OCF - Overcurrent') );
	
		X64FaultTable[8].FaultNumber := 10;
		strcpy( ADR(X64FaultTable[8].FaultDescription), ADR('CrF - Capacitor pre-charge') );
	
		X64FaultTable[9].FaultNumber := 13;
		strcpy( ADR(X64FaultTable[9].FaultDescription), ADR('LFF - 4 - 20 mA loss') );
	
		X64FaultTable[10].FaultNumber := 16;
		strcpy( ADR(X64FaultTable[10].FaultDescription), ADR('OHF - Drive Overheating') );
	
		X64FaultTable[11].FaultNumber := 17;
		strcpy( ADR(X64FaultTable[11].FaultDescription), ADR('OLF - Motor Overload') );
	
		X64FaultTable[12].FaultNumber := 18;
		strcpy( ADR(X64FaultTable[12].FaultDescription), ADR('ObF - DC Bus Overvoltage') );
	
		X64FaultTable[13].FaultNumber := 19;
		strcpy( ADR(X64FaultTable[13].FaultDescription), ADR('OSF - Line Supply Overvoltage') );
	
		X64FaultTable[14].FaultNumber := 20;
		strcpy( ADR(X64FaultTable[14].FaultDescription), ADR('OPF - Motor Phase Lose') );
	
		X64FaultTable[15].FaultNumber := 21;
		strcpy( ADR(X64FaultTable[15].FaultDescription), ADR('PHF - Line Phase Loss') );
	
		X64FaultTable[16].FaultNumber := 22;
		strcpy( ADR(X64FaultTable[16].FaultDescription), ADR('USF - Line Supply Undervoltage') );
	
		X64FaultTable[17].FaultNumber := 23;
		strcpy( ADR(X64FaultTable[17].FaultDescription), ADR('OCF - Motor Short Circuit (phase to phase)') );
	
		X64FaultTable[18].FaultNumber := 24;
		strcpy( ADR(X64FaultTable[18].FaultDescription), ADR('SOF - Motor Overspeed') );
	
		X64FaultTable[19].FaultNumber := 25;
		strcpy( ADR(X64FaultTable[19].FaultDescription), ADR('tnF - Auto-tuning was unsuccessful') );
	
		X64FaultTable[20].FaultNumber := 26;
		strcpy( ADR(X64FaultTable[20].FaultDescription), ADR('IF1 - Unknow rating') );
	
		X64FaultTable[21].FaultNumber := 27;
		strcpy( ADR(X64FaultTable[21].FaultDescription), ADR('IF2 - MMI card') );
	
		X64FaultTable[22].FaultNumber := 28;
		strcpy( ADR(X64FaultTable[22].FaultDescription), ADR('IF3 - MMI communication') );
	
		X64FaultTable[23].FaultNumber := 29;
		strcpy( ADR(X64FaultTable[23].FaultDescription), ADR('IF4 - Industrial EEPROM memory') );
	
		X64FaultTable[24].FaultNumber := 30;
		strcpy( ADR(X64FaultTable[24].FaultDescription), ADR('EEF - EEPROM memory') );
	
		X64FaultTable[25].FaultNumber := 31;
		strcpy( ADR(X64FaultTable[25].FaultDescription), ADR('OCF - Impeding Short Circuit') );
	
		X64FaultTable[26].FaultNumber := 32;
		strcpy( ADR(X64FaultTable[26].FaultDescription), ADR('SCF - Motor Short Circuit (to ground)') );
	
		X64FaultTable[27].FaultNumber := 33;
		strcpy( ADR(X64FaultTable[27].FaultDescription), ADR('OPF - Motor Phase Loss - 3 phases') );
	
		X64FaultTable[28].FaultNumber := 34;
		strcpy( ADR(X64FaultTable[28].FaultDescription), ADR('COF - Communication Interuption') );
	
		X64FaultTable[29].FaultNumber := 35;
		strcpy( ADR(X64FaultTable[29].FaultDescription), ADR('bLF - Brake Control') );
	
		X64FaultTable[30].FaultNumber := 36;
		strcpy( ADR(X64FaultTable[30].FaultDescription), ADR('OCF - Power Module on 15 kW drive') );
	
		X64FaultTable[31].FaultNumber := 55;
		strcpy( ADR(X64FaultTable[31].FaultDescription), ADR('SCF - Power Module or Motor Short Circuit') );
	
		(* Initialize the P84 Table *)
		P84FaultTable[0].FaultNumber := 0;
		strcpy( ADR(P84FaultTable[0].FaultDescription), ADR('nOF - No Fault') );
	
		P84FaultTable[1].FaultNumber := 1;
		strcpy( ADR(P84FaultTable[1].FaultDescription), ADR('InF - Calibration Error') );
	
		P84FaultTable[2].FaultNumber := 2;
		strcpy( ADR(P84FaultTable[2].FaultDescription), ADR('EEF1 - Control EEPROM') );
	
		P84FaultTable[3].FaultNumber := 3;
		strcpy( ADR(P84FaultTable[3].FaultDescription), ADR('CFF - Incorrect Configuration') );
	
		P84FaultTable[4].FaultNumber := 4;
		strcpy( ADR(P84FaultTable[4].FaultDescription), ADR('CFI - Invalid Configuration') );
	
		P84FaultTable[5].FaultNumber := 5;
		strcpy( ADR(P84FaultTable[5].FaultDescription), ADR('SLF1 - Communication Error') );
	
		P84FaultTable[6].FaultNumber := 6;
		strcpy( ADR(P84FaultTable[6].FaultDescription), ADR('ILF - Internal Communication Link') );
	
		P84FaultTable[7].FaultNumber := 7;
		strcpy( ADR(P84FaultTable[7].FaultDescription), ADR('CnF - Communication Network') );
	
		P84FaultTable[8].FaultNumber := 8;
		strcpy( ADR(P84FaultTable[8].FaultDescription), ADR('EPF1 - External Fault') );
	
		P84FaultTable[9].FaultNumber := 9;
		strcpy( ADR(P84FaultTable[9].FaultDescription), ADR('OCF - Overcurrent') );
	
		P84FaultTable[10].FaultNumber := 10;
		strcpy( ADR(P84FaultTable[10].FaultDescription), ADR('CrF - Precharge') );
	
		P84FaultTable[11].FaultNumber := 11;
		strcpy( ADR(P84FaultTable[11].FaultDescription), ADR('SPF - Speed Feedback loss') );
	
		P84FaultTable[12].FaultNumber := 12;
		strcpy( ADR(P84FaultTable[12].FaultDescription), ADR('AnF - Load Slipping') );
	
		P84FaultTable[13].FaultNumber := 13;
		strcpy( ADR(P84FaultTable[13].FaultDescription), ADR('LFF2 - AI2 4-20 mA Loss') );
	
		P84FaultTable[14].FaultNumber := 14;
		strcpy( ADR(P84FaultTable[14].FaultDescription), ADR('PtF1 - PTC1 Probe') );
	
		P84FaultTable[15].FaultNumber := 15;
		strcpy( ADR(P84FaultTable[15].FaultDescription), ADR('OtF1 - PTC1 Overheat') );
	
		P84FaultTable[16].FaultNumber := 16;
		strcpy( ADR(P84FaultTable[16].FaultDescription), ADR('OHF - Drive Overheat') );
	
		P84FaultTable[17].FaultNumber := 17;
		strcpy( ADR(P84FaultTable[17].FaultDescription), ADR('OLF - Motor Overload') );
	
		P84FaultTable[18].FaultNumber := 18;
		strcpy( ADR(P84FaultTable[18].FaultDescription), ADR('ObF - Overbraking') );
	
		P84FaultTable[19].FaultNumber := 19;
		strcpy( ADR(P84FaultTable[19].FaultDescription), ADR('OSF - Mains Overvoltage') );
	
		P84FaultTable[20].FaultNumber := 20;
		strcpy( ADR(P84FaultTable[20].FaultDescription), ADR('OPF1 - 1 Output Phase Loss') );
	
		P84FaultTable[21].FaultNumber := 21;
		strcpy( ADR(P84FaultTable[21].FaultDescription), ADR('PHF - Input Phase Loss') );
	
		P84FaultTable[22].FaultNumber := 22;
		strcpy( ADR(P84FaultTable[22].FaultDescription), ADR('USF - Undervoltage') );
	
		P84FaultTable[23].FaultNumber := 23;
		strcpy( ADR(P84FaultTable[23].FaultDescription), ADR('SCF1 - Motor Short Circuit') );
	
		P84FaultTable[24].FaultNumber := 24;
		strcpy( ADR(P84FaultTable[24].FaultDescription), ADR('SOF - Overspeed') );
	
		P84FaultTable[25].FaultNumber := 25;
		strcpy( ADR(P84FaultTable[25].FaultDescription), ADR('tnF - Auto-tuning Unsuccessful') );
	
		P84FaultTable[26].FaultNumber := 26;
		strcpy( ADR(P84FaultTable[26].FaultDescription), ADR('InF1 - Rating Error') );
	
		P84FaultTable[27].FaultNumber := 27;
		strcpy( ADR(P84FaultTable[27].FaultDescription), ADR('InF2 - Power Calibration') );
	
		P84FaultTable[28].FaultNumber := 28;
		strcpy( ADR(P84FaultTable[28].FaultDescription), ADR('InF3 - Internal Serial Link') );
	
		P84FaultTable[29].FaultNumber := 29;
		strcpy( ADR(P84FaultTable[29].FaultDescription), ADR('InF4 - Internal Mfg Area') );
	
		P84FaultTable[30].FaultNumber := 30;
		strcpy( ADR(P84FaultTable[30].FaultDescription), ADR('EEF2 - Power EEPROM') );
	
		P84FaultTable[31].FaultNumber := 31;
		strcpy( ADR(P84FaultTable[31].FaultDescription), ADR('SCF2 - Impedant Short Circuit') );
	
		P84FaultTable[32].FaultNumber := 32;
		strcpy( ADR(P84FaultTable[32].FaultDescription), ADR('SCF3 - Ground Short Circuit') );
	
		P84FaultTable[33].FaultNumber := 33;
		strcpy( ADR(P84FaultTable[33].FaultDescription), ADR('OPF2 - 3 Phase Output Loss') );
	
		P84FaultTable[34].FaultNumber := 34;
		strcpy( ADR(P84FaultTable[34].FaultDescription), ADR('COF - Powerlink Communication') );
	
		P84FaultTable[35].FaultNumber := 35;
		strcpy( ADR(P84FaultTable[35].FaultDescription), ADR('bLF - Brake Control') );
	
		P84FaultTable[36].FaultNumber := 37;
		strcpy( ADR(P84FaultTable[36].FaultDescription), ADR('InF7 - Internal Hard Init') );
	
		P84FaultTable[37].FaultNumber := 38;
		strcpy( ADR(P84FaultTable[37].FaultDescription), ADR('EPF2 - External Fault Com.') );
	
		P84FaultTable[38].FaultNumber := 39;
		strcpy( ADR(P84FaultTable[38].FaultDescription), ADR('APF - Application Fault') );
	
		P84FaultTable[39].FaultNumber := 40;
		strcpy( ADR(P84FaultTable[39].FaultDescription), ADR('InF8 - Internal Ctrl Supply') );
	
		P84FaultTable[40].FaultNumber := 41;
		strcpy( ADR(P84FaultTable[40].FaultDescription), ADR('brF - Brake Feedback') );
	
		P84FaultTable[41].FaultNumber := 42;
		strcpy( ADR(P84FaultTable[41].FaultDescription), ADR('SLF2 - PowerSuite Communication.') );
	
		P84FaultTable[42].FaultNumber := 43;
		strcpy( ADR(P84FaultTable[42].FaultDescription), ADR('ECF - Encoder Coupling') );
	
		P84FaultTable[43].FaultNumber := 44;
		strcpy( ADR(P84FaultTable[43].FaultDescription), ADR('SSF - Torque Current Limit') );
	
		P84FaultTable[44].FaultNumber :=45 ;
		strcpy( ADR(P84FaultTable[44].FaultDescription), ADR('SLF3 - HMI com.') );
	
		P84FaultTable[45].FaultNumber := 46;
		strcpy( ADR(P84FaultTable[45].FaultDescription), ADR('PrF - Power Removal') );
	
		P84FaultTable[46].FaultNumber := 47;
		strcpy( ADR(P84FaultTable[46].FaultDescription), ADR('PtF2 - PTC2 Probe') );
	
		P84FaultTable[47].FaultNumber := 48;
		strcpy( ADR(P84FaultTable[47].FaultDescription), ADR('OtF2 - PTC2 Overheat') );
	
		P84FaultTable[48].FaultNumber := 49;
		strcpy( ADR(P84FaultTable[48].FaultDescription), ADR('PtFL - LI6=PTC Probe') );
	
		P84FaultTable[49].FaultNumber := 50;
		strcpy( ADR(P84FaultTable[49].FaultDescription), ADR('OtFL - PTC Fault') );
	
		P84FaultTable[50].FaultNumber := 51;
		strcpy( ADR(P84FaultTable[50].FaultDescription), ADR('InF9 - Internal I measure') );
	
		P84FaultTable[51].FaultNumber := 52;
		strcpy( ADR(P84FaultTable[51].FaultDescription), ADR('InFA - Internal Mains Circuit') );
	
		P84FaultTable[52].FaultNumber := 53;
		strcpy( ADR(P84FaultTable[52].FaultDescription), ADR('InFb - Internal th. Sensor') );
	
		P84FaultTable[53].FaultNumber := 54;
		strcpy( ADR(P84FaultTable[53].FaultDescription), ADR('tJF - IGBT Overheat') );
	
		P84FaultTable[54].FaultNumber := 55;
		strcpy( ADR(P84FaultTable[54].FaultDescription), ADR('SCF4 - IGBT Short Circuit') );
	
		P84FaultTable[55].FaultNumber := 56;
		strcpy( ADR(P84FaultTable[55].FaultDescription), ADR('SCF5 - Motor Short Circuit') );
	
		P84FaultTable[56].FaultNumber :=57 ;
		strcpy( ADR(P84FaultTable[56].FaultDescription), ADR('SrF - Torque Time-out') );
	
		P84FaultTable[57].FaultNumber := 58;
		strcpy( ADR(P84FaultTable[57].FaultDescription), ADR('FCF1 - Output Contact Stuck') );
	
		P84FaultTable[58].FaultNumber := 59;
		strcpy( ADR(P84FaultTable[58].FaultDescription), ADR('FCF2 - Output Contact Open') );
	
		P84FaultTable[59].FaultNumber := 60;
		strcpy( ADR(P84FaultTable[59].FaultDescription), ADR('InFC - Int. T Measurement') );
	
		P84FaultTable[60].FaultNumber := 61;
		strcpy( ADR(P84FaultTable[60].FaultDescription), ADR('AI2F - AI2 Input') );
	
		P84FaultTable[61].FaultNumber := 62;
		strcpy( ADR(P84FaultTable[61].FaultDescription), ADR('EnF - Encoder') );
	
		P84FaultTable[62].FaultNumber := 63;
		strcpy( ADR(P84FaultTable[62].FaultDescription), ADR('CrF2 - Thyr. Soft Charge') );
	
		P84FaultTable[63].FaultNumber := 64;
		strcpy( ADR(P84FaultTable[63].FaultDescription), ADR('LCF - Input Contactor') );
	
		P84FaultTable[64].FaultNumber := 65;
		strcpy( ADR(P84FaultTable[64].FaultDescription), ADR('bUF - DB Unit Short Circuit') );
	
		P84FaultTable[65].FaultNumber := 66;
		strcpy( ADR(P84FaultTable[65].FaultDescription), ADR('dCF - Iff. I Fault') );
	
		P84FaultTable[66].FaultNumber := 67;
		strcpy( ADR(P84FaultTable[66].FaultDescription), ADR('HdF - IGBT  Desaturation') );
	
		P84FaultTable[67].FaultNumber := 68;
		strcpy( ADR(P84FaultTable[67].FaultDescription), ADR('InF6 - Internal Option') );
	
		P84FaultTable[68].FaultNumber := 69;
		strcpy( ADR(P84FaultTable[68].FaultDescription), ADR('InFE - Internal CPU') );
	
		P84FaultTable[69].FaultNumber := 70;
		strcpy( ADR(P84FaultTable[69].FaultDescription), ADR('bOF - BR Overload') );
	
		P84FaultTable[70].FaultNumber := 71;
		strcpy( ADR(P84FaultTable[70].FaultDescription), ADR('LFF3 - AI3 4-20 mA Loss') );
	
		P84FaultTable[71].FaultNumber := 72;
		strcpy( ADR(P84FaultTable[71].FaultDescription), ADR('LEF4 - AI4 4-20 mA Loss') );
	
		P84FaultTable[72].FaultNumber := 73;
		strcpy( ADR(P84FaultTable[72].FaultDescription), ADR('HCF - Cards Pairing') );
	
		P84FaultTable[73].FaultNumber := 76;
		strcpy( ADR(P84FaultTable[73].FaultDescription), ADR('dLF - Load Fault') );
	
		P84FaultTable[74].FaultNumber := 99;
		strcpy( ADR(P84FaultTable[74].FaultDescription), ADR('CSF - Ch. SW. Fault') );
	
		(* Initialize the P74 Table *)
		P74FaultTable[0].FaultNumber := 0;
		strcpy( ADR(P74FaultTable[0].FaultDescription), ADR('nOF - No Fault') );
	
		P74FaultTable[1].FaultNumber := 1;
		strcpy( ADR(P74FaultTable[1].FaultDescription), ADR('InF - Calibration Error') );
	
		P74FaultTable[2].FaultNumber := 2;
		strcpy( ADR(P74FaultTable[2].FaultDescription), ADR('EEF1 - Control EEPROM') );
	
		P74FaultTable[3].FaultNumber := 3;
		strcpy( ADR(P74FaultTable[3].FaultDescription), ADR('CFF - Incorrect Configuration') );
	
		P74FaultTable[4].FaultNumber := 4;
		strcpy( ADR(P74FaultTable[4].FaultDescription), ADR('CFI - Invalid Configuration') );
	
		P74FaultTable[5].FaultNumber := 5;
		strcpy( ADR(P74FaultTable[5].FaultDescription), ADR('SLF1 - Communication Error') );
	
		P74FaultTable[6].FaultNumber := 6;
		strcpy( ADR(P74FaultTable[6].FaultDescription), ADR('ILF - Internal Communication Link') );
	
		P74FaultTable[7].FaultNumber := 7;
		strcpy( ADR(P74FaultTable[7].FaultDescription), ADR('CnF - Communication Network') );
	
		P74FaultTable[8].FaultNumber := 8;
		strcpy( ADR(P74FaultTable[8].FaultDescription), ADR('EPF1 - External Fault') );
	
		P74FaultTable[9].FaultNumber := 9;
		strcpy( ADR(P74FaultTable[9].FaultDescription), ADR('OCF - Overcurrent') );
	
		P74FaultTable[10].FaultNumber := 10;
		strcpy( ADR(P74FaultTable[10].FaultDescription), ADR('CrF - Precharge') );
	
		P74FaultTable[11].FaultNumber := 11;
		strcpy( ADR(P74FaultTable[11].FaultDescription), ADR('SPF - Speed Feedback loss') );

		P74FaultTable[12].FaultNumber := 16;
		strcpy( ADR(P74FaultTable[12].FaultDescription), ADR('OHF - Drive Overheat') );
	
		P74FaultTable[13].FaultNumber := 17;
		strcpy( ADR(P74FaultTable[13].FaultDescription), ADR('OLF - Motor Overload') );
	
		P74FaultTable[14].FaultNumber := 18;
		strcpy( ADR(P74FaultTable[14].FaultDescription), ADR('ObF - Overbraking') );
	
		P74FaultTable[15].FaultNumber := 19;
		strcpy( ADR(P74FaultTable[15].FaultDescription), ADR('OSF - Mains Overvoltage') );
	
		P74FaultTable[16].FaultNumber := 20;
		strcpy( ADR(P74FaultTable[16].FaultDescription), ADR('OPF1 - 1 Output Phase Loss') );
	
		P74FaultTable[17].FaultNumber := 21;
		strcpy( ADR(P74FaultTable[17].FaultDescription), ADR('PHF - Input Phase Loss') );
	
		P74FaultTable[18].FaultNumber := 22;
		strcpy( ADR(P74FaultTable[18].FaultDescription), ADR('USF - Undervoltage') );
	
		P74FaultTable[19].FaultNumber := 23;
		strcpy( ADR(P74FaultTable[19].FaultDescription), ADR('SCF1 - Motor Short Circuit') );
	
		P74FaultTable[20].FaultNumber := 24;
		strcpy( ADR(P74FaultTable[20].FaultDescription), ADR('SOF - Overspeed') );
	
		P74FaultTable[21].FaultNumber := 25;
		strcpy( ADR(P74FaultTable[21].FaultDescription), ADR('tnF - Auto-tuning Unsuccessful') );
	
		P74FaultTable[22].FaultNumber := 26;
		strcpy( ADR(P74FaultTable[22].FaultDescription), ADR('InF1 - Rating Error') );
	
		P74FaultTable[23].FaultNumber := 27;
		strcpy( ADR(P74FaultTable[23].FaultDescription), ADR('InF2 - Power Calibration') );
	
		P74FaultTable[24].FaultNumber := 28;
		strcpy( ADR(P74FaultTable[24].FaultDescription), ADR('InF3 - Internal Serial Link') );
	
		P74FaultTable[25].FaultNumber := 29;
		strcpy( ADR(P74FaultTable[25].FaultDescription), ADR('InF4 - Internal Mfg Area') );
	
		P74FaultTable[26].FaultNumber := 30;
		strcpy( ADR(P74FaultTable[26].FaultDescription), ADR('EEF2 - Power EEPROM') );
	
		P74FaultTable[27].FaultNumber := 31;
		strcpy( ADR(P74FaultTable[27].FaultDescription), ADR('SCF2 - Impedant Short Circuit') );
	
		P74FaultTable[28].FaultNumber := 32;
		strcpy( ADR(P74FaultTable[28].FaultDescription), ADR('SCF3 - Ground Short Circuit') );
	
		P74FaultTable[29].FaultNumber := 33;
		strcpy( ADR(P74FaultTable[29].FaultDescription), ADR('OPF2 - 3 Phase Output Loss') );
	
		P74FaultTable[30].FaultNumber := 34;
		strcpy( ADR(P74FaultTable[30].FaultDescription), ADR('COF - Powerlink Communication') );
	
		P74FaultTable[31].FaultNumber := 35;
		strcpy( ADR(P74FaultTable[31].FaultDescription), ADR('bLF - Brake Control') );

		P74FaultTable[32].FaultNumber := 38;
		strcpy( ADR(P74FaultTable[32].FaultDescription), ADR('EPF2 - External Fault Com.') );

		P74FaultTable[33].FaultNumber := 41;
		strcpy( ADR(P74FaultTable[33].FaultDescription), ADR('brF - Brake Feedback') );
	
		P74FaultTable[34].FaultNumber := 42;
		strcpy( ADR(P74FaultTable[34].FaultDescription), ADR('SLF2 - PowerSuite Communication.') );
	
		P74FaultTable[35].FaultNumber := 43;
		strcpy( ADR(P74FaultTable[35].FaultDescription), ADR('ECF - Encoder Coupling') );
	
		P74FaultTable[36].FaultNumber := 44;
		strcpy( ADR(P74FaultTable[36].FaultDescription), ADR('SSF - Torque Current Limit') );
	
		P74FaultTable[37].FaultNumber := 45 ;
		strcpy( ADR(P74FaultTable[37].FaultDescription), ADR('SLF3 - HMI com.') );
	
		P74FaultTable[38].FaultNumber := 46;
		strcpy( ADR(P74FaultTable[38].FaultDescription), ADR('PrF - Power Removal') );

		P74FaultTable[39].FaultNumber := 49;
		strcpy( ADR(P74FaultTable[39].FaultDescription), ADR('PtFL - LI6=PTC Probe') );
	
		P74FaultTable[40].FaultNumber := 50;
		strcpy( ADR(P74FaultTable[40].FaultDescription), ADR('OtFL - PTC Fault') );
	
		P74FaultTable[41].FaultNumber := 51;
		strcpy( ADR(P74FaultTable[41].FaultDescription), ADR('InF9 - Internal I measure') );
	
		P74FaultTable[42].FaultNumber := 52;
		strcpy( ADR(P74FaultTable[42].FaultDescription), ADR('InFA - Internal Mains Circuit') );
	
		P74FaultTable[43].FaultNumber := 53;
		strcpy( ADR(P74FaultTable[43].FaultDescription), ADR('InFb - Internal th. Sensor') );
	
		P74FaultTable[44].FaultNumber := 54;
		strcpy( ADR(P74FaultTable[44].FaultDescription), ADR('tJF - IGBT Overheat') );
	
		P74FaultTable[45].FaultNumber := 55;
		strcpy( ADR(P74FaultTable[45].FaultDescription), ADR('SCF4 - IGBT Short Circuit') );
	
		P74FaultTable[46].FaultNumber := 56;
		strcpy( ADR(P74FaultTable[46].FaultDescription), ADR('SCF5 - Motor Short Circuit') );
	
		P74FaultTable[47].FaultNumber := 57 ;
		strcpy( ADR(P74FaultTable[47].FaultDescription), ADR('SrF - Torque Time-out') );
	
		P74FaultTable[48].FaultNumber := 58;
		strcpy( ADR(P74FaultTable[48].FaultDescription), ADR('FCF1 - Output Contact Stuck') );
	
		P74FaultTable[49].FaultNumber := 59;
		strcpy( ADR(P74FaultTable[49].FaultDescription), ADR('FCF2 - Output Contact Open') );
	
		P74FaultTable[50].FaultNumber := 61;
		strcpy( ADR(P74FaultTable[50].FaultDescription), ADR('AI2F - AI2 Input') );
	
		P74FaultTable[51].FaultNumber := 64;
		strcpy( ADR(P74FaultTable[51].FaultDescription), ADR('LCF - Input Contactor') );
	
		P74FaultTable[52].FaultNumber := 66;
		strcpy( ADR(P74FaultTable[52].FaultDescription), ADR('dCF - Iff. I Fault') );
	
		P74FaultTable[53].FaultNumber := 67;
		strcpy( ADR(P74FaultTable[53].FaultDescription), ADR('HdF - IGBT  Desaturation') );
	
		P74FaultTable[54].FaultNumber := 68;
		strcpy( ADR(P74FaultTable[54].FaultDescription), ADR('InF6 - Internal Option') );
	
		P74FaultTable[55].FaultNumber := 69;
		strcpy( ADR(P74FaultTable[55].FaultDescription), ADR('InFE - Internal CPU') );
	
		P74FaultTable[56].FaultNumber := 71;
		strcpy( ADR(P74FaultTable[56].FaultDescription), ADR('LFF3 - AI3 4-20 mA Loss') );
	
		P74FaultTable[57].FaultNumber := 73;
		strcpy( ADR(P74FaultTable[57].FaultDescription), ADR('HCF - Cards Pairing') );
	
		P74FaultTable[58].FaultNumber := 76;
		strcpy( ADR(P74FaultTable[58].FaultDescription), ADR('dLF - Load Fault') );
	
		P74FaultTable[59].FaultNumber := 77;
		strcpy( ADR(P74FaultTable[59].FaultDescription), ADR('CFI2 - Bad Configuration') );
		
		P74FaultTable[60].FaultNumber := 99;
		strcpy( ADR(P74FaultTable[60].FaultDescription), ADR('CSF - Ch. SW. Fault') );
		
		P74FaultTable[61].FaultNumber := 100;
		strcpy( ADR(P74FaultTable[61].FaultDescription), ADR('ULF - Pr. Underload Fault') );
		
		P74FaultTable[62].FaultNumber := 101;
		strcpy( ADR(P74FaultTable[62].FaultDescription), ADR('OLC - Proc. Overload Fault') );
		
		P74FaultTable[63].FaultNumber := 105;
		strcpy( ADR(P74FaultTable[63].FaultDescription), ADR('ASF - Angle Error') );
		
		P74FaultTable[64].FaultNumber := 107;
		strcpy( ADR(P74FaultTable[64].FaultDescription), ADR('SAFF - Safety Fault') );
		
		P74FaultTable[65].FaultNumber := 108;
		strcpy( ADR(P74FaultTable[65].FaultDescription), ADR('FbE - FB Fault') );
		
		P74FaultTable[66].FaultNumber := 109;
		strcpy( ADR(P74FaultTable[66].FaultDescription), ADR('FbES - FB Stop Fault') );
	ELSE
        (*this status will only be seen if the initialization of the fualt text arrays fails*)
        Status := INACTIVE;
	END_IF	

	(* End of initializing the tables *)



	(*****************************************************
	Getting the Fault Text
	*****************************************************)
    IF isInitialized = TRUE THEN
        (* Do the search for a S44 drive *)
        IF (DriveType = EACPInverter_S44) THEN

            (*Cyclically write the internal previous fault number into the output variable LastFault*)
            LastFault := PreviousFault;

            IF Execute = TRUE THEN
                Status := BUSY;
                (* Only do a look up if a new fault number occured *)
                IF ( PreviousFault <> FaultNumber ) THEN
                    PreviousFault := FaultNumber;
		
                    (* Clear out the text in the fault string *)
                    strcpy(FaultText, ADR('') );
		
                    FOR i:= 0 TO 35 BY 1 DO
                        IF (FaultNumber = S44FaultTable[i].FaultNumber) THEN
                            strcpy(FaultText, ADR(S44FaultTable[i].FaultDescription) );
                            EXIT;
                        END_IF;
                    END_FOR;
                END_IF;	
            ELSE
                Status := IDLE;
            END_IF;
            (* Do the search for a X64 drive *)
        ELSIF (DriveType = EACPInverter_X64) THEN

            (*Cyclically write the internal previous fault number into the output variable LastFault*)
            LastFault := PreviousFault;

            IF Execute = TRUE THEN
                Status := BUSY;
                (* Only do a look up if a new fault number occured *)
                IF ( PreviousFault <> FaultNumber ) THEN
                    PreviousFault := FaultNumber;
		
                    (* Clear out the text in the fault string *)
                    strcpy(FaultText, ADR('') );
		
                    FOR i:= 0 TO 31 BY 1 DO
                        IF (FaultNumber = X64FaultTable[i].FaultNumber) THEN
                            strcpy(FaultText, ADR(X64FaultTable[i].FaultDescription) );
                            EXIT;
                        END_IF;
                    END_FOR;
                END_IF;
            ELSE
                Status := IDLE;
            END_IF;
	
            (* Do the search for a P84 drive *)
        ELSIF (DriveType = EACPInverter_P84) THEN

            (*Cyclically write the internal previous fault number into the output variable LastFault*)
            LastFault := PreviousFault;

            IF Execute = TRUE THEN
                Status := BUSY;
                (* Only do a look up if a new fault number occured *)
                IF ( PreviousFault <> FaultNumber ) THEN
                    PreviousFault := FaultNumber;
		
                    (* Clear out the text in the fault string *)
                    strcpy(FaultText, ADR('') );
		
                    FOR i:= 0 TO 74 BY 1 DO
                        IF (FaultNumber = P84FaultTable[i].FaultNumber) THEN
                            strcpy(FaultText, ADR(P84FaultTable[i].FaultDescription) );
                            EXIT;
                        END_IF;
                    END_FOR;
                END_IF;	
            ELSE
                Status := IDLE;
            END_IF;
			
        ELSIF (DriveType = EACPInverter_P74) THEN
            
            (*Cyclically write the internal previous fault number into the output variable LastFault*)
            LastFault := PreviousFault;

            IF Execute = TRUE THEN
                Status := BUSY;
                (* Only do a look up if a new fault number occured *)
                IF ( PreviousFault <> FaultNumber ) THEN
                    PreviousFault := FaultNumber;
		
                    (* Clear out the text in the fault string *)
                    strcpy(FaultText, ADR('') );
		
                    FOR i:= 0 TO 66 BY 1 DO
                        IF (FaultNumber = P74FaultTable[i].FaultNumber) THEN
                            strcpy(FaultText, ADR(P74FaultTable[i].FaultDescription) );
                            EXIT;
                        END_IF	;	
                    END_FOR	;
                END_IF;
            ELSE
                Status := IDLE;
            END_IF;
		
        END_IF;
    END_IF;

END_FUNCTION_BLOCK


