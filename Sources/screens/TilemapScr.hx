package screens;

import kha.Color;
import kha.Assets;
import sdg.graphics.tiles.Tileset;
import sdg.graphics.tiles.Tilemap;
import sdg.graphics.text.BitmapText;
import sdg.graphics.text.Text.TextAlign;
import sdg.graphics.Sprite;
import sdg.graphics.shapes.Polygon;
import sdg.Screen;
import sdg.Sdg;
import sdg.manager.Keyboard;
import objects.Cloud;
import objects.Arrow;

class TilemapScr extends Screen
{
	public function new()
	{
		super();

		var tileset = new Tileset(Assets.images.tileset, 32, 32);
		var maps = Tilemap.createFromPyxelEdit(Assets.blobs.map_txt, tileset);
		
		create(0, 37, Polygon.createRectangle(800, 416, Color.Cyan));
		create(0, 37, maps[0]);
		create(0, 37, maps[1]);

		add(new Cloud(150, 130, 0.1, 0.5));
		add(new Cloud(10, 100, 0.5));				

		create(0, 520, new BitmapText('Tilemap - PyxelEdit', 'Vera', Sdg.gameWidth, { align: TextAlign.Center }));

		var arrowLeft = new Arrow(20, 520, 'ninepatch', true);
		add(arrowLeft);

		var arrowRight = new Arrow(Sdg.gameWidth - 50, 520, 'tilesprite');
		add(arrowRight);
	}

	override public function update()
	{
		super.update();

		if (Keyboard.isPressed('left'))
			Sdg.switchScreen('ninepatch');			
		else if (Keyboard.isPressed('right'))
			Sdg.switchScreen('tilesprite');
	}
}