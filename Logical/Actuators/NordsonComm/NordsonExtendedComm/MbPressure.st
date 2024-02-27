(*********************************************************************************
 * Copyright: B&R Industrial Automation GmbH 
 * Author:    nealj 
 * Created:   May 27, 2021/1:33 PM 
 * This task will cyclicly read the current pressure and the tank level and will 
 * write the pressure setpoints.
 *********************************************************************************)

PROGRAM _INIT
	
    Station              := 'IF2.ST2';
    ModbusRead.pStation  := ADR(Station);
    ModbusWrite.pStation := ADR(Station);
	
END_PROGRAM

PROGRAM _CYCLIC
	
    Channel.PressureSetpoint := PressureSetpoint;
	
    CASE ExtendedCommsState OF
		
        WORD_MANIPULATION:
            Channel.ActualPressure           := (UDINT_TO_REAL(Registers.ChannelActualPressureWord) / 1000);
            Tank.ActualLevel                    := Registers.TankActualLevelWord;
            Registers.ChannelSetPressureWord := REAL_TO_UDINT(Channel.PressureSetpoint * 1000);            
            ExtendedCommsState                  := READ_ACTPRESS_W1;
			
        READ_ACTPRESS_W1:
            IF (ModbusRead.status = ERR_OK) THEN
                ModbusRead.enable  := FALSE;
                ExtendedCommsState := WRITE_SETPRESS_W1;
            ELSIF (ModbusRead.status = ERR_FUB_ENABLE_FALSE) THEN
                ModbusRead.startAddress := 6103;
                ModbusRead.nrRegisters  := 2;
                ModbusRead.pData        := ADR(Registers.ChannelActualPressureWord);
                ModbusRead.dataSize     := 8;
                ModbusRead.enable       := TRUE;
            END_IF
			
        WRITE_SETPRESS_W1:
            IF (ModbusWrite.status = ERR_OK) THEN
                ModbusWrite.enable  := FALSE;
                ExtendedCommsState := READ_TANKLEVEL_W1;
            ELSIF (ModbusRead.status = ERR_FUB_ENABLE_FALSE) AND (WriteFlag) THEN
                ModbusWrite.startAddress := 6203;
                ModbusWrite.nrRegisters  := 2;
                ModbusWrite.pData        := ADR(Registers.ChannelSetPressureWord);
                ModbusWrite.dataSize     := 8;
                ModbusWrite.enable       := TRUE;
                WriteFlag              := FALSE;
            ELSIF (ModbusWrite.status = ERR_FUB_ENABLE_FALSE) AND NOT(WriteFlag) THEN
                ExtendedCommsState := READ_TANKLEVEL_W1;
            END_IF
            						
        READ_TANKLEVEL_W1:
            IF (ModbusRead.status = ERR_OK) THEN
                ModbusRead.enable := FALSE;
                ExtendedCommsState := WORD_MANIPULATION;
            ELSIF (ModbusWrite.status = ERR_FUB_ENABLE_FALSE) THEN
                ModbusRead.startAddress := 13002;
                ModbusRead.nrRegisters  := 1;
                ModbusRead.pData        := ADR(Registers.TankActualLevelWord);
                ModbusRead.dataSize     := 4;
                ModbusRead.enable       := TRUE;
            END_IF
			
        MODBUS_ERROR:
            IF ((ModbusRead.status = ERR_FUB_ENABLE_FALSE) AND (ModbusWrite.status = ERR_FUB_ENABLE_FALSE)) THEN
                ExtendedCommsState := WORD_MANIPULATION;
            ELSE
                ReadErrorNumber    := ModbusRead.status;
                WriteErrorNumber   := ModbusWrite.status;
                ModbusRead.enable  := FALSE;
                ModbusWrite.enable := FALSE;
            END_IF
				
    END_CASE
	
    IF ((ModbusRead.status > 0) AND (ModbusRead.status < 65534)) OR ((ModbusWrite.status > 0) AND (ModbusWrite.status < 65534)) THEN
        ExtendedCommsState := MODBUS_ERROR;
    END_IF
	
    //Call FUBs
    ModbusRead();
    ModbusWrite();
	
END_PROGRAM

PROGRAM _EXIT
	
	 
END_PROGRAM

