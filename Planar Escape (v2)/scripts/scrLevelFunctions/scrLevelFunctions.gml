/// @func   getLevelName({room} room);
/// @desc   Returns the name of the level.
function getLevelName(_room)
{
	switch (_room)
	{
		case rLevelMain01:
			return "on the brink";
			break;
		case rLevelMain02:
			return "ice cold";
			break;
		case rLevelMain03:
			return "pressing on";
			break;
		case rLevelMain04:
			return "grasping flames";
			break;
		case rLevelMain05:
			return "laser focused";
			break;
		case rLevelMain06:
			return "powered optics";
			break;
		case rLevelMain07:
			return "electrodes";
			break;
		case rLevelMain08:
			return "chromatosis";
			break;
		case rLevelMain09:
			return "zombification";
			break;
		case rLevelMain10:
			return "town panick";
			break;
		case rLevelMain11:
			return "breaking in";
			break;
		case rLevelMain12:
			return "busting out";
			break;
		case rLevelMain13:
			return "linked up";
			break;
		case rLevelMain14:
			return "crystal wake";
			break;
		case rLevelMain15:
			return "forced away";
			break;
		case rLevelMain16:
			return "robonauts";
			break;
		case rLevelMain17:
			return "hyper coolant";
			break;
		case rLevelMain18:
			return "logitronics";
			break;
		case rLevelMain19:
			return "inner machinations";
			break;
		case rLevelMain20:
			return "final bout";
			break;
	}
	return "???";
}

/// @func	roomIsLevel({room} room);
function roomIsLevel(_room)
{
	switch (_room)
	{
		case rLevelMain01:
		case rLevelMain02:
		case rLevelMain03:
		case rLevelMain04:
		case rLevelMain05:
		case rLevelMain06:
		case rLevelMain07:
		case rLevelMain08:
		case rLevelMain09:
		case rLevelMain10:
		case rLevelMain11:
		case rLevelMain12:
		case rLevelMain13:
		case rLevelMain14:
		case rLevelMain15:
		case rLevelMain16:
		case rLevelMain17:
		case rLevelMain18:
		case rLevelMain19:
		case rLevelMain20:
			return true;
		default:
			return false;
	}
}

/// @func   getModeName({enum.Mode} mode);
/// @desc   Returns the name of the mode.
function getModeName(_mode)
{
	switch (_mode)
	{
		case Mode.STASIS:
			return "chill";
			break;
		case Mode.NORMAL:
			return "normal";
			break;
		case Mode.HYPER:
			return "hyper";
			break;
		case Mode.TRACE:
			return "trace";
			break;
	}
	return "???";
}

/// @func   getModeDescription({enum.Mode} mode);
/// @desc   Returns the description of the mode.
function getModeDescription(_mode)
{
	switch (_mode)
	{
		case Mode.STASIS:
			return "no entity.";
			break;
		case Mode.NORMAL:
			return "the standard mode: escape.";
			break;
		case Mode.HYPER:
			return "ecape with 2x entity speed.";
			break;
		case Mode.TRACE:
			return "cover as much ground as possible.";
			break;
	}
	return "???";
}