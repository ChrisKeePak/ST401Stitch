
PROGRAM _INIT
        
(* ### BEGIN gRamAxis ### *)
        
(* initialize variables *)
	gRamAxis_HW.DrvIf_Typ := ncSDC_DRVSERVO16;
	brsstrcpy( ADR(gRamAxis_HW.DrvIf_Name[0]), ADR('gRamAxis_DrvIf') );
//	gRamAxis_HW.EncIf1_Typ := ncSDC_ENC16;
//	brsstrcpy( ADR(gRamAxis_HW.EncIf1_Name), ADR('gRamAxis_EncIf16') );
	gRamAxis_HW.DiDoIf_Typ := ncSDC_DIDO;
	brsstrcpy( ADR(gRamAxis_HW.DiDoIf_Name[0]), ADR('gRamAxis_DiDoIf') );
	     
	(* force variable offset generation *)
	gRamAxis.size                      := gRamAxis.size;
	gRamAxis_DrvIf.iLifeCnt            := gRamAxis_DrvIf.iLifeCnt;
	gRamAxis_DiDoIf.iLifeCntDriveReady := gRamAxis_DiDoIf.iLifeCntDriveReady;
	gRamAxis_ModuleOk                  := gRamAxis_ModuleOk;
         
	(* assign your hardware inputs here*)
  
	(*      gRamAxis_DiDoIf.iPosHwEnd  := gRamAxis_DiDoIf.iPosHwEnd;
	gRamAxis_DiDoIf.iNegHwEnd  := gRamAxis_DiDoIf.iNegHwEnd;
	gRamAxis_DiDoIf.iReference := gRamAxis_DiDoIf.iReference;
	*)
        
	(* ### END gRamAxis ### *)

END_PROGRAM

