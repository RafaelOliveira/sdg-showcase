package screens;

import kha.Assets;
import kha.Color;
import sdg.graphics.text.Text;
import sdg.graphics.text.BitmapText;
import sdg.graphics.text.Text.TextAlign;
import sdg.Sdg;

class TextScr extends Play
{
	public function new()
	{
		super();

		var text = 'Kha is a low level sdk for building games and media applications in a portable way. Think SDL, but super-charged.';		
		
		var t1 = new Text(text, Assets.fonts.Oswald_Regular, 28, 200);				
		create(80, 40, t1);

		var t2 = new Text(text, Assets.fonts.Oswald_Regular, 28, 200, { align: TextAlign.Center });
		t2.color = Color.Red;
		create(300, 40, t2);

		var t3 = new Text(text, Assets.fonts.Oswald_Regular, 28, 200, { align: TextAlign.Right });
		t3.color = Color.Cyan;
		create(520, 40, t3);

		var t4 = new Text(text, Assets.fonts.AlexBrush_Regular, 64, Sdg.gameWidth - 50);
		t4.color = Color.Orange;
		create(50, 220, t4);

		var t5 = new Text('This is a random text from a test application', Assets.fonts.Pacifico, 32, Sdg.gameWidth - 50);
		t5.color = Color.Green;
		create(50, 430, t5);

		create(0, 520, new BitmapText('Text', 'Vera', Sdg.gameWidth, { align: TextAlign.Center }));		

		addControls('bitmaptext', 'particles');
	}	
}