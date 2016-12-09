package screens;

import kha.Assets;
import sdg.graphics.TileSprite;
import sdg.graphics.text.BitmapText;
import sdg.graphics.text.Text.TextAlign;
import sdg.graphics.Sprite;
import sdg.Screen;
import sdg.Sdg;
import sdg.manager.Keyboard;
import objects.Arrow;

class TileSpriteScr extends Screen
{
	public function new()
	{
		super();

		create(20, 20, new TileSprite(Assets.images.pattern1, 250, 100, 1, 1));
		create(290, 20, new TileSprite(Assets.images.pattern2, 150, 400, 1, 2));
		create(20, 140, new TileSprite(Assets.images.pattern3, 250, 200));
		create(20, 440, new TileSprite(Assets.images.pattern1, Sdg.gameWidth - 40, 50, 0, -0.3));

		create(0, 520, new BitmapText('TileSprites', 'Vera', Sdg.gameWidth, { align: TextAlign.Center }));		
		
		var arrowLeft = new Arrow(20, 520, 'tilemap', true);
		add(arrowLeft);
	}

	override public function update()
	{
		super.update();
		
		if (Keyboard.isPressed('left'))
			Sdg.switchScreen('tilemap');
	}
}