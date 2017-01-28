package screens;

import kha.Assets;
import sdg.Screen;
import sdg.graphics.text.Text;
import sdg.graphics.text.Text.TextAlign;
import sdg.manager.Keyboard;
import sdg.Sdg;
import objects.Arrow;

class Play extends Screen
{
	var leftScreen:String;
	var rightScreen:String;

	var filterName:Text;

	// Used to prevent the controls to switch screen
	// to not affect player controls
	var enableArrowKeys:Bool;

	public function new(enableArrowKeys:Bool = true)
	{
		this.enableArrowKeys = enableArrowKeys;

		super();		
	}

	override public function init():Void 
	{
		updateFilter();
	}

	public function addControls(leftScreen:String, rightScreen:String)
	{
		this.leftScreen = leftScreen;
		this.rightScreen = rightScreen;

		var arrowLeft = new Arrow(20, 520, true, function() Sdg.switchScreen(leftScreen));
		add(arrowLeft);

		var arrowRight = new Arrow(Sdg.gameWidth - 50, 520, false, function() Sdg.switchScreen(rightScreen));
		add(arrowRight);

		filter = Project.filters[Project.filterIndex];

		var arrowFilterLeft = new Arrow(9, 9, true, function() changeFilter(-1), 0.5);
		add(arrowFilterLeft);

		filterName = new Text(Project.getFilterName(), Assets.fonts.Vera, 14, 70, { align: TextAlign.Center });
		create(26, 11, filterName);

		var arrowFilterRight = new Arrow(99, 9, false, function() changeFilter(1), 0.5);
		add(arrowFilterRight);
	}

	function changeFilter(direction)
	{
		Project.changeFilterIndex(direction);

		if (Project.filterIndex == -1)
		{
			if (filter != null)
				filter.enabled = false;
		}
		else
		{
			filter = Project.filters[Project.filterIndex];
			filter.enabled = true;
		}

		filterName.text = Project.getFilterName();
	}

	function updateFilter()
	{
		filter = Project.filters[Project.filterIndex];
		filterName.text = Project.getFilterName();
	}

	override public function update()
	{
		super.update();
		
		if (enableArrowKeys)
		{
			if (Keyboard.isPressed('left'))
				Sdg.switchScreen(leftScreen);
			else if (Keyboard.isPressed('right'))
				Sdg.switchScreen(rightScreen);
		}

		if (Keyboard.isPressed('a'))
			changeFilter(-1);
		else if (Keyboard.isPressed('s'))
			changeFilter(1);
	}
}