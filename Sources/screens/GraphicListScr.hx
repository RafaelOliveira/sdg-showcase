package screens;

import sdg.Sdg;
import sdg.graphics.text.BitmapText;
import sdg.graphics.text.Text.TextAlign;
import objects.SolarSystem;

class GraphicListScr extends Play
{	
	public function new()
	{
		super();

		var system = new SolarSystem();
		add(system);
		
		create(0, 520, new BitmapText('GraphicList', 'Vera', Sdg.gameWidth, { align: TextAlign.Center }));		

		addControls('sprite', 'ninepatch');
	}
}