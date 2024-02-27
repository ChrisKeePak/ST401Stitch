(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Library: InvErrTxt
 * File: InvErrTxt.typ
 * Author: scoccimaroj
 * Created: November 09, 2010
 ********************************************************************
 * Data types of library InvErrTxt
 ********************************************************************)

TYPE
	ACPInverterFaultText_typ : 	STRUCT  (*structure definition for the input types to the FUB*)
		FaultNumber : INT; (*variable definition for the input passed into the FUB that identifies which element in the error text array is to be displayed*)
		FaultDescription : STRING[64]; (*variable definition for the input passed into the FUB that displays the string text of the fault error text of the drive fault*)
	END_STRUCT;
	EACPInverterType_enum : 
		( (*enumeration definition for the selection of the inverter drive types available for use with this FUB*)
		EACPInverter_S44 := 0, (*enum member definition for the S44 inverter*)
		EACPInverter_X64 := 1, (*enum member definition for the X64 inverter*)
		EACPInverter_P84 := 2, (*enum member definition for the P84 inverter*)
		EACPInverter_P74 := 3 (*enum member definition for the P74 inverter*)
		);
	InvErrTxtStatus_enum : 
		( (*enumeration definition for the output of the FUB to display the current status of the FUB*)
		INACTIVE := 0, (*enum member definition for when the FUB is inactive, occurs prior to the error text initialization status*)
		INITIALIZING_ERROR_TEXT := 1, (*enum member definition for when the FUB is intitializing the error text, only runs once at start up*)
		IDLE := 2, (*enum member definition for when the FUB is idle while waiting for a fault to occur*)
		BUSY := 3, (*enum member definition for when the FUB is busy processing the fault number to get the fault description*)
		ERROR := 4 (*enum member definition for when the FUB is in error  ***not connected****)
		);
END_TYPE
