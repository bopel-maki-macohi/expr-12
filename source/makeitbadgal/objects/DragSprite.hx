package makeitbadgal.objects;

import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.math.FlxPoint;
import flixel.FlxG;
import flixel.FlxSprite;

class DragSprite extends ButtonSprite
{
	public var dragging:Bool = false;
	public var mouseDragOffsets:FlxPoint = new FlxPoint();

	public var boundary_X_min:Float = 0;
	public var boundary_X_max:Float = FlxG.width;

	public var boundary_Y_min:Float = 0;
	public var boundary_Y_max:Float = FlxG.height;

	override public function new(?X:Float = 0, ?Y:Float = 0, ?SimpleGraphic:FlxGraphicAsset)
	{
		super(X, Y, SimpleGraphic);

		enabled = false;
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		boundary_X_max = FlxG.width - width;
		boundary_Y_max = FlxG.height - height;

		if (dragging)
		{
			setPosition(FlxG.mouse.x + mouseDragOffsets.x, FlxG.mouse.y + mouseDragOffsets.y);

			if (x < boundary_X_min) x = boundary_X_min;
			if (y < boundary_Y_min) y = boundary_Y_min;
			
			if (x > boundary_X_max) x = boundary_X_max;
			if (y > boundary_Y_max) y = boundary_Y_max;
		}

		if (overlapping)
		{
			if (FlxG.mouse.justPressed)
			{
				mouseDragOffsets.set(this.x - FlxG.mouse.x, this.y - FlxG.mouse.y);
				dragging = true;
			}

			if (FlxG.mouse.justReleased)
				dragging = false;
		}
		else
		{
			if (dragging)
				dragging = false;
		}
	}
}
