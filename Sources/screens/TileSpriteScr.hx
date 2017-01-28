package screens;

import kha.Assets;
import sdg.graphics.TileSprite;
import sdg.graphics.text.BitmapText;
import sdg.graphics.text.Text.TextAlign;
import sdg.graphics.Sprite;
import sdg.Sdg;

class TileSpriteScr extends Play
{
	public function new()
	{
		super();

		create(20, 40, new TileSprite('pattern1', 250, 80, 1, 1));
		create(290, 40, new TileSprite(Assets.images.pattern2, 150, 380, 1, 2));
		create(20, 140, new TileSprite(Assets.images.pattern3, 250, 200));
		create(20, 440, new TileSprite('pattern1', Sdg.gameWidth - 40, 50, 0, -0.3));

		create(0, 520, new BitmapText('TileSprites', 'Vera', Sdg.gameWidth, { align: TextAlign.Center }));		

		addControls('tilemap', 'shape');
	}	
}