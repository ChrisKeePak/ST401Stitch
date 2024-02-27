(********************************************************************
 * COPYRIGHT -- Bernecker + Rainer
 ********************************************************************
 * Program: MbApp
 * File: MbApp.typ
 * Author: Bernecker + Rainer
 * Created: October 22, 2009
 ********************************************************************
 * Local data types of program MbApp
 ********************************************************************)

TYPE
	ModbusTCP_Handling_States_enum : 
		(
		MB_IDLE := 0,
		MB_REQUEST_SET_TEMPS,
		MB_READ_SET_TEMPS,
		MB_REQUEST_ACT_TEMPS,
		MB_READ_ACT_TEMPS,
		MB_REQUEST_MELTER_STATUS,
		MB_READ_MELTER_STATUS,
		MB_REQUEST_ADH_USE,
		MB_READ_ADH_USE,
		MB_WRITE_REGISTERS,
		MB_READ_REGISTERS,
		MB_REQUEST_MACHINE_STATUS,
		MB_WRITE_SET_TEMP,
		MB_VERIFY_SET_TEMP_WRITE,
		MB_REQUEST_ATS_ALARMS,
		MB_READ_ATS_ALARMS,
		MB_ERROR := 999
		);
END_TYPE
