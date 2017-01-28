package screens;

import kha.Color;
import kha.math.Vector2;
import sdg.graphics.shapes.Polygon;
import sdg.graphics.shapes.Circle;
import sdg.graphics.text.BitmapText;
import sdg.graphics.text.Text.TextAlign;
import sdg.Sdg;

class ShapeScr extends Play
{
	public function new()
	{
		super();

		create(50, 50, Polygon.createRectangle(100, 100, Color.Blue));
		create(60, 60, Polygon.createRectangle(100, 100, Color.Yellow));
		create(70, 70, Polygon.createRectangle(100, 100, Color.Pink));		
		create(300, 70, Polygon.createRectangle(300, 50, Color.Red, false));

		// The first point needs to be in 0,0. Seems like a bug in Kha.
		create(250, 250, new Polygon([
				new Vector2(0, 0), 
				new Vector2(88, 16), 
				new Vector2(118, 100),
				new Vector2(60, 169),
				new Vector2(-29, 152),
				new Vector2(-58, 68)
			], Color.Green));

		create(400, 190, new Circle(60, Color.Yellow));				 
		create(540, 290, new Circle(60, Color.Magenta, false, 3));

		create(0, 520, new BitmapText('Shapes', 'Vera', Sdg.gameWidth, { align: TextAlign.Center }));		

		addControls('tilesprite', 'bitmaptext');
	}	
}