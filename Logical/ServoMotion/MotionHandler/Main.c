
#include <bur/plctypes.h>

#ifdef _DEFAULT_INCLUDES
#include <AsDefault.h>
#endif

/**
* This task:
*
* Populates homing and coupling defaults for each axis
* Instantiates axis control state machines for each axis
* 
*
*/ 

void _INIT ProgramInit(void)
{
	
	gHomingParameters.ServoRam.Mode = mpAXIS_HOME_MODE_BLOCK_DS; //Servo Ram homes to hard stop
	gHomingParameters.ServoRam.BlockDetectionPositionError = 1.5;
	gHomingParameters.ServoRam.PositionErrorStopLimit = 2.0;
	gHomingParameters.ServoRam.StartDirection = mpAXIS_HOME_DIR_NEGATIVE;
	gHomingParameters.ServoRam.HomingDirection = mpAXIS_HOME_DIR_POSITIVE;
	gHomingParameters.ServoRam.StartVelocity = 10; 
	gHomingParameters.ServoRam.HomingVelocity = 5;
	gHomingParameters.ServoRam.Position = -12.5;
	gHomingParameters.ServoRam.SensorOffset = 12.5; //back off switch by 12.5 mm and call that position home
	gHomingParameters.ServoRam.TorqueLimit = 2.0;
	
	
	gHomingParameters.ServoFeed.Mode = mpAXIS_HOME_MODE_DIRECT;
	gHomingParameters.ServoFeed.StartDirection = mpAXIS_HOME_DIR_NEGATIVE;
	gHomingParameters.ServoFeed.HomingDirection = mpAXIS_HOME_DIR_POSITIVE;
	gHomingParameters.ServoFeed.Position = 0;
	gHomingParameters.ServoFeed.SensorOffset = 0;
	
	
	
	gHomingParameters.ServoHopper.Mode = mpAXIS_HOME_MODE_DIRECT;
	gHomingParameters.ServoHopper.StartDirection = mpAXIS_HOME_DIR_NEGATIVE;
	gHomingParameters.ServoHopper.HomingDirection = mpAXIS_HOME_DIR_POSITIVE;
	gHomingParameters.ServoHopper.Position = 0;
	gHomingParameters.ServoHopper.SensorOffset = 0;
	
	ServoRamFirstHomeExecuted = 0; //THIS MUST ALWAYS BE SET TO FALSE. THIS IS A SINGLE TURN ENCODER
	ServoFeedFirstHomeExecuted = 0; //THIS MUST ALWAYS BE SET TO FALSE. THIS IS A SINGLE TURN ENCODER
	ServoHopperFirstHomeExecuted = 0; //THIS MUST ALWAYS BE SET TO FALSE. THIS IS A SINGLE TURN ENCODER
	
	
	//******* Start Axis and Drive Param Default Settings *******//
	
	//ram
	
	strcpy((char*)&gServoRamInterface.Parameters.AxisAndDrivePars.AxisName, "Ram");
	gServoRamInterface.Parameters.AxisAndDrivePars.Axis.BaseType = mpAXIS_LIMITED_LINEAR;
	gServoRamInterface.Parameters.AxisAndDrivePars.Axis.MeasurementUnit = mpAXIS_UNIT_MM;
	gServoRamInterface.Parameters.AxisAndDrivePars.Axis.MeasurementResolution = 0.01;
	gServoRamInterface.Parameters.AxisAndDrivePars.Axis.SoftwareLimitPositions.LowerLimit = 0;
	gServoRamInterface.Parameters.AxisAndDrivePars.Axis.SoftwareLimitPositions.UpperLimit = 550.0;
	gServoRamInterface.Parameters.AxisAndDrivePars.Axis.PeriodSettings.Period = 360;
	
	gServoRamInterface.Parameters.AxisAndDrivePars.Axis.MovementLimits.VelocityPositive = 1000.0;
	gServoRamInterface.Parameters.AxisAndDrivePars.Axis.MovementLimits.VelocityNegative = 1000.0;
	gServoRamInterface.Parameters.AxisAndDrivePars.Axis.MovementLimits.Acceleration = 5000.0;
	gServoRamInterface.Parameters.AxisAndDrivePars.Axis.MovementLimits.Deceleration = 5000.0;
	gServoRamInterface.Parameters.AxisAndDrivePars.Axis.MovementLimits.JerkTime = 0.0;
	gServoRamInterface.Parameters.AxisAndDrivePars.Axis.MovementLimits.PositionErrorStopLimit = 12;
	gServoRamInterface.Parameters.AxisAndDrivePars.Axis.MovementLimits.VelocityErrorStopLimit = 0.0;
	gServoRamInterface.Parameters.AxisAndDrivePars.Axis.MovementLimits.VelocityErrorStopLimitMode = mpAXIS_VEL_MODE_OFF;

	//gServoRamInterface.Parameters.AxisAndDrivePars.Axis.CyclicReadChannels.UserChannelParameterID = 214;
	
	gServoRamInterface.Parameters.AxisAndDrivePars.Drive.Gearbox.Input = 7;
	gServoRamInterface.Parameters.AxisAndDrivePars.Drive.Gearbox.Output = 1;
	gServoRamInterface.Parameters.AxisAndDrivePars.Drive.Gearbox.Direction = mpAXIS_DIR_CLOCKWISE;
	
	gServoRamInterface.Parameters.AxisAndDrivePars.Drive.Transformation.ReferenceDistance = 245.53333;
	
	//gServoRamInterface.Parameters.AxisAndDrivePars.Drive.Controller.Mode = mpAXIS_CTRL_MODE_POSITION_FF;
	gServoRamInterface.Parameters.AxisAndDrivePars.Drive.Controller.Mode = mpAXIS_CTRL_MODE_POSITION;
	gServoRamInterface.Parameters.AxisAndDrivePars.Drive.Controller.Position.ProportionalGain = 250.0;
	gServoRamInterface.Parameters.AxisAndDrivePars.Drive.Controller.Position.IntegralTime = 0.0;
	gServoRamInterface.Parameters.AxisAndDrivePars.Drive.Controller.Position.PredictionTime = 0.0004;
	gServoRamInterface.Parameters.AxisAndDrivePars.Drive.Controller.Position.TotalDelayTime = 0.0004;
	
	gServoRamInterface.Parameters.AxisAndDrivePars.Drive.Controller.Speed.ProportionalGain = 7.5;
	gServoRamInterface.Parameters.AxisAndDrivePars.Drive.Controller.Speed.IntegralTime = 0.1;
	gServoRamInterface.Parameters.AxisAndDrivePars.Drive.Controller.Speed.FilterTime = 0.0;
	
	//these values are only used if controller mode is set to position + feed forward
	gServoRamInterface.Parameters.AxisAndDrivePars.Drive.Controller.FeedForward.TorqueLoad = 0.0;
	gServoRamInterface.Parameters.AxisAndDrivePars.Drive.Controller.FeedForward.TorquePositive = 0.0;
	gServoRamInterface.Parameters.AxisAndDrivePars.Drive.Controller.FeedForward.TorqueNegative = 0.0;
	gServoRamInterface.Parameters.AxisAndDrivePars.Drive.Controller.FeedForward.SpeedTorqueFactor = 0.0;
	gServoRamInterface.Parameters.AxisAndDrivePars.Drive.Controller.FeedForward.Inertia = 0.0;
	gServoRamInterface.Parameters.AxisAndDrivePars.Drive.Controller.FeedForward.AccelerationFilterTime = 0.0;
	
	//feed
	
	strcpy((char*)&gServoFeedInterface.Parameters.AxisAndDrivePars.AxisName, "Feed");
	gServoFeedInterface.Parameters.AxisAndDrivePars.Axis.BaseType = mpAXIS_PERIODIC_ROTARY;
	gServoFeedInterface.Parameters.AxisAndDrivePars.Axis.MeasurementUnit = mpAXIS_UNIT_DEGREES;
	gServoFeedInterface.Parameters.AxisAndDrivePars.Axis.MeasurementResolution = 0.01;
	gServoFeedInterface.Parameters.AxisAndDrivePars.Axis.SoftwareLimitPositions.LowerLimit = 0;
	gServoFeedInterface.Parameters.AxisAndDrivePars.Axis.SoftwareLimitPositions.UpperLimit = 360.0;
	gServoFeedInterface.Parameters.AxisAndDrivePars.Axis.PeriodSettings.Period = 360.0;
	
	gServoFeedInterface.Parameters.AxisAndDrivePars.Axis.MovementLimits.VelocityPositive = 3600.0;
	gServoFeedInterface.Parameters.AxisAndDrivePars.Axis.MovementLimits.VelocityNegative = 3600.0;
	gServoFeedInterface.Parameters.AxisAndDrivePars.Axis.MovementLimits.Acceleration = 36000.0;
	gServoFeedInterface.Parameters.AxisAndDrivePars.Axis.MovementLimits.Deceleration = 36000.0;
	gServoFeedInterface.Parameters.AxisAndDrivePars.Axis.MovementLimits.JerkTime = 0.0;
	gServoFeedInterface.Parameters.AxisAndDrivePars.Axis.MovementLimits.PositionErrorStopLimit = 2;
	gServoFeedInterface.Parameters.AxisAndDrivePars.Axis.MovementLimits.VelocityErrorStopLimit = 0.0;
	gServoFeedInterface.Parameters.AxisAndDrivePars.Axis.MovementLimits.VelocityErrorStopLimitMode = mpAXIS_VEL_MODE_OFF;

	//gServoFeedInterface.Parameters.AxisAndDrivePars.Axis.CyclicReadChannels.UserChannelParameterID = 214;
	
	gServoFeedInterface.Parameters.AxisAndDrivePars.Drive.Gearbox.Input = 15;
	gServoFeedInterface.Parameters.AxisAndDrivePars.Drive.Gearbox.Output = 1;
	gServoFeedInterface.Parameters.AxisAndDrivePars.Drive.Gearbox.Direction = mpAXIS_DIR_COUNTERCLOCKWISE;
	
	gServoFeedInterface.Parameters.AxisAndDrivePars.Drive.Transformation.ReferenceDistance = 360.0;
	
	//gServoFeedInterface.Parameters.AxisAndDrivePars.Drive.Controller.Mode = mpAXIS_CTRL_MODE_POSITION_FF;
	gServoFeedInterface.Parameters.AxisAndDrivePars.Drive.Controller.Mode = mpAXIS_CTRL_MODE_POSITION;
	gServoFeedInterface.Parameters.AxisAndDrivePars.Drive.Controller.Position.ProportionalGain = 400.0;
	gServoFeedInterface.Parameters.AxisAndDrivePars.Drive.Controller.Position.IntegralTime = 0.0;
	gServoFeedInterface.Parameters.AxisAndDrivePars.Drive.Controller.Position.PredictionTime = 0.0004;
	gServoFeedInterface.Parameters.AxisAndDrivePars.Drive.Controller.Position.TotalDelayTime = 0.0004;
	
	gServoFeedInterface.Parameters.AxisAndDrivePars.Drive.Controller.Speed.ProportionalGain = 0.6;
	gServoFeedInterface.Parameters.AxisAndDrivePars.Drive.Controller.Speed.IntegralTime = 0.1;
	gServoFeedInterface.Parameters.AxisAndDrivePars.Drive.Controller.Speed.FilterTime = 0.0;
	
	//these values are only used if controller mode is set to position + feed forward
	gServoFeedInterface.Parameters.AxisAndDrivePars.Drive.Controller.FeedForward.TorqueLoad = 0.0;
	gServoFeedInterface.Parameters.AxisAndDrivePars.Drive.Controller.FeedForward.TorquePositive = 0.0;
	gServoFeedInterface.Parameters.AxisAndDrivePars.Drive.Controller.FeedForward.TorqueNegative = 0.0;
	gServoFeedInterface.Parameters.AxisAndDrivePars.Drive.Controller.FeedForward.SpeedTorqueFactor = 0.0;
	gServoFeedInterface.Parameters.AxisAndDrivePars.Drive.Controller.FeedForward.Inertia = 0.0;
	gServoFeedInterface.Parameters.AxisAndDrivePars.Drive.Controller.FeedForward.AccelerationFilterTime = 0.0;
		
	
	
	//hopper
	
	strcpy((char*)&gServoHopperInterface.Parameters.AxisAndDrivePars.AxisName, "Hopper");
	gServoHopperInterface.Parameters.AxisAndDrivePars.Axis.BaseType = mpAXIS_LINEAR;
	gServoHopperInterface.Parameters.AxisAndDrivePars.Axis.MeasurementUnit = mpAXIS_UNIT_MM;
	gServoHopperInterface.Parameters.AxisAndDrivePars.Axis.MeasurementResolution = 0.01;
	gServoHopperInterface.Parameters.AxisAndDrivePars.Axis.SoftwareLimitPositions.LowerLimit = 0;
	gServoHopperInterface.Parameters.AxisAndDrivePars.Axis.SoftwareLimitPositions.UpperLimit = 100.0;
	gServoHopperInterface.Parameters.AxisAndDrivePars.Axis.PeriodSettings.Period = 360;
	
	gServoHopperInterface.Parameters.AxisAndDrivePars.Axis.MovementLimits.VelocityPositive = 1000.0;
	gServoHopperInterface.Parameters.AxisAndDrivePars.Axis.MovementLimits.VelocityNegative = 1000.0;
	gServoHopperInterface.Parameters.AxisAndDrivePars.Axis.MovementLimits.Acceleration = 5000.0;
	gServoHopperInterface.Parameters.AxisAndDrivePars.Axis.MovementLimits.Deceleration = 5000.0;
	gServoHopperInterface.Parameters.AxisAndDrivePars.Axis.MovementLimits.JerkTime = 0.0;
	gServoHopperInterface.Parameters.AxisAndDrivePars.Axis.MovementLimits.PositionErrorStopLimit = 2;
	gServoHopperInterface.Parameters.AxisAndDrivePars.Axis.MovementLimits.VelocityErrorStopLimit = 0.0;
	gServoHopperInterface.Parameters.AxisAndDrivePars.Axis.MovementLimits.VelocityErrorStopLimitMode = mpAXIS_VEL_MODE_OFF;

	//gServoHopperInterface.Parameters.AxisAndDrivePars.Axis.CyclicReadChannels.UserChannelParameterID = 214;
	
	gServoHopperInterface.Parameters.AxisAndDrivePars.Drive.Gearbox.Input = 10;
	gServoHopperInterface.Parameters.AxisAndDrivePars.Drive.Gearbox.Output = 1;
	gServoHopperInterface.Parameters.AxisAndDrivePars.Drive.Gearbox.Direction = mpAXIS_DIR_CLOCKWISE;
	
	gServoHopperInterface.Parameters.AxisAndDrivePars.Drive.Transformation.ReferenceDistance = 127;
	
	//gServoHopperInterface.Parameters.AxisAndDrivePars.Drive.Controller.Mode = mpAXIS_CTRL_MODE_POSITION_FF;
	gServoHopperInterface.Parameters.AxisAndDrivePars.Drive.Controller.Mode = mpAXIS_CTRL_MODE_POSITION;
	gServoHopperInterface.Parameters.AxisAndDrivePars.Drive.Controller.Position.ProportionalGain = 400.0;
	gServoHopperInterface.Parameters.AxisAndDrivePars.Drive.Controller.Position.IntegralTime = 0.0;
	gServoHopperInterface.Parameters.AxisAndDrivePars.Drive.Controller.Position.PredictionTime = 0.0004;
	gServoHopperInterface.Parameters.AxisAndDrivePars.Drive.Controller.Position.TotalDelayTime = 0.0004;
	
	gServoHopperInterface.Parameters.AxisAndDrivePars.Drive.Controller.Speed.ProportionalGain = 0.6;
	gServoHopperInterface.Parameters.AxisAndDrivePars.Drive.Controller.Speed.IntegralTime = 0.1;
	gServoHopperInterface.Parameters.AxisAndDrivePars.Drive.Controller.Speed.FilterTime = 0.0;
	
	//these values are only used if controller mode is set to position + feed forward
	gServoHopperInterface.Parameters.AxisAndDrivePars.Drive.Controller.FeedForward.TorqueLoad = 0.0;
	gServoHopperInterface.Parameters.AxisAndDrivePars.Drive.Controller.FeedForward.TorquePositive = 0.0;
	gServoHopperInterface.Parameters.AxisAndDrivePars.Drive.Controller.FeedForward.TorqueNegative = 0.0;
	gServoHopperInterface.Parameters.AxisAndDrivePars.Drive.Controller.FeedForward.SpeedTorqueFactor = 0.0;
	gServoHopperInterface.Parameters.AxisAndDrivePars.Drive.Controller.FeedForward.Inertia = 0.0;
	gServoHopperInterface.Parameters.AxisAndDrivePars.Drive.Controller.FeedForward.AccelerationFilterTime = 0.0;
	
	
	//******* End Axis and Drive Param Default Settings *******//
	
	
	
}

