/*
	Resources used:
	
	https://pixabay.com/en/pattern-curve-design-seamless-1004855/
	https://pixabay.com/en/pattern-seamless-pattern-tile-1097338/
	https://pixabay.com/en/grunge-stripe-seamless-pattern-1557132/

	http://opengameart.org/content/generic-platformer-tiles

	https://www.fontsquirrel.com/fonts/Bitstream-Vera-Sans

	http://2dgameartforfree.blogspot.com.br/2013/07/crates-and-boxes-1.html
	http://2dgameartforfree.blogspot.com.br/2013/08/household-items.html
*/

package;

import kha.System;

class Main 
{
	public static function main() 
	{
		System.init({ title: "Showcase", width: 800, height: 600 }, function () {
			new Project();
		});
	}
}
