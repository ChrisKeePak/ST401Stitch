
#include <bur/plctypes.h>

#ifdef _DEFAULT_INCLUDES
	#include <AsDefault.h>
#endif

void _CYCLIC ProgramCyclic(void)
{
	/*
	BitPackedGrayCode = 0;
	
	for (i = 0; i < 16; i++)
	{
		BitPackedGrayCode = BitPackedGrayCode | (gIO.DIs.SSI_Parallel.Bits[i] << i);
	}
*/

	//	EncoderPos = grayToBinary(BitPackedGrayCode);
	
	//num = grayCodeBitPacker(gIO.DIs.SSI_Parallel.Bits);
	
		EncoderPos = grayToBinary(gIO.DIs.SSI_Parallel.Bits);
	
}
