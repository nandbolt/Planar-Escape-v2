/// @func   getLevelName({room} room);
/// @desc   Returns the name of the level.
function getLevelName(_room)
{
	switch (_room)
	{
		case rLevelMain01:
			return "on the brink";
		case rLevelMain02:
			return "ice cold";
		case rLevelMain03:
			return "pressing on";
		case rLevelMain04:
			return "grasping flames";
		case rLevelMain05:
			return "laser focused";
		case rLevelMain06:
			return "powered optics";
		case rLevelMain07:
			return "electrodes";
		case rLevelMain08:
			return "chromatosis";
		case rLevelMain09:
			return "zombification";
		case rLevelMain10:
			return "town panick";
		case rLevelMain11:
			return "breaking in";
		case rLevelMain12:
			return "busting out";
		case rLevelMain13:
			return "linked up";
		case rLevelMain14:
			return "crystal wake";
		case rLevelMain15:
			return "inner machinations";
		case rLevelMain16:
			return "final bout";
		case rLevelCustom01:
		case rLevelCustom02:
		case rLevelCustom03:
		case rLevelCustom04:
		case rLevelCustom05:
		case rLevelCustom06:
		case rLevelCustom07:
		case rLevelCustom08:
		case rLevelCustom09:
		case rLevelCustom10:
		case rLevelCustom11:
		case rLevelCustom12:
		case rLevelCustom13:
		case rLevelCustom14:
		case rLevelCustom15:
		case rLevelCustom16:
		case rLevelCustom17:
		case rLevelCustom18:
		case rLevelCustom19:
		case rLevelCustom20:
		case rLevelCustom21:
		case rLevelCustom22:
		case rLevelCustom23:
		case rLevelCustom24:
		case rLevelCustom25:
		case rLevelCustom26:
		case rLevelCustom27:
		case rLevelCustom28:
		case rLevelCustom29:
		case rLevelCustom30:
		case rLevelCustom31:
		case rLevelCustom32:
		case rLevelCustom33:
		case rLevelCustom34:
		case rLevelCustom35:
		case rLevelCustom36:
		case rLevelCustom37:
		case rLevelCustom38:
		case rLevelCustom39:
		case rLevelCustom40:
		case rLevelCustom41:
		case rLevelCustom42:
		case rLevelCustom43:
		case rLevelCustom44:
		case rLevelCustom45:
		case rLevelCustom46:
		case rLevelCustom47:
		case rLevelCustom48:
		case rLevelCustom49:
		case rLevelCustom50:
		case rLevelCustom51:
		case rLevelCustom52:
		case rLevelCustom53:
		case rLevelCustom54:
		case rLevelCustom55:
		case rLevelCustom56:
		case rLevelCustom57:
		case rLevelCustom58:
		case rLevelCustom59:
		case rLevelCustom60:
		case rLevelCustom61:
		case rLevelCustom62:
		case rLevelCustom63:
		case rLevelCustom64:
			return global.customLevelNames[global.customLevelIdx];
		case rLevelEmpty:
			return "new level";
	}
	return "???";
}

