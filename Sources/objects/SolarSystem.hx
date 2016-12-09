package objects;

import kha.Color;
import sdg.Object;
import sdg.Graphic;
import sdg.Sdg;
import sdg.graphics.Sprite;
import sdg.graphics.GraphicList;
import sdg.graphics.shapes.Circle;

class SolarSystem extends Object
{
	var assetList:Array<Graphic>;

	var speeds:Array<Float>;
	var angles:Array<Float>;
	var distances:Array<Int>;

	public function new()
	{
		super();

		assetList = new Array<Graphic>();

		speeds = [0.2, 0.3, 0.4];
		angles = [20, 50, 70];
		distances = [130, 220, 310];

		for (i in 0...3)
			addCircle(distances[i]);		

		for (i in 1...5)
			assetList.push(new Sprite('planet-$i'));

		assetList[3].x = Sdg.halfGameWidth - 75;
		assetList[3].y = Sdg.halfGameHeight - 75;

		setPlanetPosition(0);
		setPlanetPosition(1);
		setPlanetPosition(2);

		graphic = new GraphicList(assetList);
	}

	function addCircle(radius:Float)
	{
		var circle = new Circle(radius, Color.Cyan, false);
		circle.alpha = 0.3;
		circle.x = Sdg.halfGameWidth;
		circle.y = Sdg.halfGameHeight;

		assetList.push(circle);
	}

	function setPlanetPosition(index:Int)
	{
		assetList[index + 4].x = Sdg.halfGameWidth - 40 + (Math.sin(angles[index] * Sdg.RAD) * distances[index]);
		assetList[index + 4].y = Sdg.halfGameHeight - 40 + (Math.cos(angles[index] * Sdg.RAD) * distances[index]);
	}

	override public function update()
	{
		super.update();

		for (i in 0...3)
		{
			angles[i] += speeds[i];
			setPlanetPosition(i); 
		}
	}
}