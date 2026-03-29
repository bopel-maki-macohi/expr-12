package makeitbadgal;

import makeitbadgal.objects.ButtonText;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import flixel.FlxG;
import flixel.FlxState;
import flixel.tweens.FlxTween;

class SplashState extends FlxState
{
    public var companyText:ButtonText;

	override function create()
	{
		super.create();

        companyText = new ButtonText(FlxG.stage.application.meta.get('company'), false, ButtonText.SCALE_MAIN);
        add(companyText);
		companyText.color = FlxColor.WHITE;
        companyText.screenCenter();

		#if SKIP_SPLASH
		trace('Skipping splash...');
		endSplash();
		return;
		#end

		trace('Starting splash...');

		FlxG.sound.play(AssetsUtil.sound('sounds/splash.wav'));
		FlxTween.tween(companyText, {alpha: 0}, 1, {
			startDelay: 1,
			onComplete: function(t)
			{
				FlxTimer.wait(1, endSplash);
			}
		});
	}

	public function endSplash()
	{
		trace('Ending splash...');

		startingStateBehavior();
	}

	public static function startingStateBehavior()
    {
		FlxG.switchState(() -> new PlayState());
    }
}
