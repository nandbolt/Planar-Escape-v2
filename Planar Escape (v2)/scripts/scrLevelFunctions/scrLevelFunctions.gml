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

/// @func   getLevelObjectIdx({object} obj);
/// @desc   Returns the level object index.
function getLevelObjectIdx(_obj)
{
	switch (_obj)
	{
		case oSpawnPortal:
			return LevelObject.SPAWN_PORTAL;
		case oEndPortal:
			return LevelObject.END_PORTAL;
		case oStar:
			return LevelObject.STAR;
		case oStarDisk:
			return LevelObject.STAR_DISK;
		case oMoveableBlock:
			return LevelObject.WHITE_BLOCK;
		case oBigMoveableBlock:
			return LevelObject.BIG_WHITE_BLOCK;
		case oGlassBlock:
			return LevelObject.GLASS_BLOCK;
		case oIceBlock:
			return LevelObject.ICE_BLOCK;
		case oBigIceBlock:
			return LevelObject.BIG_ICE_BLOCK;
		case oDryIceBlock:
			return LevelObject.DRY_ICE_BLOCK;
		case oExplosiveBlock:
			return LevelObject.BROWN_EXPLOSIVE_BLOCK;
		case oRedExplosiveBlock:
			return LevelObject.RED_EXPLOSIVE_BLOCK;
		case oPowerBlock:
			return LevelObject.POWER_BLOCK;
		case oLaserBlock:
			return LevelObject.RED_LASER_BLOCK;
		case oCitizenLaserBlock:
			return LevelObject.YELLOW_LASER_BLOCK;
		case oZombieLaserBlock:
			return LevelObject.GREEN_LASER_BLOCK;
		case oCopLaserBlock:
			return LevelObject.BLUE_LASER_BLOCK;
		case oEntityLaserBlock:
			return LevelObject.BLACK_LASER_BLOCK;
		case oBeamSplitterBlock:
			return LevelObject.BEAM_SPLITTER_BLOCK;
		case oCrystalBlock:
			return LevelObject.RED_CRYSTAL_BLOCK;
		case oYellowCrystalBlock:
			return LevelObject.YELLOW_CRYSTAL_BLOCK;
		case oGreenCrystalBlock:
			return LevelObject.GREEN_CRYSTAL_BLOCK;
		case oBlueCrystalBlock:
			return LevelObject.BLUE_CRYSTAL_BLOCK;
		case oBlackCrystalBlock:
			return LevelObject.BLACK_CRYSTAL_BLOCK;
		case oCheckpoint:
			return LevelObject.CHECK_POINT;
		case oButton:
			return LevelObject.BUTTON;
		case oDoor:
			return LevelObject.WHITE_DOOR;
		case oRedDoor:
			return LevelObject.RED_DOOR;
		case oYellowDoor:
			return LevelObject.YELLOW_DOOR;
		case oGreenDoor:
			return LevelObject.GREEN_DOOR;
		case oBlueDoor:
			return LevelObject.BLUE_DOOR;
		case oBlackDoor:
			return LevelObject.BLACK_DOOR;
		case oPowerRod:
			return LevelObject.POWER_ROD;
		case oBelt:
			return LevelObject.BELT;
		case oNoneGadgetMachine:
			return LevelObject.GADGET_MACHINE_NONE;
		case oGrappleGadgetMachine:
			return LevelObject.GADGET_MACHINE_GRAPPLE;
		case oRedLaserGadgetMachine:
			return LevelObject.GADGET_MACHINE_RED_LASER;
		case oYellowLaserGadgetMachine:
			return LevelObject.GADGET_MACHINE_YELLOW_LASER;
		case oGreenLaserGadgetMachine:
			return LevelObject.GADGET_MACHINE_GREEN_LASER;
		case oBlueLaserGadgetMachine:
			return LevelObject.GADGET_MACHINE_BLUE_LASER;
		case oBlackLaserGadgetMachine:
			return LevelObject.GADGET_MACHINE_BLACK_LASER;
		case oRedPortal:
			return LevelObject.RED_PORTAL;
		case oYellowPortal:
			return LevelObject.YELLOW_PORTAL;
		case oGreenPortal:
			return LevelObject.GREEN_PORTAL;
		case oBluePortal:
			return LevelObject.BLUE_PORTAL;
		case oCitizen:
			return LevelObject.CITIZEN;
		case oZombie:
			return LevelObject.ZOMBIE;
		case oCop:
			return LevelObject.COP;
		case oRobot:
			return LevelObject.ROBOT;
		default:
			return -4;
	}
}