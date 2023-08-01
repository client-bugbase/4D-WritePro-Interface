//%attributes = {"invisible":true}
C_TEXT:C284($1)
C_TEXT:C284($2)
C_LONGINT:C283($3; $4)

C_TEXT:C284($areaName)
C_TEXT:C284($trueExpression; $virtualExpression)
C_LONGINT:C283($start; $end)
C_LONGINT:C283($n)
C_POINTER:C301($ptr)
ARRAY TEXT:C222($_titles; 0)
ARRAY LONGINT:C221($_nums; 0)

If (Count parameters:C259=0)  // component context
	
	$trueExpression:=(OBJECT Get pointer:C1124(Object named:K67:5; "TrueExpression"))->
	// the formula is displayed with virtual structure
	// parse to real structure before edit
	$virtualExpression:=Parse formula:C1576($trueExpression; Formula in with virtual structure:K88:1)
	
	
	If (Not:C34(Is nil pointer:C315(masterTable)))  // 27 sept 2018 (was not used before!)
		$ptr:=masterTable
	Else 
		$ptr:=Current form table:C627
		If (Is nil pointer:C315($ptr))
			// RL 2019/12/02 : check for available table in database
			GET TABLE TITLES:C803($_titles; $_nums)
			$n:=Size of array:C274($_nums)
			If ($n>0)
				$ptr:=Table:C252($_nums{1})
			End if 
		End if 
	End if 
	
	
	If (Not:C34(Is nil pointer:C315($ptr)))
		
		If (Form:C1466.selection.start=Form:C1466.selection.end)  //ACI0101873 (check again)
			$trueExpression:=""
			$virtualExpression:=""
		End if 
		EDIT FORMULA:C806($ptr->; $trueExpression)
		
		If (ok=1)
			
			(OBJECT Get pointer:C1124(Object named:K67:5; "TrueExpression"))->:=$trueExpression
			
			If (areaName#"")
				
				$start:=OB Get:C1224(Form:C1466.selection; wk start:K81:87)
				$end:=OB Get:C1224(Form:C1466.selection; wk end:K81:88)
				
				CALL FORM:C1391(Current form window:C827; Current method name:C684; areaName; $trueExpression; $start; $end)  // this must be executed in the host form
				
			End if 
		End if 
	Else 
		ALERT:C41(Get localized string:C991("NoTableAvailable"))
	End if 
	
Else   // 
	
	$areaName:=$1
	$trueExpression:=$2
	$start:=$3
	$end:=$4
	
	ST INSERT EXPRESSION:C1281(*; $areaName; $trueExpression; $start; $end)
	//WP SELECT(*; $areaName; $end; $end)
	
End if 

//ST INSERT EXPRESSION($ptr->;$expression)