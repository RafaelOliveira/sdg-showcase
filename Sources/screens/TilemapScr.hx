package screens;

import kha.Color;
import kha.Assets;
import sdg.Object;
import sdg.graphics.tiles.Tileset;
import sdg.graphics.tiles.Tilemap;
import sdg.graphics.text.Text;
import sdg.graphics.text.BitmapText;
import sdg.graphics.text.Text.TextAlign;
import sdg.graphics.Sprite;
import sdg.graphics.shapes.Polygon;
import sdg.Sdg;
import sdg.collision.Grid;
import objects.Cloud;
import objects.Player;

class TilemapScr extends Play
{
	public function new()
	{
		super(false);

		var tileset = new Tileset(Assets.images.tileset, 32, 32);
		var maps = Tilemap.createFromPyxelEdit(Assets.blobs.map_txt, tileset);
		
		create(0, 37, Polygon.createRectangle(800, 416, Color.Cyan));
		
		create(0, 37, maps[0]);		
		var objMapCollision = create(0, 37, maps[1]);
		objMapCollision.setSizeAuto();

		setupTilemapCollision(objMapCollision);

		add(new Player(70, 120));

		add(new Cloud(150, 130, 0.1, 0.5));
		add(new Cloud(10, 100, 0.5));				

		create(0, 465, new Text('Collision with Hitbox and Grid', Assets.fonts.Oswald_Regular, 24, Sdg.gameWidth, { align: TextAlign.Center }));
		create(0, 520, new BitmapText('Tilemap - PyxelEdit', 'Vera', Sdg.gameWidth, { align: TextAlign.Center }));		

		addControls('ninepatch', 'tilesprite');
	}

	function setupTilemapCollision(objMapCollision:Object)
	{
		var grid = new Grid(objMapCollision, 32, 32, 'collision');
		
		grid.setArea(2, 11, 7, 1, true);
		grid.setArea(12, 10, 7, 1, true);
		grid.setTile(21, 10, true);
		grid.setTile(23, 10, true);
	}	
}