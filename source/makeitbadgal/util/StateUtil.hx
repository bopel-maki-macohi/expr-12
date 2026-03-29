package makeitbadgal.util;

import flixel.FlxState;

class StateUtil
{
	public static function getStateName(state:FlxState):String
	{
		if (state == null)
			return 'Unknown';
		var cls = Type.getClass(state);
		if (cls == null)
			return 'Unknown';
		var name = Type.getClassName(cls);
		return name != null ? name.split('.').pop() : 'Unknown';
	}
}
