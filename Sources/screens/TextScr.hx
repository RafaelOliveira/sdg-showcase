package screens;

import kha.Assets;
import kha.Color;
import sdg.Screen;
import sdg.graphics.text.Text;
import sdg.graphics.text.BitmapText;
import sdg.graphics.text.Text.TextAlign;
import sdg.manager.Keyboard;
import sdg.Sdg;
import objects.Arrow;

class TextScr extends Screen
{
	public function new()
	{
		super();

		var text = 'Kha is a low level sdk for building games and media applications in a portable way. Think SDL, but super-charged.';		
		
		var t1 = new Text(text, Assets.fonts.Oswald_Regular, 28, 200);				
		create(80, 10, t1);

		var t2 = new Text(text, Assets.fonts.Oswald_Regular, 28, 200, { align: TextAlign.Center });
		t2.color = Color.Red;
		create(300, 10, t2);

		var t3 = new Text(text, Assets.fonts.Oswald_Regular, 28, 200, { align: TextAlign.Right });
		t3.color = Color.Cyan;
		create(520, 10, t3);

		var t4 = new Text(text, Assets.fonts.AlexBrush_Regular, 64, Sdg.gameWidth - 50);
		t4.color = Color.Orange;
		create(50, 190, t4);

		var t5 = new Text('This is a random text from a test application', Assets.fonts.Pacifico, 32, Sdg.gameWidth - 50);
		t5.color = Color.Green;
		create(50, 400, t5);

		create(0, 520, new BitmapText('Text', 'Vera', Sdg.gameWidth, { align: TextAlign.Center }));		

		var arrowLeft = new Arrow(20, 520, 'bitmaptext', true);
		add(arrowLeft);

		var arrowRight = new Arrow(Sdg.gameWidth - 50, 520, 'sprite');
		add(arrowRight);
	}

	override public function update()
	{
		super.update();
		
		if (Keyboard.isPressed('left'))
			Sdg.switchScreen('bitmaptext');
		else if (Keyboard.isPressed('right'))
			Sdg.switchScreen('sprite');
	}
}