(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Library: InvErrTxt
 * File: InvErrTxt.fun
 * Author: scoccimaroj
 * Created: November 09, 2010
 ********************************************************************
 * Functions and function blocks of library InvErrTxt
 ********************************************************************)

FUNCTION_BLOCK InverterFaultText
	VAR_INPUT
		Execute : BOOL; (*When TRUE, the error code is read and a matching error text is displayed. Should be tied to a drive faulted boolean*)
		DriveType : EACPInverterType_enum; (*The type of acopos inverter being used.*)
		FaultText : UDINT; (*The address of the string to write the error message to. String must be atleast 64 characters long.*)
		FaultNumber : REFERENCE TO INT; (*Fault number to decode. Given as an address*)
	END_VAR
	VAR_OUTPUT
		Status : InvErrTxtStatus_enum; (*Status of the function block. Read from an enum defined in the typ file of this library*)
		LastFault : INT; (*Output variable for displaying the last fault that was detected on the drive*)
	END_VAR
	VAR
		isInitialized : BOOL; (*Internal Variable.*)
		S44FaultTable : ARRAY[0..35] OF ACPInverterFaultText_typ; (*Internal Variable. Holds S44 fault info.*)
		X64FaultTable : ARRAY[0..31] OF ACPInverterFaultText_typ; (*Internal Variable. Holds X64 fault info.*)
		P84FaultTable : ARRAY[0..74] OF ACPInverterFaultText_typ; (*Internal Variable. Holds P84 fault info.*)
		P74FaultTable : ARRAY[0..66] OF ACPInverterFaultText_typ; (*Internal Variable. Holds P74 fault info.*)
		PreviousFault : INT; (*Internal Variable. Holds the previous fault passed in.*)
		i : USINT; (*Internal Variable.*)
	END_VAR
END_FUNCTION_BLOCK
