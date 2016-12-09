package objects;

import kha.Assets;
import sdg.Object;
import sdg.graphics.Sprite;
import sdg.atlas.Region;
import sdg.Sdg;

class Cloud extends Object
{
	var scrollX:Float;

	public function new(x:Float, y:Float, scrollX:Float, alpha:Float = 1)
	{
		super(x, y);

		this.scrollX = scrollX;

		var region = new Region(Assets.images.tileset, 0, 544, 160, 64);
		graphic = new Sprite(region);
		graphic.alpha = alpha;

		setSizeAuto();
	}

	override public function update()
	{
		x += scrollX;

		if (x < 0 && scrollX < 0)
			x = Sdg.gameWidth;
		else if (x > Sdg.gameWidth && scrollX > 0)
			x = -width;
	}
}