void _CYCLIC ProgramCyclic(void)
{
	
	
	//******************START RAM HANDLER******************//
	gIsSimulated = DiagCpuIsSimulated();
	
	
	if (ServoRamFirstHomeExecuted == 0) {
		gHMI.StatusDatapoints.ServoRamHomeSDP = UNHIDE;
	} else {
		gHMI.StatusDatapoints.ServoRamHomeSDP = HIDE;
	}

	gServoRamInterface.Commands.RequestHome = gHMI.Commands.HomeServoRam || ServoRamAutoHome;
	gServoRamInterface.Commands.RequestJogPos = gHMI.Commands.JogServoRamPos;
	gServoRamInterface.Commands.RequestJogNeg = gHMI.Commands.JogServoRamNeg;
	gServoRamInterface.Parameters.MovementParameters.Jog.Acceleration = gHMI.Parameters.ServoRamAccel;
	gServoRamInterface.Parameters.MovementParameters.Jog.Deceleration = gHMI.Parameters.ServoRamAccel;
	gServoRamInterface.Parameters.MovementParameters.Jog.Velocity = gHMI.Parameters.ServoRamJogVelocity;
	
	gServoRamInterface.Parameters.MovementParameters.Acceleration = gHMI.Parameters.ServoRamAccel;
	gServoRamInterface.Parameters.MovementParameters.Deceleration = gHMI.Parameters.ServoRamAccel;
	gServoRamInterface.Parameters.MovementParameters.Torque.Limit = gHMI.Parameters.ServoRamTorqueLimit;
	gServoRamInterface.Parameters.MovementParameters.CyclicRead.TorqueMode = mpAXIS_READ_CYCLIC;
	
	//update torque limit anytime it is changed
	if (gServoRamInterface.Status.AxisInitialized) {
		if (OldTorqueLimitRam != gServoRamInterface.Parameters.MovementParameters.Torque.Limit) {
			gServoRamInterface.Commands.ToMapp.Update = 1;
		}
	
		OldTorqueLimitRam = gServoRamInterface.Parameters.MovementParameters.Torque.Limit;
	}
	
	//home request while running should clear command to cycle the ram This prevents ram from taking off immediately after home complets
	if (gServoRamInterface.Commands.RequestHome) {
		gHMI.Commands.CycleServoRam = 0;
	}
	
	//OldTorqueLimitRam = gServoRamInterface.Parameters.MovementParameters.Torque.Limit;
	
	ServoRamHandler.AlarmActive = gHighSeverityAlarmActive;
	ServoRamHandler.IsSimulated = gIsSimulated;
	ServoRamHandler.FirstHomeExecuted = &ServoRamFirstHomeExecuted;
	ServoRamHandler.pInterface = &gServoRamInterface;
	ServoRamHandler.pHomingParameters = &gHomingParameters.ServoRam;
	AxisHandler(&ServoRamHandler);
	//******************END RAM HANDLER******************//
	
	
	//******************START FEED HANDLER******************//
	gServoFeedInterface.Commands.RequestHome = gHMI.Commands.HomeServoFeed;
	gServoFeedInterface.Commands.RequestJogPos = gHMI.Commands.JogServoFeedPos;
	gServoFeedInterface.Commands.RequestJogNeg = gHMI.Commands.JogServoFeedNeg;
	gServoFeedInterface.Parameters.MovementParameters.Jog.Acceleration = gHMI.Parameters.ServoFeedAccel;
	gServoFeedInterface.Parameters.MovementParameters.Jog.Deceleration = gHMI.Parameters.ServoFeedAccel;
	gServoFeedInterface.Parameters.MovementParameters.Jog.Velocity = gHMI.Parameters.ServoFeedJogVelocity;
	
	gServoFeedInterface.Parameters.MovementParameters.Acceleration = gHMI.Parameters.ServoFeedAccel;
	gServoFeedInterface.Parameters.MovementParameters.Deceleration = gHMI.Parameters.ServoFeedAccel;
	gServoFeedInterface.Parameters.MovementParameters.Velocity = gHMI.Parameters.ServoFeedVelocity;
	gServoFeedInterface.Parameters.MovementParameters.Torque.Limit = gHMI.Parameters.ServoFeedTorqueLimit;
	
	//update torque limit anytime it is changed
	if (gServoFeedInterface.Status.AxisInitialized) {
		if (OldTorqueLimitFeed != gServoFeedInterface.Parameters.MovementParameters.Torque.Limit) {
			gServoFeedInterface.Commands.ToMapp.Update = 1;
		}
	
		OldTorqueLimitFeed = gServoFeedInterface.Parameters.MovementParameters.Torque.Limit;
	}
	
	ServoFeedHandler.AlarmActive = gHighSeverityAlarmActive;
	ServoFeedHandler.IsSimulated = gIsSimulated;
	ServoFeedHandler.FirstHomeExecuted = &ServoFeedFirstHomeExecuted;
	ServoFeedHandler.pInterface = &gServoFeedInterface;
	ServoFeedHandler.pHomingParameters = &gHomingParameters.ServoFeed;
	AxisHandler(&ServoFeedHandler);
	//******************END FEED HANDLER******************//	
		
	//******************START FEED HANDLER******************//
	gServoHopperInterface.Commands.RequestHome = gHMI.Commands.HomeServoHopper;
	gServoHopperInterface.Commands.RequestJogPos = gHMI.Commands.JogServoHopperPos;
	gServoHopperInterface.Commands.RequestJogNeg = gHMI.Commands.JogServoHopperNeg;
	gServoHopperInterface.Parameters.MovementParameters.Jog.Acceleration = gHMI.Parameters.ServoHopperAccel;
	gServoHopperInterface.Parameters.MovementParameters.Jog.Deceleration = gHMI.Parameters.ServoHopperAccel;
	gServoHopperInterface.Parameters.MovementParameters.Jog.Velocity = gHMI.Parameters.ServoHopperJogVelocity;
	
	gServoHopperInterface.Parameters.MovementParameters.Acceleration = gHMI.Parameters.ServoHopperAccel;
	gServoHopperInterface.Parameters.MovementParameters.Deceleration = gHMI.Parameters.ServoHopperAccel;
	gServoHopperInterface.Parameters.MovementParameters.Velocity = gHMI.Parameters.ServoHopperVelocity;
	gServoHopperInterface.Parameters.MovementParameters.Torque.Limit = gHMI.Parameters.ServoHopperTorqueLimit;
	gServoHopperInterface.Parameters.MovementParameters.CyclicRead.TorqueMode = mpAXIS_READ_CYCLIC;
	
	//update torque limit anytime it is changed
	if (gServoHopperInterface.Status.AxisInitialized) {
		if (OldTorqueLimitHopper != gServoHopperInterface.Parameters.MovementParameters.Torque.Limit) {
			gServoHopperInterface.Commands.ToMapp.Update = 1;
		}
	
		OldTorqueLimitHopper = gServoHopperInterface.Parameters.MovementParameters.Torque.Limit;
	}
	
	ServoHopperHandler.AlarmActive = gHighSeverityAlarmActive;
	ServoHopperHandler.IsSimulated = gIsSimulated;
	ServoHopperHandler.FirstHomeExecuted = &ServoHopperFirstHomeExecuted;
	ServoHopperHandler.pInterface = &gServoHopperInterface;
	ServoHopperHandler.pHomingParameters = &gHomingParameters.ServoHopper;
	AxisHandler(&ServoHopperHandler);
	//******************END FEED HANDLER******************//		
		
	
	
}

void _EXIT ProgramExit(void)
{

}

