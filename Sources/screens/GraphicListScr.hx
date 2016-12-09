package screens;

import sdg.Screen;
import sdg.graphics.text.BitmapText;
import sdg.graphics.text.Text.TextAlign;
import sdg.manager.Keyboard;
import sdg.Sdg;
import objects.Arrow;
import objects.SolarSystem;

class GraphicListScr extends Screen
{
	public function new()
	{
		super();

		var system = new SolarSystem();
		add(system);
		
		create(0, 520, new BitmapText('GraphicList', 'Vera', Sdg.gameWidth, { align: TextAlign.Center }));		

		var arrowLeft = new Arrow(20, 520, 'sprite', true);
		add(arrowLeft);

		var arrowRight = new Arrow(Sdg.gameWidth - 50, 520, 'tilemap');
		add(arrowRight);
	}

	override public function update()
	{
		super.update();

		if (Keyboard.isPressed('left'))
			Sdg.switchScreen('sprite');			
		else if (Keyboard.isPressed('right'))
			Sdg.switchScreen('tilemap');
	}
}