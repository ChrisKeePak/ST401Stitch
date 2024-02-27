
#include <bur/plctypes.h>
#include <math.h>
#ifdef __cplusplus
	extern "C"
	{
#endif
	#include "DistCalc.h"
#ifdef __cplusplus
	};
#endif
/* TODO: Add your comment here */
REAL DetermineDistanceToStopPos(float EncoderPos, float StopPos)
{
	REAL diff = 0.0;
	REAL modDiff = 0.0;
	
	diff = fabs(EncoderPos - StopPos);
	
	modDiff = fmod(diff,360.0);
	
	return (180.0 - fabs(modDiff - 180.0));
	
}
