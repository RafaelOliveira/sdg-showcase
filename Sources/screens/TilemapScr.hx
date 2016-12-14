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
import sdg.Screen;
import sdg.Sdg;
import sdg.manager.Keyboard;
import sdg.collision.GridEx;
import objects.Cloud;
import objects.Arrow;
import objects.Player;

class TilemapScr extends Screen
{
	public function new()
	{
		super();

		var tileset = new Tileset(Assets.images.tileset, 32, 32);
		var maps = Tilemap.createFromPyxelEdit(Assets.blobs.map_txt, tileset);
		
		create(0, 37, Polygon.createRectangle(800, 416, Color.Cyan));
		
		create(0, 37, maps[0]);		
		var objMapCollision = create(0, 37, maps[1]);
		objMapCollision.setSizeAuto();

		setupTilemapCollision(objMapCollision, maps[1]);

		add(new Player(70, 120));

		add(new Cloud(150, 130, 0.1, 0.5));
		add(new Cloud(10, 100, 0.5));				

		create(0, 465, new Text('Collision with Hitbox and GridEx', Assets.fonts.Oswald_Regular, 24, Sdg.gameWidth, { align: TextAlign.Center }));
		create(0, 520, new BitmapText('Tilemap - PyxelEdit', 'Vera', Sdg.gameWidth, { align: TextAlign.Center }));

		var arrowLeft = new Arrow(20, 520, 'ninepatch', true);
		add(arrowLeft);

		var arrowRight = new Arrow(Sdg.gameWidth - 50, 520, 'tilesprite');
		add(arrowRight);
	}

	function setupTilemapCollision(objMapCollision:Object, tilemapCollision:Tilemap)
	{
		var grid = new GridEx(objMapCollision, 'tilemap_scr', tilemapCollision, null, 'collision');
		
		for (i in 1...7)
			grid.setTilesetCollision(i, true);
		for (i in 9...14)
			grid.setTilesetCollision(i, true);
		for (i in 17...22)
			grid.setTilesetCollision(i, true);
		for (i in 25...29)
			grid.setTilesetCollision(i, true);
		for (i in 33...39)
			grid.setTilesetCollision(i, true);
		for (i in 41...46)
			grid.setTilesetCollision(i, true);
		for (i in 48...53)
			grid.setTilesetCollision(i, true);
		for (i in 48...53)
			grid.setTilesetCollision(i, true);
		for (i in 56...60)
			grid.setTilesetCollision(i, true);	
	}	
}