/// @func   getLevelCreator({room} room);
/// @desc   Returns the name of the level.
function getLevelCreator(_room)
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
			return "";
		case rLevelCustom01:
		case rLevelCustom02:
		case rLevelCustom03:
		case rLevelCustom04:
		case rLevelCustom05:
		case rLevelCustom06:
		case rLevelCustom07:
		case rLevelCustom08:
		case rLevelCustom09:
		case rLevelCustom10:
		case rLevelCustom11:
		case rLevelCustom12:
		case rLevelCustom13:
		case rLevelCustom14:
		case rLevelCustom15:
		case rLevelCustom16:
		case rLevelCustom17:
		case rLevelCustom18:
		case rLevelCustom19:
		case rLevelCustom20:
		case rLevelCustom21:
		case rLevelCustom22:
		case rLevelCustom23:
		case rLevelCustom24:
		case rLevelCustom25:
		case rLevelCustom26:
		case rLevelCustom27:
		case rLevelCustom28:
		case rLevelCustom29:
		case rLevelCustom30:
		case rLevelCustom31:
		case rLevelCustom32:
		case rLevelCustom33:
		case rLevelCustom34:
		case rLevelCustom35:
		case rLevelCustom36:
		case rLevelCustom37:
		case rLevelCustom38:
		case rLevelCustom39:
		case rLevelCustom40:
		case rLevelCustom41:
		case rLevelCustom42:
		case rLevelCustom43:
		case rLevelCustom44:
		case rLevelCustom45:
		case rLevelCustom46:
		case rLevelCustom47:
		case rLevelCustom48:
		case rLevelCustom49:
		case rLevelCustom50:
		case rLevelCustom51:
		case rLevelCustom52:
		case rLevelCustom53:
		case rLevelCustom54:
		case rLevelCustom55:
		case rLevelCustom56:
		case rLevelCustom57:
		case rLevelCustom58:
		case rLevelCustom59:
		case rLevelCustom60:
		case rLevelCustom61:
		case rLevelCustom62:
		case rLevelCustom63:
		case rLevelCustom64:
			return global.customLevelCreators[global.customLevelIdx];
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
		case rLevelCustom01:
		case rLevelCustom02:
		case rLevelCustom03:
		case rLevelCustom04:
		case rLevelCustom05:
		case rLevelCustom06:
		case rLevelCustom07:
		case rLevelCustom08:
		case rLevelCustom09:
		case rLevelCustom10:
		case rLevelCustom11:
		case rLevelCustom12:
		case rLevelCustom13:
		case rLevelCustom14:
		case rLevelCustom15:
		case rLevelCustom16:
		case rLevelCustom17:
		case rLevelCustom18:
		case rLevelCustom19:
		case rLevelCustom20:
		case rLevelCustom21:
		case rLevelCustom22:
		case rLevelCustom23:
		case rLevelCustom24:
		case rLevelCustom25:
		case rLevelCustom26:
		case rLevelCustom27:
		case rLevelCustom28:
		case rLevelCustom29:
		case rLevelCustom30:
		case rLevelCustom31:
		case rLevelCustom32:
		case rLevelCustom33:
		case rLevelCustom34:
		case rLevelCustom35:
		case rLevelCustom36:
		case rLevelCustom37:
		case rLevelCustom38:
		case rLevelCustom39:
		case rLevelCustom40:
		case rLevelCustom41:
		case rLevelCustom42:
		case rLevelCustom43:
		case rLevelCustom44:
		case rLevelCustom45:
		case rLevelCustom46:
		case rLevelCustom47:
		case rLevelCustom48:
		case rLevelCustom49:
		case rLevelCustom50:
		case rLevelCustom51:
		case rLevelCustom52:
		case rLevelCustom53:
		case rLevelCustom54:
		case rLevelCustom55:
		case rLevelCustom56:
		case rLevelCustom57:
		case rLevelCustom58:
		case rLevelCustom59:
		case rLevelCustom60:
		case rLevelCustom61:
		case rLevelCustom62:
		case rLevelCustom63:
		case rLevelCustom64:
		case rLevelEmpty:
			return true;
		default:
			return false;
	}
}

