
C_PICTURE:C286($pict)
C_POINTER:C301($ptr)
C_OBJECT:C1216($oCurrent)

$oCurrent:=WP_FillCurrent("popup")

If ($oCurrent#Null:C1517)
	
	$ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "bgndPictPreview")
	$pict:=$ptr->
	WP_SetBackgroundPicture($oCurrent; $pict)
	
Else 
	
	BEEP:C151
	//ALERT("Not available yet for this target")
	
End if 