package makeitbadgal.util;

import lime.utils.Assets;

class AssetsUtil
{
	public static function path(asset:String)
		return 'assets/$asset';

	public static function image(image:String)
		return path('$image.png');

	public static function sound(sound:String)
		return path('$sound.wav');

	public static function getText(text:String):String
	{
		#if sys
		return sys.io.File.getContent(path(text));
		#end

		return Assets.getText(path(text));
	}
}