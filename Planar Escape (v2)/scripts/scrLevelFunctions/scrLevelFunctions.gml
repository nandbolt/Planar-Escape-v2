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
			return "inner machinations";
			break;
		case rLevelMain16:
			return "final bout";
			break;
		case rLevelEmpty:
			return "new level";
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
		case rLevelEmpty:
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
		case Mode.ESCAPE:
			return "escape";
			break;
		case Mode.TRACE:
			return "trace";
			break;
	}
	return "???";
}

/// @func   getEntitySpeedName({enum.EntitySpeed} speed);
/// @desc   Returns the name of the entity's speed.
function getEntitySpeedName(_speed)
{
	switch (_speed)
	{
		case EntitySpeed.STASIS:
			return "stasis";
			break;
		case EntitySpeed.NORMAL:
			return "normal";
			break;
		case EntitySpeed.HYPER:
			return "hyper";
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
		case Mode.ESCAPE:
			return "exit quickly while collecting stars.";
			break;
		case Mode.TRACE:
			return "cover as much ground as possible.";
			break;
	}
	return "???";
}