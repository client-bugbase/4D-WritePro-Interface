
C_LONGINT:C283($color)

Case of 
	: (Form event code:C388=On Getting Focus:K2:7)
		OBJECT SET VISIBLE:C603(*; "FakeBackgroundColor"; True:C214)
		
	: (Form event code:C388=On Losing Focus:K2:8)
		OBJECT SET VISIBLE:C603(*; "FakeBackgroundColor"; False:C215)
		
	: (Form event code:C388=On After Edit:K2:43)
		
		OBJECT GET RGB COLORS:C1074(Self:C308->; $color)  // get the color of the text
		OBJECT SET RGB COLORS:C628(Self:C308->; $color; $color)  // set the same color on the background
		
		WP_SetBackgroundColor(Form:C1466.paragraphRange; $color)
		
End case 
