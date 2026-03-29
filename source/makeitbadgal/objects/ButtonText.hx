package makeitbadgal.objects;

import flixel.util.FlxColor;
import flixel.util.FlxSignal;
import flixel.FlxG;
import flixel.text.FlxText;

class ButtonText extends FlxText
{
	public var enabled:Bool = true;

	public var onClick:FlxSignal = new FlxSignal();

	public static final SCALE_MAIN:Int = 64;
	public static final SCALE_HALF:Int = Math.round(SCALE_MAIN / 2);
	public static final SCALE_QUARTER:Int = Math.round(SCALE_HALF / 2);

	override public function new(t:String, e:Bool = true, ?s:Null<Int>, ?x:Float, ?y:Float, ?fw:Float = 0)
	{
		this.enabled = e;

		super(x, y, fw, t, s ?? SCALE_MAIN);

		color = FlxColor.BLACK;
		font = AssetsUtil.path('fonts/Perfect DOS VGA 437.ttf');

		antialiasing = false;
		// tempted to disable fullscreen because flixel makes the text look fucking UUUUUGLLLLLLLY
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (!enabled)
			return;

		this.underline = FlxG.mouse.overlaps(this);

		if (this.underline && FlxG.mouse.justReleased)
			if (onClick != null)
				onClick.dispatch();
	}
}
