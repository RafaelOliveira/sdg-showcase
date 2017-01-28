package screens;

import sdg.Sdg;
import kha.Color;
import sdg.graphics.text.BitmapText;
import sdg.graphics.text.Text.TextAlign;

class BitmapTextScr extends Play
{
	public function new()
	{
		super();

		var text = 'Kha is a low level sdk for building games and media applications in a portable way. Think SDL, but super-charged.';		
		
		var bText1 = new BitmapText(text, 'Oswald', 200);				
		create(80, 40, bText1);

		var bText2 = new BitmapText(text, 'Oswald', 200, { align: TextAlign.Center });
		bText2.color = Color.Red;
		create(300, 40, bText2);

		var bText3 = new BitmapText(text, 'Oswald', 200, { align: TextAlign.Right });
		bText3.color = Color.Cyan;
		create(520, 40, bText3);

		var bText4 = new BitmapText(text, 'AlexBrush', Sdg.gameWidth - 50);
		bText4.color = Color.Orange;
		create(50, 220, bText4);

		var bText5 = new BitmapText('This is a random text from a test application', 'Pacifico', Sdg.gameWidth - 50);
		bText5.color = Color.Green;
		create(50, 437, bText5);

		create(0, 520, new BitmapText('BitmapText', 'Vera', Sdg.gameWidth, { align: TextAlign.Center }));		

		addControls('shape', 'text');
	}
}