

PROGRAM _INIT
	(* Insert code here *)
	 
	gRecipeInterface.Commands.LoadRecipe := 1; //load settings on startup

	IF gRecipeInterface.Parameters.RecipeName = '' THEN
		gRecipeInterface.Parameters.RecipeName := TYPE1_RECIPE_NAME;
	END_IF
	
	//If the last recipe was type 2, set file name to that recipe. Otherwise default to recipe 1 file name
//	IF LastRecipeLoaded = TYPE2_RECIPE_NAME THEN
//		gRecipeInterface.Parameters.RecipeName := TYPE2_RECIPE_NAME;
//	ELSE
//		gRecipeInterface.Parameters.RecipeName := TYPE1_RECIPE_NAME;
//	END_IF
	
		
	
	
END_PROGRAM