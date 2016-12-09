package objects;

import sdg.Object;
import sdg.graphics.Sprite;
import sdg.components.Animator;
import sdg.atlas.Atlas;
 
class Fan extends Object
{
	public function new(x:Float, y:Float)
	{
		super(x, y);

		graphic = new Sprite('obj_fan001');
		
		var regions = Atlas.getRegionsByIndex('fan-anim', 1, 3);

		var anim = new Animator();
		anim.addAnimation('on', regions);
		addComponent(anim);

		anim.play('on');
	}
}