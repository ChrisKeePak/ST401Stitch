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
	CommStateEnum : 
		(
		PATLITE_STATE_STANDBY,
		PATLITE_STATE_WRITE_REGISTER,
		PATLITE_STATE_ERROR
		);
	GroupEnum : 
		(
		GROUP_1_POWER_ON,
		GROUP_2_HEATING,
		GROUP_3_HEAT_AIR_OK,
		GROUP_4_RUN,
		GROUP_5_SAFETY
		);
END_TYPE
