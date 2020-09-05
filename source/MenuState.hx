package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.ui.FlxButton;

class MenuState extends FlxState
{
	var playButton:FlxButton;

	function clickPlay()
	{
		FlxG.switchState(new PlayState());
	}

	function pressEnter()
	{
		var enter:Bool = false;

		enter = FlxG.keys.anyPressed([ENTER]);
		if (enter)
		{
			clickPlay();
		}
	}

	override public function create()
	{
		playButton = new FlxButton(0, 0, 'Play', clickPlay);
		playButton.screenCenter();
		add(playButton);
		super.create();
	}

	override public function update(elapsed:Float)
	{
		pressEnter();
		super.update(elapsed);
	}
}
