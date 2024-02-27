
#include <bur/plctypes.h>
#include "string.h"

#ifdef __cplusplus
	extern "C"
	{
#endif
#include "AxisFUBs.h"
#ifdef __cplusplus
	};
#endif
/* Implements state machine for single axis handling */
void AxisHandler(struct AxisHandler* t)
{
	
	if(t->AlarmActive == 1) {
		t->state = AXIS_STATE_ERROR;
	}
	
	//force these off. State machine will set them if jog is requested and state allows it
	t->pInterface->Commands.ToMapp.JogNeg = 0;
	t->pInterface->Commands.ToMapp.JogPos = 0;
	t->pInterface->Parameters.MovementParameters.Deceleration = t->pInterface->Parameters.MovementParameters.Acceleration;
	
	t->pInterface->Parameters.MovementParameters.Jog.LowerLimit = 0;
	
	t->DriveReadyTimeout.IN = 0; //will be set true in appropriate state(s)

	//	switch (t->axisInitState){		
	//		//init the axis/drive	
	//		case AXIS_INIT_TRANSFER_PARS:
	//		
	//		//	strcpy((char*)&t->pInterface->Status.AxisState, "Loading Axis Parameters");
	//			
	//		//	if(t->pSystemInterface->Status.DefaultRecipeLoaded == 1) //axis parameters should be part of the recipe system and are only 'good' once recipe system has loaded the values
	//			if(1)
	//			{
	//				//unclear if axis parameters will become part of the recipe system, so just continue on for now - jdl
	////				t->pInterface->Commands.ToMapp.SaveConfig = 1;
	////				
	////				if(t->pInterface->Status.ConfigCommandDone){
	////					t->pInterface->Commands.ToMapp.SaveConfig = 0;
	////				}		
	//				
	//				t->axisInitState = AXIS_INIT_RETRIEVE_PARS;
	//			}		
	//			break;
	//		
	//		//Get mapp config parameters. These should ideally come from the recipe system
	//		case AXIS_INIT_RETRIEVE_PARS:
	//			
	//		//	strcpy((char*)&t->pInterface->Status.AxisState, "Retrieving Axis Parameters");
	//			
	//			t->pInterface->Commands.ToMapp.LoadConfig = 1;
	//		
	//			if(t->pInterface->Status.ConfigCommandDone){
	//				t->pInterface->Commands.ToMapp.LoadConfig = 0;
	//				t->axisInitState = AXIS_INIT_WAIT_FOR_INIT;
	//			}
	//			break;
	//		
	//		//Get mapp config parameters. These should ideally come from the recipe system
	//		case AXIS_INIT_WAIT_FOR_INIT:
	//			
	//			//	strcpy((char*)&t->pInterface->Status.AxisState, "Retrieving Axis Parameters");
	//		
	//			t->pInterface->Commands.ToMapp.Update = 1;
	//			
	//			if(t->pInterface->Status.AxisInitialized){
	//				t->axisInitState = AXIS_INIT_DONE;
	//			}
	//			break;
	//		
	//		case AXIS_INIT_DONE:
	//			if(t->pInterface->Commands.Init){
	//				t->pInterface->Commands.Init = 0;
	//				t->axisInitState = AXIS_INIT_TRANSFER_PARS;
	//			}
	//	}
	
	switch (t->state)
	{		
		case AXIS_STATE_INIT:
			
			if (t->pInterface->Status.AxisBasicActive) {
				
				//force parameter save to the drive. values are set in init code of motion handler
				t->pInterface->Commands.ToMapp.SaveConfig = 1;
								
				if(t->pInterface->Status.ConfigCommandDone){
					t->pInterface->Commands.ToMapp.SaveConfig = 0;
					t->pInterface->Commands.ToMapp.Update = 0;
				}		
				t->state = AXIS_STATE_POWERON_PREP;
			}
			break;
		
		//we need at least one scan where the power on command is 0. handles cases where the power on command is always true and the machine can't power on.
		case AXIS_STATE_POWERON_PREP:
			
			t->pInterface->Commands.ToMapp.Update = 1;
			
			if (t->pInterface->Status.AxisInitialized) {	
				t->pInterface->Commands.ToMapp.Power = 0;
				t->state = AXIS_STATE_POWERON;
			}
			break;
		
		//power on the Drive
		case AXIS_STATE_POWERON:
			
			strcpy((char*)&t->pInterface->Status.AxisState, "Powering On");
			t->DriveReadyTimeout.IN = 1; //will be cleared outside of state machine
			
			if ((t->pInterface->Status.ReadyToPowerOn) || (t->DriveReadyTimeout.Q))  //Issue the power on command if drives do not become ready with in time out.  The drive will then post an alarm to explain why it won't power on.
			{
				t->DriveReadyTimeout.IN = 0;
				t->pInterface->Commands.ToMapp.Power = 1;
				
				if(t->pInterface->Status.PoweredOn) 
				{
					t->state = AXIS_STATE_HOME;
				}
			}
			break;
		
		//On start up, home the axis
		case AXIS_STATE_HOME:
			
			strcpy((char*)&t->pInterface->Status.AxisState, "Waiting To Start Home");
			
			if(t->pInterface->Status.ReadyToPowerOn == 1)
			{
				if((*t->FirstHomeExecuted == 0) || (!t->pInterface->Status.Homed))
				{	
					//if system is simulated or the home mode is direct home, just direct home
					if((t->IsSimulated) || (t->pHomingParameters->Mode == mpAXIS_HOME_MODE_DIRECT)) {
					//if(t->IsSimulated) {
					t->pInterface->Parameters.MovementParameters.Home.Position = 0;
					t->pInterface->Parameters.MovementParameters.Home.SensorOffset = 0;
					t->pInterface->Parameters.MovementParameters.Home.Mode = mpAXIS_HOME_MODE_DIRECT;
						
					t->pInterface->Commands.RequestHome = 0;
					t->pInterface->Commands.ToMapp.Home = 1;
					t->state = AXIS_STATE_W_HOME;
					}
					else if(t->pInterface->Commands.RequestHome) //Otherwise execute set home routine
					{
					memcpy(&t->pInterface->Parameters.MovementParameters.Home, t->pHomingParameters, sizeof(t->pInterface->Parameters.MovementParameters.Home));
						
					t->pInterface->Commands.RequestHome = 0;
					t->pInterface->Commands.ToMapp.Home = 1;
					t->state = AXIS_STATE_W_HOME;
					}
				}
					//				else if(!t->pInterface->Status.Homed) //got to this state with a good stored position but we aren't homed, so recall the position
					//				{	
					//					t->pInterface->Parameters.MovementParameters.Home.SensorOffset = 0;
					//					t->pInterface->Parameters.MovementParameters.Home.Mode = mpAXIS_HOME_MODE_RESTORE_POS;					
					//					t->pInterface->Commands.ToMapp.Home = 1;
					//					t->state = AXIS_STATE_W_HOME;
					//				}
				else if(t->pInterface->Status.Homed) //got to this state without requesting home, and we're already homed. Probably recovering from error, just go to idle
				{	
					t->state = AXIS_STATE_IDLE;
				}
			}
			break;
		
		// wait for home to finish
		case AXIS_STATE_W_HOME:
			
			strcpy((char*)&t->pInterface->Status.AxisState, "Homing");
			
			if(t->pInterface->Status.Homed)
			{
				t->pInterface->Commands.ToMapp.Home = 0;
				*t->FirstHomeExecuted = 1; //a home has been completed successfully, we do not need the home routine again
				t->state = AXIS_STATE_IDLE;
			}
			break;
	
		//Idle state. Ready to receive commands for commands
		case AXIS_STATE_IDLE:
			
			strcpy((char*)&t->pInterface->Status.AxisState, "Idle");
			
			if(t->pInterface->Commands.RequestHome == 1)
			{
				*t->FirstHomeExecuted = 0;
				t->state = AXIS_STATE_HOME;
			}
			else if(t->pInterface->Commands.RequestMoveAbs == 1)
			{	
				t->pInterface->Commands.RequestMoveAbs = 0;
				t->pInterface->Commands.ToMapp.MoveAbs = 1;
				t->state = AXIS_STATE_MOVE;
			}
			else if(t->pInterface->Commands.RequestMoveAdditive == 1)
			{	
				t->pInterface->Commands.RequestMoveAdditive = 0;
				t->pInterface->Commands.ToMapp.MoveAdditive = 1;
				t->state = AXIS_STATE_MOVE;
			}		
			else if(t->pInterface->Commands.RequestMoveVelocity == 1)
			{	
				t->pInterface->Commands.ToMapp.MoveVelocity = 1;
				t->state = AXIS_STATE_MOVE_VELOCITY;
			}	
			else if(t->pInterface->Commands.RequestJogNeg)
			{
				t->pInterface->Commands.ToMapp.JogNeg = 1;
			} 		
			else if(t->pInterface->Commands.RequestJogPos)
			{
				t->pInterface->Commands.ToMapp.JogPos = 1;
			} 
			else if(t->pInterface->Commands.RequestCoupleToMaster)
			{
				t->pInterface->Commands.ToMapp.CoupleToMaster = 1;
				t->state = AXIS_STATE_W_COUPLE;
			} 
			break;		
	
		case AXIS_STATE_MOVE:
			
			strcpy((char*)&t->pInterface->Status.AxisState, "In Motion");
			
			if((t->pInterface->Status.InPosition == 1) && (t->pInterface->Status.MappCommandBusy == 0)){
				t->pInterface->Status.MoveComplete = 1;
				t->pInterface->Commands.ToMapp.MoveAbs = 0;
				t->pInterface->Commands.ToMapp.MoveAdditive = 0;
				t->state = AXIS_STATE_IDLE;
			}
			break;
		
		case AXIS_STATE_MOVE_VELOCITY:
			
			strcpy((char*)&t->pInterface->Status.AxisState, "In Velocity");
			
			if(t->pInterface->Commands.RequestMoveVelocity == 0){
				t->pInterface->Commands.ToMapp.MoveVelocity = 0;
				t->state = AXIS_STATE_IDLE;
			}
			
			break;
		
		case AXIS_STATE_W_COUPLE:
			
			strcpy((char*)&t->pInterface->Status.AxisState, "Waiting To Couple To Master");
			
			if(t->pInterface->Status.InSync){
				t->state = AXIS_STATE_COUPLED;
			}
			
			break;
		
		case AXIS_STATE_COUPLED:
			
			strcpy((char*)&t->pInterface->Status.AxisState, "Coupled To Master");
			
			if(!(t->pInterface->Commands.RequestCoupleToMaster)){
				t->pInterface->Commands.ToMapp.CoupleToMaster = 0;
			
				if(!(t->pInterface->Status.InSync)){
					t->state = AXIS_STATE_IDLE;
				}
			}
			break;
		
		//Error state. handle errors and return to idle when errors are no longer present
		case AXIS_STATE_ERROR:
			
			strcpy((char*)&t->pInterface->Status.AxisState, "Machine In Error");
			
			t->pInterface->Commands.ToMapp.Home = 0;
			t->pInterface->Commands.Init = 0;
			t->pInterface->Commands.RequestJogNeg = 0;
			t->pInterface->Commands.RequestJogPos = 0;
			t->pInterface->Commands.RequestMoveAbs = 0;
			t->pInterface->Commands.RequestMoveAdditive = 0;
			t->pInterface->Commands.RequestHome = 0;
			t->pInterface->Commands.RequestCoupleToMaster = 0;
			t->pInterface->Commands.RequestMoveVelocity = 0;
			t->pInterface->Commands.ToMapp.JogNeg = 0;
			t->pInterface->Commands.ToMapp.JogPos = 0;
			t->pInterface->Commands.ToMapp.Home = 0;
			t->pInterface->Commands.ToMapp.MoveAbs = 0;
			t->pInterface->Commands.ToMapp.MoveVelocity = 0;
			t->pInterface->Commands.ToMapp.MoveAdditive = 0;
			t->pInterface->Commands.MoveVelocityTrigStop = 0;
			t->pInterface->Commands.ToMapp.CoupleToMaster = 0;
			t->pInterface->Commands.ToMapp.SaveConfig = 1;
			
			if(t->pInterface->Status.InMotion == 0){
				t->pInterface->Commands.ToMapp.Power = 0;	
			}
			
			if(t->AlarmActive == 0)
			{
				//t->state = AXIS_STATE_INIT;
				t->state = 0; //go to whatever state 0 is for now. appropriate state should probably depend on how far we got through init process
			}
			
			break;
	}
	
	//handle drive time out because it will not become ready
	t->DriveReadyTimeout.PT = 20000;  //wait 20 seconds for drive to become ready before timing out.
	TON(&t->DriveReadyTimeout);
}
