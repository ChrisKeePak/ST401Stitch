
#include <bur/plctypes.h>
#ifdef __cplusplus
	extern "C"
	{
#endif
	#include "GrayToBin.h"
#ifdef __cplusplus
	};
#endif

/* packs gray code bits into a single variable */
unsigned long grayCodeBitPacker(plcbit bits[16])
{
	UDINT BitPackedGrayCode = 0;
	unsigned short i;
	
	for (i = 0; i < 16; i++)
	{
		BitPackedGrayCode = BitPackedGrayCode | (bits[i] << i);
	}
	
	return BitPackedGrayCode;
}
