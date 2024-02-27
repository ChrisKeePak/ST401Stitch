
#include <bur/plctypes.h>
#include "grayToBin.h"

#ifdef __cplusplus
	extern "C"
	{
#endif

#ifdef __cplusplus
	};
#endif

/* Convert gray code to binary */
unsigned long grayToBinary(plcbit bits[16])
{
	
	unsigned long num;
	//	unsigned int mask;
	//	for (mask = num >> 1; mask != 0; mask = mask >> 1)
	//	{
	//		num = num ^ mask;
	//	}
	//	return num;
	
	num = grayCodeBitPacker(bits);
	
	num = num ^ (num >> 16);
	num = num ^ (num >> 8);
	num = num ^ (num >> 4);
	num = num ^ (num >> 2);
	num = num ^ (num >> 1);
	return num;
}
