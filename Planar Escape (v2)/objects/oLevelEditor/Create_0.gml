// Level Grids
gridWidth = floor(room_width / TILE_SIZE) - 2;
gridHeight = floor(room_height / TILE_SIZE) - 2;
levelGrid = array_create(gridWidth * gridHeight, 0);

// Movement
moveInput = new BEVector2();
moveHoldDelay = 20;

// Cursor
cursorIdx = 0;
cursorSprite = sprite_index;
cursorText = "";

#region Functions

///	@func	updateCursor({enum.LevelObject} idx);
updateCursor = function(_idx)
{
	// Clamp index
	if (_idx > LevelObject.ROBOT) cursorIdx = LevelObject.WIRE;
	else if (_idx < LevelObject.WIRE) cursorIdx = LevelObject.ROBOT;
	else cursorIdx = _idx;
	switch (cursorIdx)
	{
		case LevelObject.WIRE:
			cursorSprite = sWirePoint;
			cursorText = "wire";
			break;
		case LevelObject.NONE:
			cursorSprite = sprite_index;
			cursorText = "";
			break;
		case LevelObject.SPAWN_PORTAL:
			cursorSprite = sStartPortal;
			cursorText = "start portal";
			break;
		case LevelObject.END_PORTAL:
			cursorSprite = sPortal;
			cursorText = "end portal";
			break;
		case LevelObject.STAR:
			cursorSprite = sStar;
			cursorText = "star";
			break;
		case LevelObject.STAR_DISK:
			cursorSprite = sStarDisk;
			cursorText = "star disk";
			break;
		case LevelObject.SOLID_WALL:
			cursorSprite = sSolidWall;
			cursorText = "gray wall";
			break;
		case LevelObject.GLASS_WALL:
			cursorSprite = sGlassWall;
			cursorText = "glass wall";
			break;
		case LevelObject.RUBBLE_FLOOR:
			cursorSprite = sRubbleFloor;
			cursorText = "rubble floor";
			break;
		case LevelObject.WHITE_BLOCK:
			cursorSprite = sWhiteBlock;
			cursorText = "white block";
			break;
		case LevelObject.BIG_WHITE_BLOCK:
			cursorSprite = sWhiteBlock;
			cursorText = "big white block";
			break;
		case LevelObject.GLASS_BLOCK:
			cursorSprite = sGlassBlock;
			cursorText = "glass block";
			break;
		case LevelObject.ICE_BLOCK:
			cursorSprite = sIceBlock;
			cursorText = "ice block";
			break;
		case LevelObject.BIG_ICE_BLOCK:
			cursorSprite = sIceBlock;
			cursorText = "big ice block";
			break;
		case LevelObject.DRY_ICE_BLOCK:
			cursorSprite = sDryIceBlock;
			cursorText = "dry ice block";
			break;
		case LevelObject.BROWN_EXPLOSIVE_BLOCK:
			cursorSprite = sExplosiveBlock;
			cursorText = "brown explosive block";
			break;
		case LevelObject.RED_EXPLOSIVE_BLOCK:
			cursorSprite = sRedExplosiveBlock;
			cursorText = "red explosive block";
			break;
		case LevelObject.POWER_BLOCK:
			cursorSprite = sPowerBlock;
			cursorText = "power block";
			break;
		case LevelObject.RED_LASER_BLOCK:
			cursorSprite = sLaserBlock;
			cursorText = "red laser block";
			break;
		case LevelObject.YELLOW_LASER_BLOCK:
			cursorSprite = sCitizenLaserBlock;
			cursorText = "yellow laser block";
			break;
		case LevelObject.GREEN_LASER_BLOCK:
			cursorSprite = sZombieLaserBlock;
			cursorText = "green laser block";
			break;
		case LevelObject.BLUE_LASER_BLOCK:
			cursorSprite = sCopLaserBlock;
			cursorText = "blue laser block";
			break;
		case LevelObject.BLACK_LASER_BLOCK:
			cursorSprite = sEntityLaserBlock;
			cursorText = "black laser block";
			break;
		case LevelObject.BEAM_SPLITTER_BLOCK:
			cursorSprite = sBeamSplitter90Block;
			cursorText = "beamsplitter block";
			break;
		case LevelObject.RED_CRYSTAL_BLOCK:
			cursorSprite = sRedCrystalBlock;
			cursorText = "red crystal block";
			break;
		case LevelObject.YELLOW_CRYSTAL_BLOCK:
			cursorSprite = sYellowCrystalBlock;
			cursorText = "yellow crystal block";
			break;
		case LevelObject.GREEN_CRYSTAL_BLOCK:
			cursorSprite = sGreenCrystalBlock;
			cursorText = "green crystal block";
			break;
		case LevelObject.BLUE_CRYSTAL_BLOCK:
			cursorSprite = sBlueCrystalBlock;
			cursorText = "blue crystal block";
			break;
		case LevelObject.BLACK_CRYSTAL_BLOCK:
			cursorSprite = sBlackCrystalBlock;
			cursorText = "black crystal block";
			break;
		case LevelObject.CHECK_POINT:
			cursorSprite = sCheckPointActive;
			cursorText = "checkpoint";
			break;
		case LevelObject.BUTTON:
			cursorSprite = sButton;
			cursorText = "button";
			break;
		case LevelObject.WHITE_DOOR:
			cursorSprite = sDoor;
			cursorText = "white door";
			break;
		case LevelObject.RED_DOOR:
			cursorSprite = sRedDoor;
			cursorText = "red door";
			break;
		case LevelObject.YELLOW_DOOR:
			cursorSprite = sYellowDoor;
			cursorText = "yellow door";
			break;
		case LevelObject.GREEN_DOOR:
			cursorSprite = sGreenDoor;
			cursorText = "green door";
			break;
		case LevelObject.BLUE_DOOR:
			cursorSprite = sBlueDoor;
			cursorText = "blue door";
			break;
		case LevelObject.BLACK_DOOR:
			cursorSprite = sBlackDoor;
			cursorText = "black door";
			break;
		case LevelObject.POWER_ROD:
			cursorSprite = sPowerRod;
			cursorText = "power rod";
			break;
		case LevelObject.BELT:
			cursorSprite = sBeltForward;
			cursorText = "belt";
			break;
		case LevelObject.GADGET_MACHINE_NONE:
			cursorSprite = sGadgetMachine;
			cursorText = "gadget machine: none";
			break;
		case LevelObject.GADGET_MACHINE_GRAPPLE:
			cursorSprite = sGadgetMachine;
			cursorText = "gadget machine: grapple";
			break;
		case LevelObject.GADGET_MACHINE_RED_LASER:
			cursorSprite = sGadgetMachine;
			cursorText = "gadget machine: red laser";
			break;
		case LevelObject.GADGET_MACHINE_YELLOW_LASER:
			cursorSprite = sGadgetMachine;
			cursorText = "gadget machine: yellow laser";
			break;
		case LevelObject.GADGET_MACHINE_GREEN_LASER:
			cursorSprite = sGadgetMachine;
			cursorText = "gadget machine: green laser";
			break;
		case LevelObject.GADGET_MACHINE_BLUE_LASER:
			cursorSprite = sGadgetMachine;
			cursorText = "gadget machine: blue laser";
			break;
		case LevelObject.GADGET_MACHINE_BLACK_LASER:
			cursorSprite = sGadgetMachine;
			cursorText = "gadget machine: black laser";
			break;
		case LevelObject.RED_PORTAL:
			cursorSprite = sRedPortal;
			cursorText = "red portal";
			break;
		case LevelObject.YELLOW_PORTAL:
			cursorSprite = sYellowPortal;
			cursorText = "yellow portal";
			break;
		case LevelObject.GREEN_PORTAL:
			cursorSprite = sGreenPortal;
			cursorText = "green portal";
			break;
		case LevelObject.BLUE_PORTAL:
			cursorSprite = sBluePortal;
			cursorText = "blue portal";
			break;
		case LevelObject.CITIZEN:
			cursorSprite = sCitizen;
			cursorText = "citizen";
			break;
		case LevelObject.ZOMBIE:
			cursorSprite = sZombie;
			cursorText = "zombie";
			break;
		case LevelObject.COP:
			cursorSprite = sCop;
			cursorText = "cop";
			break;
		case LevelObject.ROBOT:
			cursorSprite = sRobot;
			cursorText = "robot";
			break;
	}
}

#endregion

// Camera
instance_create_layer(0, 0, "Instances", oCamera);

// Destroy all solids
instance_destroy(oSolid);

// Destroy portals
instance_destroy(oPortal);
instance_destroy(oSpawnPortal);

// Update music
updateMusic();