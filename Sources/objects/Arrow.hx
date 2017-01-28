package objects;

import kha.Color;
import sdg.Sdg;
import sdg.Object;
import sdg.graphics.Sprite;
import sdg.manager.Mouse;

class Arrow extends Object
{
	var onClick:Void->Void;

	public function new(x:Float, y:Float, left:Bool, onClick:Void->Void, scale:Float = 1.0)
	{
		super(x, y);

		this.onClick = onClick;

		var sprite = new Sprite('arrow');
		sprite.setScale(scale);
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
				onClick();
		}
		else
			graphic.color = Color.Red;		
	}
}