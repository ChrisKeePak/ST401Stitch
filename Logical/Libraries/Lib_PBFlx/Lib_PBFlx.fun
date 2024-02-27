
{REDUND_OK} FUNCTION_BLOCK FB_NDSN_MB_PBFlex_CtrlSts (*ProblueFlex Function Block for ModbusTCP _Control& Status*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		IN_b_Enable : {REDUND_UNREPLICABLE} BOOL;
		IN_mb_station : STRING[30];
	END_VAR
	VAR_IN_OUT
		Melter : DUT_NDSN_Flex;
	END_VAR
	VAR
		IO_Input : ARRAY[0..63] OF UINT;
		IO_Output : ARRAY[0..63] OF UINT;
		tm_HeaterOff : TON;
		b_HeaterOff : BOOL;
		b_Temp1 : BOOL;
		b_Temp2 : BOOL;
		b_Temp3 : BOOL;
		b_Temp4 : BOOL;
		b_HeaterOn : BOOL;
		tm_HeaterOnStuck : TON;
		b_HeaterOnStuck : BOOL;
		tm_HeaterOffStuck : TON;
		b_HeaterOffStuck : BOOL;
		tm_PumpOff : TON;
		b_PumpOff : BOOL;
		tm_PumpOnStuck : TON;
		b_PumpOnStuck : BOOL;
		tm_PumpOffStuck : TON;
		b_PumpOffStuck : BOOL;
		tm_StandbyOff : TON;
		b_StandbyOff : BOOL;
		tm_StandbyOnStuck : TON;
		b_StandbyOnStuck : BOOL;
		tm_StandbyOffStuck : TON;
		b_StandbyOffStuck : BOOL;
		b_Temp5 : BOOL;
		b_Temp6 : BOOL;
		b_StandbyOn : BOOL;
		b_PumpOn : BOOL;
		tm_Command : TON;
		b_CommandTimerRising : BOOL;
		b_Init : BOOL;
		tm_Acyc : TON;
		b_read : BOOL;
		ui_AcycRdStatus : UINT;
		i : INT;
		FB_AcycWrite : mbWriteMultipleRegisters;
		FB_AcycRead : mbReadHoldingRegisters;
		ui_AcycWtStatus : UINT;
		i_StartAddressOutput : INT;
		i_StartAddressInput : INT;
		i_datasize : INT;
		i_nrRegisters : UINT;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_OK} FUNCTION_BLOCK FB_NDSN_MB_PBFlex_Process (*ProblueFlex Function Block for ModbusTCP _Process*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		IN_b_Enable : {REDUND_UNREPLICABLE} BOOL;
		IN_mb_station : STRING[30];
	END_VAR
	VAR_IN_OUT
		Melter : DUT_NDSN_Flex;
	END_VAR
	VAR
		IO_Input : ARRAY[0..63] OF UINT;
		IO_Output : ARRAY[0..63] OF UINT;
		b_Init : BOOL;
		tm_Acyc : TON;
		b_read : BOOL;
		st_ADI_List : ARRAY[0..49] OF DUT_NDSN_ADI;
		b_AcycRD_Enable : BOOL;
		b_AcycRD_Done : BOOL;
		b_AcycRD_Tick : BOOL;
		ui_AcycRdStatus_Para : UINT;
		ui_AcycRdStatus : UINT;
		b_AcycRdDnRising : BOOL;
		i : INT;
		arr_ResponseValue : ARRAY[0..17] OF UINT;
		i_ValueIndex : INT;
		i_rwDataSize : INT := 70;
		arr_HMI : ARRAY[0..119] OF UINT;
		arr_HMI_Buffer : ARRAY[0..69] OF UINT;
		arr_HMI_Compare : ARRAY[0..69] OF UINT;
		b_WriteEvent : BOOL;
		arr_WriteIndex : ARRAY[0..30] OF INT;
		i_rwADI_Count : INT := 30;
		i_ADI_Range : INT;
		FB_AcycWrite : mbWriteMultipleRegisters;
		FB_AcycRead_Para : mbReadHoldingRegisters;
		i_ADI_Size : INT := 40;
		i_Index : INT;
		i_Index_Write : INT;
		arr_WriteStartingAddress : ARRAY[0..31] OF INT;
		i_ADI : INT;
		di_Press : UDINT;
		di_Press_psi : UDINT;
		r_Press : REAL;
		r_PressConvert : REAL;
		arr_i_DW_Temp : ARRAY[0..1] OF UINT;
		arr_di_Press_psi : ARRAY[0..1] OF UINT;
		tm_WriteEvent : TON;
		i_CompareIndex : INT;
		b_AcycWT_Done : BOOL;
		b_WriteEventONS : BOOL;
		i_writesize : INT;
		i_arr_WriteBuffer : ARRAY[0..17] OF INT;
		i_Size : INT;
		i_SizeofStruct : INT := 236;
		b_Temp2 : BOOL;
		b_AcycWT_DN_Rising : BOOL;
		b_AcycWT_Start : BOOL;
		b_AcycWT_Rising : BOOL;
		ui_AcycWtStatus : UINT;
		i_wttest : UINT;
		b_AcycWTDnRising : BOOL;
		b_test : BOOL;
		i_StartAddressOutput : INT;
		i_StartAddressInput : INT;
		i_datasize : INT;
		ui_Compare : UINT;
		ui_Ctrl : UINT;
		b_temp1 : BOOL;
		b_Compare : BOOL;
		tm_Compare : TON;
		i_test : INT;
		i_nrRegisters : UINT;
	END_VAR
END_FUNCTION_BLOCK
