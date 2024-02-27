
PROGRAM _CYCLIC
        
(* ### BEGIN gRamAxis ### *)
        
(* life counter emulation of digital inputs *)
    gRamAxis_DiDoIf.iLifeCntReference := gRamAxis_DiDoIf.iLifeCntReference + 1;
    gRamAxis_DiDoIf.iLifeCntNegHwEnd  := gRamAxis_DiDoIf.iLifeCntNegHwEnd  + 1;
	gRamAxis_DiDoIf.iLifeCntPosHwEnd  := gRamAxis_DiDoIf.iLifeCntPosHwEnd  + 1;
//	gRamAxis_EncIf16.iLifeCnt := gRamAxis_EncIf16.iLifeCnt + 1;
	
//	gRamAxis_EncIf16.iActPos := UDINT_TO_INT(gIO.Encoders.SickSSIPos);
        
(* ### END gRamAxis ### *)

END_PROGRAM

