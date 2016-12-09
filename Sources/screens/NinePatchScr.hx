package screens;

import kha.Assets;
import sdg.graphics.NinePatch;
import sdg.graphics.text.BitmapText;
import sdg.graphics.text.Text.TextAlign;
import sdg.Sdg;
import sdg.Screen;
import sdg.manager.Keyboard;
import objects.Fan;
import objects.Arrow;

class NinePatchScr extends Screen
{
	public function new()
	{
		super();
		
		create(50, 50, new NinePatch('button1', 6, 6, 6, 6, 150, 200));
		create(250, 80, new NinePatch('button2', 7, 7, 11, 12, 300, 50));
		create(420, 200, new NinePatch('button3', 7, 7, 8, 8, 200, 100));
		create(180, 370, new NinePatch(Assets.images.button4, 5, 5, 10, 9, 250, 80));

		create(0, 520, new BitmapText('NinePatch', 'Vera', Sdg.gameWidth, { align: TextAlign.Center }));

		var arrowLeft = new Arrow(20, 520, 'graphiclist', true);
		add(arrowLeft);

		var arrowRight = new Arrow(Sdg.gameWidth - 50, 520, 'tilemap');
		add(arrowRight);
	}

	override public function update()
	{
		super.update();

		if (Keyboard.isPressed('left'))
			Sdg.switchScreen('graphiclist');
		if (Keyboard.isPressed('right'))
			Sdg.switchScreen('tilemap');
	}
}