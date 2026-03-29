import flixel.math.FlxMath;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.group.FlxSpriteContainer.FlxTypedSpriteContainer;
import flixel.FlxG;
import flixel.util.FlxTimer;
import flixel.FlxState;

class PlayState extends FlxState
{
	public var money:Float = 0;
	public var moneyPerSecond:Float = 0;
	public var moneyTexts:FlxTypedSpriteContainer<ButtonText>;

	override function create()
	{
		super.create();

		moneyTexts = new FlxTypedSpriteContainer<ButtonText>();
		add(moneyTexts);

		FlxTimer.loop(1, loop ->
		{
			addMoney(moneyPerSecond);
		}, 0);
	}

	public function addMoney(addDollar:Float)
	{
		addDollar = FlxMath.roundDecimal(addDollar, 2);
		if (addDollar <= 0)
			return;

		money += addDollar;

		var moneyText:ButtonText = new ButtonText('+${addDollar}', false, ButtonText.SCALE_HALF);

		moneyText.x = FlxG.random.float(0, FlxG.width - moneyText.width);
		moneyText.y = FlxG.random.float(0, FlxG.height - moneyText.height);

		moneyText.color = FlxColor.LIME;

		moneyTexts.add(moneyText);

		FlxTween.tween(moneyText, {y: moneyTexts.y - (80 * FlxG.random.float(0.1, 1.1)), alpha: 0}, 1, {
			ease: FlxEase.sineInOut,
			onComplete: function(t)
			{
				moneyTexts.members.remove(moneyText);
				moneyText.destroy();
			}
		});
	}
}
