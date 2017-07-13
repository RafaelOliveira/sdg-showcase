package screens;

import kha.Assets;
import sdg.Screen;
import sdg.graphics.text.Text;
import sdg.graphics.text.Text.TextAlign;
import sdg.manager.Keyboard;
import sdg.Sdg;
import sdg.Object;
import objects.Arrow;
import kha.input.KeyCode;
import sdg.manager.Mouse;
import sdg.graphics.NinePatch;

class Play extends Screen
{
	var leftScreen:String;
	var rightScreen:String;

	var filterName:Text;

	public var helpBtn:sdg.Object;
	public var infoTxt:sdg.Object;
	public var infoTxtSh:sdg.Object;
	public var infoTxtBG:sdg.Object;

	inline public function new()
	{
		super();		
	}

	override public function init():Void 
	{
		updateFilter();
	}

	inline public function addControls(leftScreen:String, rightScreen:String)
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

		filterName = new Text(Project.getFilterName(), Assets.fonts.Vera, 14, 150, {align:TextAlign.Center});
		create(16, 11, filterName);

		var arrowFilterRight = new Arrow(158, 9, false, function() changeFilter(1), 0.5);
		add(arrowFilterRight);


		var mHelp = new Text(">", Assets.fonts.Oswald_Regular, 28, 0, {align:TextAlign.Center});
		mHelp.color = kha.Color.White;
		create(685, 3, mHelp);

		var f1Txt = new Text("Help", Assets.fonts.Oswald_Regular, 28, 45, {align:TextAlign.Center});
		
		f1Txt.color = kha.Color.Cyan;
		helpBtn = new sdg.Object(690, 5, f1Txt);
		helpBtn.width = f1Txt.boxWidth;
		helpBtn.height = f1Txt.boxHeight;
		add(helpBtn);

		var sTxt = "'F1' Help\n'-' or '=' Cycle Filters\n'[' or ']' Cycle Demos\n'Arrows' Move Character\n'R' Reset Character";
	
		var txtSh = new Text(sTxt, Assets.fonts.Oswald_Regular, 24, 200, {align:TextAlign.Left});
		txtSh.color = 0xff696969;
		infoTxtSh = new sdg.Object(570, 45, txtSh);
		infoTxtSh.set_visible(false);
		
		infoTxtBG = new sdg.Object(559, 36, new NinePatch('button2', 7, 7, 8, 8, txtSh.boxWidth + 4, txtSh.boxHeight + 4 * 3));
		infoTxtBG.graphic.alpha = 0.7;
		infoTxtBG.graphic.color = 0xff696969;
		infoTxtBG.set_visible(false);
		

		var txt = new Text(sTxt, Assets.fonts.Oswald_Regular, 24, 200, {align:TextAlign.Left});
		txt.color =  kha.Color.White;		
		infoTxt = new sdg.Object(569, 43, txt);
		infoTxt.set_visible(false);

		add(infoTxtBG);
		add(infoTxtSh);
		add(infoTxt);
	}
	
	inline function changeFilter(direction)
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

	inline function updateFilter()
	{
		filter = Project.filters[Project.filterIndex];
		filterName.text = Project.getFilterName();
	}

	inline public function SetF1Vis(v:Bool)
	{
		infoTxt.set_visible(v);
		infoTxtSh.set_visible(v);
		infoTxtBG.set_visible(v);
	}
	inline public function ToggleVis()
	{
		if(!infoTxt.visible)
		{
			SetF1Vis(true);
		}
		else
		{
			SetF1Vis(false);
		}
	}

	override public function update()
	{
		super.update();
		
		//if(Keyboard.isAnyPressed()){trace(Keyboard.keysPressed);} //KeyCode Debug
		
		if(helpBtn.pointInside(Mouse.x, Mouse.y))
		{
			if(helpBtn.graphic.color != kha.Color.Yellow)
			{
				helpBtn.graphic.color = kha.Color.Yellow;
			}
			if(Mouse.isAnyPressed())
			{
				helpBtn.graphic.color = kha.Color.Red;
				ToggleVis();
			}
		}
		else
		{
			if(helpBtn.graphic.color != kha.Color.Cyan)
			{
				helpBtn.graphic.color = kha.Color.Cyan;
			}
		}

		if(Keyboard.isPressed(KeyCode.CloseBracket))
		{
			Sdg.switchScreen(rightScreen);
			SetF1Vis(false);
		}
		else
		{
			if(Keyboard.isPressed(KeyCode.OpenBracket))
			{
				Sdg.switchScreen(leftScreen);
				SetF1Vis(false);
			}
			if(Keyboard.isPressed(189) || Keyboard.isPressed(KeyCode.Equals)) //Equals varies per target
			{
				changeFilter(-1);
			}
			else
			{ 
				if(Keyboard.isPressed(187) || Keyboard.isPressed(KeyCode.HyphenMinus)) //HyphenMinus varies per target
				{
					changeFilter(1);
				}
				else
				{
					if(Keyboard.isPressed(KeyCode.F1)) 
					{
						ToggleVis();
					}
				}
			}
		}	
	}
}