/// @func	roomIsCustomLevel({room} room);
function roomIsCustomLevel(_room)
{
	switch (_room)
	{
		case rLevelCustom01:
		case rLevelCustom02:
		case rLevelCustom03:
		case rLevelCustom04:
		case rLevelCustom05:
		case rLevelCustom06:
		case rLevelCustom07:
		case rLevelCustom08:
		case rLevelCustom09:
		case rLevelCustom10:
		case rLevelCustom11:
		case rLevelCustom12:
		case rLevelCustom13:
		case rLevelCustom14:
		case rLevelCustom15:
		case rLevelCustom16:
		case rLevelCustom17:
		case rLevelCustom18:
		case rLevelCustom19:
		case rLevelCustom20:
		case rLevelCustom21:
		case rLevelCustom22:
		case rLevelCustom23:
		case rLevelCustom24:
		case rLevelCustom25:
		case rLevelCustom26:
		case rLevelCustom27:
		case rLevelCustom28:
		case rLevelCustom29:
		case rLevelCustom30:
		case rLevelCustom31:
		case rLevelCustom32:
		case rLevelCustom33:
		case rLevelCustom34:
		case rLevelCustom35:
		case rLevelCustom36:
		case rLevelCustom37:
		case rLevelCustom38:
		case rLevelCustom39:
		case rLevelCustom40:
		case rLevelCustom41:
		case rLevelCustom42:
		case rLevelCustom43:
		case rLevelCustom44:
		case rLevelCustom45:
		case rLevelCustom46:
		case rLevelCustom47:
		case rLevelCustom48:
		case rLevelCustom49:
		case rLevelCustom50:
		case rLevelCustom51:
		case rLevelCustom52:
		case rLevelCustom53:
		case rLevelCustom54:
		case rLevelCustom55:
		case rLevelCustom56:
		case rLevelCustom57:
		case rLevelCustom58:
		case rLevelCustom59:
		case rLevelCustom60:
		case rLevelCustom61:
		case rLevelCustom62:
		case rLevelCustom63:
		case rLevelCustom64:
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
		case Mode.MARK:
			return "mark";
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
		case Mode.ESCAPE:
			return "exit quickly while collecting stars.";
			break;
		case Mode.MARK:
			return "mark as much ground as possible.";
			break;
		case Mode.TRACE:
			return "trace the shortest path to the exit.";
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

/// @func   getEntitySpeedDescription({enum.EntitySpeed} speed);
/// @desc   Returns the description of the entity's speed.
function getEntitySpeedDescription(_speed)
{
	switch (_speed)
	{
		case EntitySpeed.STASIS:
			return "no entity (score x1)";
			break;
		case EntitySpeed.NORMAL:
			return "slow entity (score x2)";
			break;
		case EntitySpeed.HYPER:
			return "fast entity (score x4)";
			break;
	}
	return "???";
}

/// @func   getEntitySpeedScoreMultiplier({enum.EntitySpeed} speed);
/// @desc   Returns the score multiplier of the entity's speed.
function getEntitySpeedScoreMultiplier(_speed)
{
	switch (_speed)
	{
		case EntitySpeed.NORMAL:
			return 10;
		case EntitySpeed.HYPER:
			return 100;
	}
	return 1;
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

/// @func   getLevelObject({enum.LevelObject} idx);
/// @desc   Returns the level object from the index.
function getLevelObject(_idx)
{
	switch (_idx)
	{
		case LevelObject.SPAWN_PORTAL:
			return oSpawnPortal;
		case LevelObject.END_PORTAL:
			return oEndPortal;
		case LevelObject.STAR:
			return oStar;
		case LevelObject.STAR_DISK:
			return oStarDisk;
		case LevelObject.WHITE_BLOCK:
			return oMoveableBlock;
		case LevelObject.BIG_WHITE_BLOCK:
			return oBigMoveableBlock;
		case LevelObject.GLASS_BLOCK:
			return oGlassBlock;
		case LevelObject.ICE_BLOCK:
			return oIceBlock;
		case LevelObject.BIG_ICE_BLOCK:
			return oBigIceBlock;
		case LevelObject.DRY_ICE_BLOCK:
			return oDryIceBlock;
		case LevelObject.BROWN_EXPLOSIVE_BLOCK:
			return oExplosiveBlock;
		case LevelObject.RED_EXPLOSIVE_BLOCK:
			return oRedExplosiveBlock;
		case LevelObject.POWER_BLOCK:
			return oPowerBlock;
		case LevelObject.RED_LASER_BLOCK:
			return oLaserBlock;
		case LevelObject.YELLOW_LASER_BLOCK:
			return oCitizenLaserBlock;
		case LevelObject.GREEN_LASER_BLOCK:
			return oZombieLaserBlock;
		case LevelObject.BLUE_LASER_BLOCK:
			return oCopLaserBlock;
		case LevelObject.BLACK_LASER_BLOCK:
			return oEntityLaserBlock;
		case LevelObject.BEAM_SPLITTER_BLOCK:
			return oBeamSplitterBlock;
		case LevelObject.RED_CRYSTAL_BLOCK:
			return oCrystalBlock;
		case LevelObject.YELLOW_CRYSTAL_BLOCK:
			return oYellowCrystalBlock;
		case LevelObject.GREEN_CRYSTAL_BLOCK:
			return oGreenCrystalBlock;
		case LevelObject.BLUE_CRYSTAL_BLOCK:
			return oBlueCrystalBlock;
		case LevelObject.BLACK_CRYSTAL_BLOCK:
			return oBlackCrystalBlock;
		case LevelObject.CHECK_POINT:
			return oCheckpoint;
		case LevelObject.BUTTON:
			return oButton;
		case LevelObject.WHITE_DOOR:
			return oDoor;
		case LevelObject.RED_DOOR:
			return oRedDoor;
		case LevelObject.YELLOW_DOOR:
			return oYellowDoor;
		case LevelObject.GREEN_DOOR:
			return oGreenDoor;
		case LevelObject.BLUE_DOOR:
			return oBlueDoor;
		case LevelObject.BLACK_DOOR:
			return oBlackDoor;
		case LevelObject.POWER_ROD:
			return oPowerRod;
		case LevelObject.BELT:
			return oBelt;
		case LevelObject.GADGET_MACHINE_NONE:
			return oNoneGadgetMachine;
		case LevelObject.GADGET_MACHINE_GRAPPLE:
			return oGrappleGadgetMachine;
		case LevelObject.GADGET_MACHINE_RED_LASER:
			return oRedLaserGadgetMachine;
		case LevelObject.GADGET_MACHINE_YELLOW_LASER:
			return oYellowLaserGadgetMachine;
		case LevelObject.GADGET_MACHINE_GREEN_LASER:
			return oGreenLaserGadgetMachine;
		case LevelObject.GADGET_MACHINE_BLUE_LASER:
			return oBlueLaserGadgetMachine;
		case LevelObject.GADGET_MACHINE_BLACK_LASER:
			return oBlackLaserGadgetMachine;
		case LevelObject.RED_PORTAL:
			return oRedPortal;
		case LevelObject.YELLOW_PORTAL:
			return oYellowPortal;
		case LevelObject.GREEN_PORTAL:
			return oGreenPortal;
		case LevelObject.BLUE_PORTAL:
			return oBluePortal;
		case LevelObject.CITIZEN:
			return oCitizen;
		case LevelObject.ZOMBIE:
			return oZombie;
		case LevelObject.COP:
			return oCop;
		case LevelObject.ROBOT:
			return oRobot;
		default:
			return -4;
	}
}

/// @func   levelObjectIdxIsActor({enum.LevelObject} idx);
/// @desc   Returns whether the level object index is an actor.
function levelObjectIdxIsActor(_idx)
{
	return (_idx > LevelObject.CITIZEN-1 && _idx < LevelObject.ROBOT+1);
}

/// @func   levelObjectIdxIsBlock({enum.LevelObject} idx);
/// @desc   Returns whether the level object index is a block.
function levelObjectIdxIsBlock(_idx)
{
	return (_idx > LevelObject.WHITE_BLOCK-1 && _idx < LevelObject.BLACK_CRYSTAL_BLOCK+1);
}

/// @func   levelObjectIdxIsCollectable({enum.LevelObject} idx);
/// @desc   Returns whether the level object index is a collectable.
function levelObjectIdxIsCollectable(_idx)
{
	return (_idx > LevelObject.STAR-1 && _idx < LevelObject.STAR_DISK+1);
}

/// @func   levelObjectIdxIsPortal({enum.LevelObject} idx);
/// @desc   Returns whether the level object index is a portal.
function levelObjectIdxIsPortal(_idx)
{
	return ((_idx > LevelObject.RED_PORTAL-1 && _idx < LevelObject.BLUE_PORTAL+1) || _idx == LevelObject.SPAWN_PORTAL || _idx == LevelObject.END_PORTAL);
}

/// @func   levelObjectIdxIsContraption({enum.LevelObject} idx);
/// @desc   Returns whether the level object index is a contraption.
function levelObjectIdxIsContraption(_idx)
{
	return (_idx > LevelObject.CHECK_POINT-1 && _idx < LevelObject.GADGET_MACHINE_BLACK_LASER+1);
}

/// @func   levelObjectIdxIsObject({enum.LevelObject} idx);
/// @desc   Returns whether the level object index is an object.
function levelObjectIdxIsObject(_idx)
{
	return (_idx > LevelObject.WHITE_BLOCK-1 || (_idx > LevelObject.SPAWN_PORTAL-1 && _idx < LevelObject.STAR_DISK+1));
}

/// @func	saveLevelScore({room} roomLevel);
function saveLevelScore(_roomLevel)
{
	// If not a custom level
	if (!roomIsCustomLevel(_roomLevel))
	{
		// Open save
		var _file = file_text_open_write("save-data.txt");
	
		// Parse save file
		var _jsonString = file_text_read_string(_file);
		var _saveData = json_parse(_jsonString);
	
		// Update level scores
		switch (_roomLevel)
		{
			case rLevelMain01:
				global.currentLevelStarsCollected = _saveData.levelMain01Stars;
				global.currentLevelStardisksCollected = _saveData.levelMain01Stardisks;
				global.currentLevelFastestTimes = _saveData.levelMain01FastestTimes;
				global.currentLevelEscapeScores = _saveData.levelMain01EscapeScores;
				global.currentLevelMarkScores = _saveData.levelMain01MarkScores;
				global.currentLevelTraceScores = _saveData.levelMain01TraceScores;
				global.currentLevelMarks = _saveData.levelMain01Marks;
				global.currentLevelTraces = _saveData.levelMain01Traces;
				break;
			case rLevelMain02:
				global.currentLevelStarsCollected = _saveData.levelMain02Stars;
				global.currentLevelStardisksCollected = _saveData.levelMain02Stardisks;
				global.currentLevelFastestTimes = _saveData.levelMain02FastestTimes;
				global.currentLevelEscapeScores = _saveData.levelMain02EscapeScores;
				global.currentLevelMarkScores = _saveData.levelMain02MarkScores;
				global.currentLevelTraceScores = _saveData.levelMain02TraceScores;
				global.currentLevelMarks = _saveData.levelMain02Marks;
				global.currentLevelTraces = _saveData.levelMain02Traces;
				break;
			case rLevelMain03:
				global.currentLevelStarsCollected = _saveData.levelMain03Stars;
				global.currentLevelStardisksCollected = _saveData.levelMain03Stardisks;
				global.currentLevelFastestTimes = _saveData.levelMain03FastestTimes;
				global.currentLevelEscapeScores = _saveData.levelMain03EscapeScores;
				global.currentLevelMarkScores = _saveData.levelMain03MarkScores;
				global.currentLevelTraceScores = _saveData.levelMain03TraceScores;
				global.currentLevelMarks = _saveData.levelMain03Marks;
				global.currentLevelTraces = _saveData.levelMain03Traces;
				break;
			case rLevelMain04:
				global.currentLevelStarsCollected = _saveData.levelMain04Stars;
				global.currentLevelStardisksCollected = _saveData.levelMain04Stardisks;
				global.currentLevelFastestTimes = _saveData.levelMain04FastestTimes;
				global.currentLevelEscapeScores = _saveData.levelMain04EscapeScores;
				global.currentLevelMarkScores = _saveData.levelMain04MarkScores;
				global.currentLevelTraceScores = _saveData.levelMain04TraceScores;
				global.currentLevelMarks = _saveData.levelMain04Marks;
				global.currentLevelTraces = _saveData.levelMain04Traces;
				break;
			case rLevelMain05:
				global.currentLevelStarsCollected = _saveData.levelMain05Stars;
				global.currentLevelStardisksCollected = _saveData.levelMain05Stardisks;
				global.currentLevelFastestTimes = _saveData.levelMain05FastestTimes;
				global.currentLevelEscapeScores = _saveData.levelMain05EscapeScores;
				global.currentLevelMarkScores = _saveData.levelMain05MarkScores;
				global.currentLevelTraceScores = _saveData.levelMain05TraceScores;
				global.currentLevelMarks = _saveData.levelMain05Marks;
				global.currentLevelTraces = _saveData.levelMain05Traces;
				break;
			case rLevelMain06:
				global.currentLevelStarsCollected = _saveData.levelMain06Stars;
				global.currentLevelStardisksCollected = _saveData.levelMain06Stardisks;
				global.currentLevelFastestTimes = _saveData.levelMain06FastestTimes;
				global.currentLevelEscapeScores = _saveData.levelMain06EscapeScores;
				global.currentLevelMarkScores = _saveData.levelMain06MarkScores;
				global.currentLevelTraceScores = _saveData.levelMain06TraceScores;
				global.currentLevelMarks = _saveData.levelMain06Marks;
				global.currentLevelTraces = _saveData.levelMain06Traces;
				break;
			case rLevelMain07:
				global.currentLevelStarsCollected = _saveData.levelMain07Stars;
				global.currentLevelStardisksCollected = _saveData.levelMain07Stardisks;
				global.currentLevelFastestTimes = _saveData.levelMain07FastestTimes;
				global.currentLevelEscapeScores = _saveData.levelMain07EscapeScores;
				global.currentLevelMarkScores = _saveData.levelMain07MarkScores;
				global.currentLevelTraceScores = _saveData.levelMain07TraceScores;
				global.currentLevelMarks = _saveData.levelMain07Marks;
				global.currentLevelTraces = _saveData.levelMain07Traces;
				break;
			case rLevelMain08:
				global.currentLevelStarsCollected = _saveData.levelMain08Stars;
				global.currentLevelStardisksCollected = _saveData.levelMain08Stardisks;
				global.currentLevelFastestTimes = _saveData.levelMain08FastestTimes;
				global.currentLevelEscapeScores = _saveData.levelMain08EscapeScores;
				global.currentLevelMarkScores = _saveData.levelMain08MarkScores;
				global.currentLevelTraceScores = _saveData.levelMain08TraceScores;
				global.currentLevelMarks = _saveData.levelMain08Marks;
				global.currentLevelTraces = _saveData.levelMain08Traces;
				break;
			case rLevelMain09:
				global.currentLevelStarsCollected = _saveData.levelMain09Stars;
				global.currentLevelStardisksCollected = _saveData.levelMain09Stardisks;
				global.currentLevelFastestTimes = _saveData.levelMain09FastestTimes;
				global.currentLevelEscapeScores = _saveData.levelMain09EscapeScores;
				global.currentLevelMarkScores = _saveData.levelMain09MarkScores;
				global.currentLevelTraceScores = _saveData.levelMain09TraceScores;
				global.currentLevelMarks = _saveData.levelMain09Marks;
				global.currentLevelTraces = _saveData.levelMain09Traces;
				break;
			case rLevelMain10:
				global.currentLevelStarsCollected = _saveData.levelMain10Stars;
				global.currentLevelStardisksCollected = _saveData.levelMain10Stardisks;
				global.currentLevelFastestTimes = _saveData.levelMain10FastestTimes;
				global.currentLevelEscapeScores = _saveData.levelMain10EscapeScores;
				global.currentLevelMarkScores = _saveData.levelMain10MarkScores;
				global.currentLevelTraceScores = _saveData.levelMain10TraceScores;
				global.currentLevelMarks = _saveData.levelMain10Marks;
				global.currentLevelTraces = _saveData.levelMain10Traces;
				break;
			case rLevelMain11:
				global.currentLevelStarsCollected = _saveData.levelMain11Stars;
				global.currentLevelStardisksCollected = _saveData.levelMain11Stardisks;
				global.currentLevelFastestTimes = _saveData.levelMain11FastestTimes;
				global.currentLevelEscapeScores = _saveData.levelMain11EscapeScores;
				global.currentLevelMarkScores = _saveData.levelMain11MarkScores;
				global.currentLevelTraceScores = _saveData.levelMain11TraceScores;
				global.currentLevelMarks = _saveData.levelMain11Marks;
				global.currentLevelTraces = _saveData.levelMain11Traces;
				break;
			case rLevelMain12:
				global.currentLevelStarsCollected = _saveData.levelMain12Stars;
				global.currentLevelStardisksCollected = _saveData.levelMain12Stardisks;
				global.currentLevelFastestTimes = _saveData.levelMain12FastestTimes;
				global.currentLevelEscapeScores = _saveData.levelMain12EscapeScores;
				global.currentLevelMarkScores = _saveData.levelMain12MarkScores;
				global.currentLevelTraceScores = _saveData.levelMain12TraceScores;
				global.currentLevelMarks = _saveData.levelMain12Marks;
				global.currentLevelTraces = _saveData.levelMain12Traces;
				break;
			case rLevelMain13:
				global.currentLevelStarsCollected = _saveData.levelMain13Stars;
				global.currentLevelStardisksCollected = _saveData.levelMain13Stardisks;
				global.currentLevelFastestTimes = _saveData.levelMain13FastestTimes;
				global.currentLevelEscapeScores = _saveData.levelMain13EscapeScores;
				global.currentLevelMarkScores = _saveData.levelMain13MarkScores;
				global.currentLevelTraceScores = _saveData.levelMain13TraceScores;
				global.currentLevelMarks = _saveData.levelMain13Marks;
				global.currentLevelTraces = _saveData.levelMain13Traces;
				break;
			case rLevelMain14:
				global.currentLevelStarsCollected = _saveData.levelMain14Stars;
				global.currentLevelStardisksCollected = _saveData.levelMain14Stardisks;
				global.currentLevelFastestTimes = _saveData.levelMain14FastestTimes;
				global.currentLevelEscapeScores = _saveData.levelMain14EscapeScores;
				global.currentLevelMarkScores = _saveData.levelMain14MarkScores;
				global.currentLevelTraceScores = _saveData.levelMain14TraceScores;
				global.currentLevelMarks = _saveData.levelMain14Marks;
				global.currentLevelTraces = _saveData.levelMain14Traces;
				break;
			case rLevelMain15:
				global.currentLevelStarsCollected = _saveData.levelMain15Stars;
				global.currentLevelStardisksCollected = _saveData.levelMain15Stardisks;
				global.currentLevelFastestTimes = _saveData.levelMain15FastestTimes;
				global.currentLevelEscapeScores = _saveData.levelMain15EscapeScores;
				global.currentLevelMarkScores = _saveData.levelMain15MarkScores;
				global.currentLevelTraceScores = _saveData.levelMain15TraceScores;
				global.currentLevelMarks = _saveData.levelMain15Marks;
				global.currentLevelTraces = _saveData.levelMain15Traces;
				break;
			case rLevelMain16:
				global.currentLevelStarsCollected = _saveData.levelMain16Stars;
				global.currentLevelStardisksCollected = _saveData.levelMain16Stardisks;
				global.currentLevelFastestTimes = _saveData.levelMain16FastestTimes;
				global.currentLevelEscapeScores = _saveData.levelMain16EscapeScores;
				global.currentLevelMarkScores = _saveData.levelMain16MarkScores;
				global.currentLevelTraceScores = _saveData.levelMain16TraceScores;
				global.currentLevelMarks = _saveData.levelMain16Marks;
				global.currentLevelTraces = _saveData.levelMain16Traces;
				break;
		}
	
		// Close save
		file_text_close(_file);
	}
}

/// @func	loadLevelScores({room} roomLevel);
function loadLevelScores(_roomLevel)
{
	// If not a custom level
	if (!roomIsCustomLevel(_roomLevel))
	{
		// Open save
		var _file = file_text_open_read("save-data.txt");
	
		// Parse save file
		var _jsonString = file_text_read_string(_file);
		var _saveData = json_parse(_jsonString);
	
		// Update level scores
		switch (_roomLevel)
		{
			case rLevelMain01:
				global.currentLevelStarsCollected = _saveData.levelMain01Stars;
				global.currentLevelStardisksCollected = _saveData.levelMain01Stardisks;
				global.currentLevelFastestTimes = _saveData.levelMain01FastestTimes;
				global.currentLevelEscapeScores = _saveData.levelMain01EscapeScores;
				global.currentLevelMarkScores = _saveData.levelMain01MarkScores;
				global.currentLevelTraceScores = _saveData.levelMain01TraceScores;
				global.currentLevelMarks = _saveData.levelMain01Marks;
				global.currentLevelTraces = _saveData.levelMain01Traces;
				break;
			case rLevelMain02:
				global.currentLevelStarsCollected = _saveData.levelMain02Stars;
				global.currentLevelStardisksCollected = _saveData.levelMain02Stardisks;
				global.currentLevelFastestTimes = _saveData.levelMain02FastestTimes;
				global.currentLevelEscapeScores = _saveData.levelMain02EscapeScores;
				global.currentLevelMarkScores = _saveData.levelMain02MarkScores;
				global.currentLevelTraceScores = _saveData.levelMain02TraceScores;
				global.currentLevelMarks = _saveData.levelMain02Marks;
				global.currentLevelTraces = _saveData.levelMain02Traces;
				break;
			case rLevelMain03:
				global.currentLevelStarsCollected = _saveData.levelMain03Stars;
				global.currentLevelStardisksCollected = _saveData.levelMain03Stardisks;
				global.currentLevelFastestTimes = _saveData.levelMain03FastestTimes;
				global.currentLevelEscapeScores = _saveData.levelMain03EscapeScores;
				global.currentLevelMarkScores = _saveData.levelMain03MarkScores;
				global.currentLevelTraceScores = _saveData.levelMain03TraceScores;
				global.currentLevelMarks = _saveData.levelMain03Marks;
				global.currentLevelTraces = _saveData.levelMain03Traces;
				break;
			case rLevelMain04:
				global.currentLevelStarsCollected = _saveData.levelMain04Stars;
				global.currentLevelStardisksCollected = _saveData.levelMain04Stardisks;
				global.currentLevelFastestTimes = _saveData.levelMain04FastestTimes;
				global.currentLevelEscapeScores = _saveData.levelMain04EscapeScores;
				global.currentLevelMarkScores = _saveData.levelMain04MarkScores;
				global.currentLevelTraceScores = _saveData.levelMain04TraceScores;
				global.currentLevelMarks = _saveData.levelMain04Marks;
				global.currentLevelTraces = _saveData.levelMain04Traces;
				break;
			case rLevelMain05:
				global.currentLevelStarsCollected = _saveData.levelMain05Stars;
				global.currentLevelStardisksCollected = _saveData.levelMain05Stardisks;
				global.currentLevelFastestTimes = _saveData.levelMain05FastestTimes;
				global.currentLevelEscapeScores = _saveData.levelMain05EscapeScores;
				global.currentLevelMarkScores = _saveData.levelMain05MarkScores;
				global.currentLevelTraceScores = _saveData.levelMain05TraceScores;
				global.currentLevelMarks = _saveData.levelMain05Marks;
				global.currentLevelTraces = _saveData.levelMain05Traces;
				break;
			case rLevelMain06:
				global.currentLevelStarsCollected = _saveData.levelMain06Stars;
				global.currentLevelStardisksCollected = _saveData.levelMain06Stardisks;
				global.currentLevelFastestTimes = _saveData.levelMain06FastestTimes;
				global.currentLevelEscapeScores = _saveData.levelMain06EscapeScores;
				global.currentLevelMarkScores = _saveData.levelMain06MarkScores;
				global.currentLevelTraceScores = _saveData.levelMain06TraceScores;
				global.currentLevelMarks = _saveData.levelMain06Marks;
				global.currentLevelTraces = _saveData.levelMain06Traces;
				break;
			case rLevelMain07:
				global.currentLevelStarsCollected = _saveData.levelMain07Stars;
				global.currentLevelStardisksCollected = _saveData.levelMain07Stardisks;
				global.currentLevelFastestTimes = _saveData.levelMain07FastestTimes;
				global.currentLevelEscapeScores = _saveData.levelMain07EscapeScores;
				global.currentLevelMarkScores = _saveData.levelMain07MarkScores;
				global.currentLevelTraceScores = _saveData.levelMain07TraceScores;
				global.currentLevelMarks = _saveData.levelMain07Marks;
				global.currentLevelTraces = _saveData.levelMain07Traces;
				break;
			case rLevelMain08:
				global.currentLevelStarsCollected = _saveData.levelMain08Stars;
				global.currentLevelStardisksCollected = _saveData.levelMain08Stardisks;
				global.currentLevelFastestTimes = _saveData.levelMain08FastestTimes;
				global.currentLevelEscapeScores = _saveData.levelMain08EscapeScores;
				global.currentLevelMarkScores = _saveData.levelMain08MarkScores;
				global.currentLevelTraceScores = _saveData.levelMain08TraceScores;
				global.currentLevelMarks = _saveData.levelMain08Marks;
				global.currentLevelTraces = _saveData.levelMain08Traces;
				break;
			case rLevelMain09:
				global.currentLevelStarsCollected = _saveData.levelMain09Stars;
				global.currentLevelStardisksCollected = _saveData.levelMain09Stardisks;
				global.currentLevelFastestTimes = _saveData.levelMain09FastestTimes;
				global.currentLevelEscapeScores = _saveData.levelMain09EscapeScores;
				global.currentLevelMarkScores = _saveData.levelMain09MarkScores;
				global.currentLevelTraceScores = _saveData.levelMain09TraceScores;
				global.currentLevelMarks = _saveData.levelMain09Marks;
				global.currentLevelTraces = _saveData.levelMain09Traces;
				break;
			case rLevelMain10:
				global.currentLevelStarsCollected = _saveData.levelMain10Stars;
				global.currentLevelStardisksCollected = _saveData.levelMain10Stardisks;
				global.currentLevelFastestTimes = _saveData.levelMain10FastestTimes;
				global.currentLevelEscapeScores = _saveData.levelMain10EscapeScores;
				global.currentLevelMarkScores = _saveData.levelMain10MarkScores;
				global.currentLevelTraceScores = _saveData.levelMain10TraceScores;
				global.currentLevelMarks = _saveData.levelMain10Marks;
				global.currentLevelTraces = _saveData.levelMain10Traces;
				break;
			case rLevelMain11:
				global.currentLevelStarsCollected = _saveData.levelMain11Stars;
				global.currentLevelStardisksCollected = _saveData.levelMain11Stardisks;
				global.currentLevelFastestTimes = _saveData.levelMain11FastestTimes;
				global.currentLevelEscapeScores = _saveData.levelMain11EscapeScores;
				global.currentLevelMarkScores = _saveData.levelMain11MarkScores;
				global.currentLevelTraceScores = _saveData.levelMain11TraceScores;
				global.currentLevelMarks = _saveData.levelMain11Marks;
				global.currentLevelTraces = _saveData.levelMain11Traces;
				break;
			case rLevelMain12:
				global.currentLevelStarsCollected = _saveData.levelMain12Stars;
				global.currentLevelStardisksCollected = _saveData.levelMain12Stardisks;
				global.currentLevelFastestTimes = _saveData.levelMain12FastestTimes;
				global.currentLevelEscapeScores = _saveData.levelMain12EscapeScores;
				global.currentLevelMarkScores = _saveData.levelMain12MarkScores;
				global.currentLevelTraceScores = _saveData.levelMain12TraceScores;
				global.currentLevelMarks = _saveData.levelMain12Marks;
				global.currentLevelTraces = _saveData.levelMain12Traces;
				break;
			case rLevelMain13:
				global.currentLevelStarsCollected = _saveData.levelMain13Stars;
				global.currentLevelStardisksCollected = _saveData.levelMain13Stardisks;
				global.currentLevelFastestTimes = _saveData.levelMain13FastestTimes;
				global.currentLevelEscapeScores = _saveData.levelMain13EscapeScores;
				global.currentLevelMarkScores = _saveData.levelMain13MarkScores;
				global.currentLevelTraceScores = _saveData.levelMain13TraceScores;
				global.currentLevelMarks = _saveData.levelMain13Marks;
				global.currentLevelTraces = _saveData.levelMain13Traces;
				break;
			case rLevelMain14:
				global.currentLevelStarsCollected = _saveData.levelMain14Stars;
				global.currentLevelStardisksCollected = _saveData.levelMain14Stardisks;
				global.currentLevelFastestTimes = _saveData.levelMain14FastestTimes;
				global.currentLevelEscapeScores = _saveData.levelMain14EscapeScores;
				global.currentLevelMarkScores = _saveData.levelMain14MarkScores;
				global.currentLevelTraceScores = _saveData.levelMain14TraceScores;
				global.currentLevelMarks = _saveData.levelMain14Marks;
				global.currentLevelTraces = _saveData.levelMain14Traces;
				break;
			case rLevelMain15:
				global.currentLevelStarsCollected = _saveData.levelMain15Stars;
				global.currentLevelStardisksCollected = _saveData.levelMain15Stardisks;
				global.currentLevelFastestTimes = _saveData.levelMain15FastestTimes;
				global.currentLevelEscapeScores = _saveData.levelMain15EscapeScores;
				global.currentLevelMarkScores = _saveData.levelMain15MarkScores;
				global.currentLevelTraceScores = _saveData.levelMain15TraceScores;
				global.currentLevelMarks = _saveData.levelMain15Marks;
				global.currentLevelTraces = _saveData.levelMain15Traces;
				break;
			case rLevelMain16:
				global.currentLevelStarsCollected = _saveData.levelMain16Stars;
				global.currentLevelStardisksCollected = _saveData.levelMain16Stardisks;
				global.currentLevelFastestTimes = _saveData.levelMain16FastestTimes;
				global.currentLevelEscapeScores = _saveData.levelMain16EscapeScores;
				global.currentLevelMarkScores = _saveData.levelMain16MarkScores;
				global.currentLevelTraceScores = _saveData.levelMain16TraceScores;
				global.currentLevelMarks = _saveData.levelMain16Marks;
				global.currentLevelTraces = _saveData.levelMain16Traces;
				break;
		}
	
		// Close save
		file_text_close(_file);
	}
}