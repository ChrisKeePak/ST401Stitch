
PROGRAM _INIT
	(* Insert code here *)
	b_ModuleStatus;
	mb_Station 			:= 'IF2.ST1';
	Melter;
END_PROGRAM

PROGRAM _CYCLIC
	(* Insert code here *)
	FB_NDSN_MB_PBFlex_Ctrl(IN_b_Enable :=NOT  Melter.b_r_LostCommunication, 
		IN_mb_station := mb_Station,
		Melter := Melter);
	FB_NDSN_MB_PBFlex_Proc(IN_b_Enable :=NOT  Melter.b_r_LostCommunication, 
		IN_mb_station := mb_Station,
		Melter := Melter);
	Melter.b_r_LostCommunication := NOT b_ModuleStatus;
	
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

