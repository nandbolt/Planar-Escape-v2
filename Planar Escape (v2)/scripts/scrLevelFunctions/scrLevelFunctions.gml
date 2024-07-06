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