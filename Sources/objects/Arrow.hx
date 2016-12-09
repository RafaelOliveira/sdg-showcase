package objects;

import kha.Color;
import sdg.Sdg;
import sdg.Object;
import sdg.graphics.Sprite;
import sdg.manager.Mouse;

class Arrow extends Object
{
	var goToScreen:String;

	public function new(x:Float, y:Float, goToScreen:String, left:Bool = false)
	{
		super(x, y);

		this.goToScreen = goToScreen;

		var sprite = new Sprite('arrow');
		sprite.flip.x = left;
		graphic = sprite;
		graphic.color = Color.Red;

		setSizeAuto();
	}

	override public function update()
	{
		super.update();

		if (pointInside(Mouse.x, Mouse.y))
		{
			graphic.color = 0xffff9393;

			if (Mouse.isPressed())
				Sdg.switchScreen(goToScreen);
		}
		else
			graphic.color = Color.Red;		
	}
}