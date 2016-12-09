package;

import kha.Assets;
import kha.Framebuffer;
import kha.Scheduler;
import kha.System;
import sdg.Engine;
import sdg.Sdg;
import sdg.atlas.Atlas;
import sdg.graphics.text.BitmapText;
import sdg.manager.Mouse;
import sdg.manager.Keyboard;
import screens.*;

class Project 
{	
	public function new() 
	{
		Assets.loadEverything(assetsLoaded);		
	}

	function assetsLoaded()
	{
		var engine = new Engine(800, 600);

		engine.addManager(new Mouse());
		engine.addManager(new Keyboard());

		BitmapText.loadFont('Vera', Assets.images.vera, Assets.blobs.vera_fnt);
		Atlas.loadAtlasShoebox(Assets.images.textures, Assets.blobs.textures_xml);		
		
		Sdg.addScreen('sprite', new SpriteScr());
		Sdg.addScreen('graphiclist', new GraphicListScr());
		Sdg.addScreen('tilemap', new TilemapScr());		
		Sdg.addScreen('tilesprite', new TileSpriteScr());		

		Sdg.switchScreen('sprite');

		System.notifyOnRender(engine.render);
		Scheduler.addTimeTask(engine.update, 0, 1 / 60);
	}	
}
