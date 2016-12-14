package screens;

import kha.Color;
import sdg.Screen;
import sdg.graphics.text.BitmapText;
import sdg.graphics.text.Text.TextAlign;
import sdg.manager.Keyboard;
import sdg.Sdg;
import objects.Arrow;

class BitmapTextScr extends Screen
{
	public function new()
	{
		super();

		var text = 'Kha is a low level sdk for building games and media applications in a portable way. Think SDL, but super-charged.';		
		
		var bText1 = new BitmapText(text, 'Oswald', 200);				
		create(80, 10, bText1);

		var bText2 = new BitmapText(text, 'Oswald', 200, { align: TextAlign.Center });
		bText2.color = Color.Red;
		create(300, 10, bText2);

		var bText3 = new BitmapText(text, 'Oswald', 200, { align: TextAlign.Right });
		bText3.color = Color.Cyan;
		create(520, 10, bText3);

		var bText4 = new BitmapText(text, 'AlexBrush', Sdg.gameWidth - 50);
		bText4.color = Color.Orange;
		create(50, 190, bText4);

		var bText5 = new BitmapText('This is a random text from a test application', 'Pacifico', Sdg.gameWidth - 50);
		bText5.color = Color.Green;
		create(50, 407, bText5);

		create(0, 520, new BitmapText('BitmapText', 'Vera', Sdg.gameWidth, { align: TextAlign.Center }));		

		var arrowLeft = new Arrow(20, 520, 'shape', true);
		add(arrowLeft);

		var arrowRight = new Arrow(Sdg.gameWidth - 50, 520, 'text');
		add(arrowRight);
	}

	override public function update()
	{
		super.update();
		
		if (Keyboard.isPressed('left'))
			Sdg.switchScreen('shape');
		else if (Keyboard.isPressed('right'))
			Sdg.switchScreen('text');
	}
}