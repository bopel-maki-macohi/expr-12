package makeitbadgal.util;

import lime.app.Application;

using StringTools;

enum abstract UpdateType(String) from String to String
{
	var major = 'major';
	var minor = 'minor';
	var patch = 'patch';

	var none = 'none';
}

class VersionUtil
{
	public static function compareVersions(versionA:String, versionB:String):UpdateType
	{
		var versionASplit = versionA.split('.');
		var versionBSplit = versionB.split('.');

		if (versionASplit[0] != versionBSplit[0])
			return major;

		if (versionASplit[1] != versionBSplit[1])
			return minor;

		if (versionASplit[2] != versionBSplit[2])
			return patch;

		return none;
	}

	public static function getRawVersion()
	{
		return Application.current.meta.get('version');
	}

	public static function getVersion(linebreakBetweenBits:Bool = false)
	{
		var v:String = 'v';
		v += getRawVersion();

		if (v.endsWith('.0'))
			v = v.substr(0, v.length - 2);

		if (Defines.PRE_RELEASE != null && Std.parseInt(Defines.PRE_RELEASE) > 0)
		{
			if (linebreakBetweenBits)
				v += '\n';
			else
				v += ' ';

			v += '(pre-release ${Defines.PRE_RELEASE})';
		}

		return v;
	}
}
