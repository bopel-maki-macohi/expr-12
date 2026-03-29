package source.makeitbadgal.objects;

import flixel.FlxG;
import flixel.util.FlxSignal;
import flixel.FlxSprite;

class ButtonSprite extends FlxSprite
{
	public var enabled:Bool = true;

	public var onClick:FlxSignal = new FlxSignal();
	public var useDefaultOnClickCondition:Bool = true;

	var overlapping:Bool = false;

	public var onOverlap:FlxSignal = new FlxSignal();
	public var onUnoverlap:FlxSignal = new FlxSignal();

	public var overlapUpdate:FlxSignal = new FlxSignal();

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (this.enabled)
			buttonScript();
	}

	public function buttonScript()
	{
		if (!FlxG.mouse.overlaps(this))
		{
			if (overlapping)
			{
				overlapping = false;
				onUnoverlap.dispatch();
			}

			return;
		}

		if (overlapping)
		{
			if (overlapUpdate != null)
				overlapUpdate.dispatch();

			if (FlxG.mouse.justReleased && useDefaultOnClickCondition)
				if (onClick != null)
					onClick.dispatch();
		}
		else
		{
			overlapping = true;

			if (onOverlap != null)
				onOverlap.dispatch();
		}
	}
}
