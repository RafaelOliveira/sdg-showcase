package screens;

import kha.Assets;
import sdg.graphics.text.BitmapText;
import sdg.graphics.text.Text.TextAlign;
import sdg.graphics.particles.loaders.ParticleLoader;
import sdg.Sdg;

class ParticlesScr extends Play
{
	public function new()
	{
		super();

		var particles1 = ParticleLoader.load('particle', Assets.blobs.fire_plist, Assets.blobs.fire_plistName);
		create(200, 400, particles1);
		particles1.emit();

		var particles2 = ParticleLoader.load('particle', Assets.blobs.fountain_lap, Assets.blobs.fountain_lapName);
		create(550, 420, particles2);
		particles2.emit();

		create(0, 520, new BitmapText('Particles', 'Vera', Sdg.gameWidth, { align: TextAlign.Center }));		

		addControls('text', 'sprite');
	}
}