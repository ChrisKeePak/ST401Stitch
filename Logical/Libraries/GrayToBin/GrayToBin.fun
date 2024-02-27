
FUNCTION grayToBinary : UDINT (*Convert gray code to binary*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		bits : ARRAY[0..15] OF BOOL;
	END_VAR
END_FUNCTION

FUNCTION grayCodeBitPacker : UDINT (*packs gray code bits into a single variable*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		bits : ARRAY[0..15] OF BOOL;
	END_VAR
END_FUNCTION
