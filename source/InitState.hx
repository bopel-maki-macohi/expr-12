import flixel.FlxState;
import flixel.FlxG;

class InitState extends FlxState
{
	override public function create()
	{
		super.create();

		trace('MIBAL: ${makeitbadgal.Config.MIBAL_BaseVersion}');

		FlxG.switchState(() -> new makeitbadgal.SplashState());
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
