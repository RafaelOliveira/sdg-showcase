package;

import kha.Color;
import kha.Canvas;
import kha.Assets;
import kha.Framebuffer;
import kha.Scheduler;
import kha.System;
import sdg.Sdg;
import sdg.Engine;
import sdg.atlas.Atlas;
import sdg.manager.Mouse;
import sdg.manager.Keyboard;
import sdg.collision.Hitbox;
import sdg.graphics.text.BitmapText;
import screens.*;

class Project 
{
	var engine:Engine;
	var fps:FramesPerSecond;

	public function new() 
	{
		Assets.loadEverything(assetsLoaded);		
	}

	function assetsLoaded()
	{
		engine = new Engine(800, 600);

		engine.addManager(new Mouse());
		engine.addManager(new Keyboard());

		engine.persistentRender = persistentRender;

		Hitbox.init();		

		Atlas.loadAtlasShoebox(Assets.images.textures, Assets.blobs.textures_xml);
		
		BitmapText.loadFont('Vera', Assets.images.vera, Assets.blobs.vera_fnt);
		BitmapText.loadFont('AlexBrush', 'AlexBrush', Assets.blobs.AlexBrush_fnt);
		BitmapText.loadFont('Oswald', Assets.images.oswald, Assets.blobs.oswald_fnt);
		BitmapText.loadFont('Pacifico', Assets.images.pacifico, Assets.blobs.pacifico_fnt);		
		
		Sdg.addScreen('sprite', new SpriteScr());
		Sdg.addScreen('graphiclist', new GraphicListScr());
		Sdg.addScreen('ninepatch', new NinePatchScr());
		Sdg.addScreen('tilemap', new TilemapScr());				
		Sdg.addScreen('tilesprite', new TileSpriteScr());
		Sdg.addScreen('shape', new ShapeScr());
		Sdg.addScreen('bitmaptext', new BitmapTextScr());
		Sdg.addScreen('text', new TextScr());
		Sdg.addScreen('particles', new ParticlesScr());

		Sdg.switchScreen('sprite');

		fps = new FramesPerSecond();

		System.notifyOnRender(render);
		Scheduler.addTimeTask(update, 0, 1 / 60);
	}

	function update()
	{
		engine.update();
		fps.update();
	}

	function render(fb:Framebuffer)
	{
		engine.render(fb);
		fps.calcFrames();
	}

	function persistentRender(canvas:Canvas)
	{
		canvas.g2.color = Color.White;
		canvas.g2.font = Assets.fonts.Vera;
		canvas.g2.fontSize = 28;

		canvas.g2.drawString(Std.string(fps.fps), Sdg.gameWidth - 39, 5);
	}
}