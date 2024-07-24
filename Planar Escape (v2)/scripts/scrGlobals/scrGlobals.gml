#region Global Variables

// Build
global.version = "1.9";

// Run
global.mode = Mode.ESCAPE;
global.entitySpeed = EntitySpeed.NORMAL;
global.skin = sPlayer;

// Level editor
global.editingLevel = false;

#endregion

#region Macros

#macro TILE_SIZE 12
#macro HALF_TILE_SIZE 6

#endregion

#region Enums

enum Power
{
	OFF,
	RED,
	GREEN,
	BLUE,
	YELLOW,
	BLACK,
}

enum GadgetType
{
	NONE,
	GRAPPLE,
	BLASTER,
}

enum ZombieState
{
	WANDER,
	ALERTED,
	CHASE,
}

enum CopState
{
	PATROL,
	ALERTED,
	CHASE,
}

enum CitizenState
{
	WANDER,
	ALERTED,
	FLEE,
}

enum Mode
{
	ESCAPE,
	TRACE,
}

enum EntitySpeed
{
	STASIS,
	NORMAL,
	HYPER,
}

enum LevelObject
{
	WIRE = -1,						// Unique, used for the wiremap
	NONE,							// Empty, used to erase
	SPAWN_PORTAL,					// Level portals
	END_PORTAL,
	STAR,							// Collectables
	STAR_DISK,
	SOLID_WALL,						// World tiles
	GLASS_WALL,
	RUBBLE_FLOOR,
	WHITE_BLOCK,					// Blocks
	BIG_WHITE_BLOCK,
	GLASS_BLOCK,
	ICE_BLOCK,
	BIG_ICE_BLOCK,
	DRY_ICE_BLOCK,
	BROWN_EXPLOSIVE_BLOCK,
	RED_EXPLOSIVE_BLOCK,
	POWER_BLOCK,
	RED_LASER_BLOCK,
	YELLOW_LASER_BLOCK,
	GREEN_LASER_BLOCK,
	BLUE_LASER_BLOCK,
	BLACK_LASER_BLOCK,
	BEAM_SPLITTER_BLOCK,
	RED_CRYSTAL_BLOCK,
	YELLOW_CRYSTAL_BLOCK,
	GREEN_CRYSTAL_BLOCK,
	BLUE_CRYSTAL_BLOCK,
	BLACK_CRYSTAL_BLOCK,
	CHECK_POINT,					// Contraptions
	BUTTON,
	WHITE_DOOR,
	RED_DOOR,
	YELLOW_DOOR,
	GREEN_DOOR,
	BLUE_DOOR,
	BLACK_DOOR,
	POWER_ROD,
	BELT,
	GADGET_MACHINE_NONE,
	GADGET_MACHINE_GRAPPLE,
	GADGET_MACHINE_RED_LASER,
	GADGET_MACHINE_YELLOW_LASER,
	GADGET_MACHINE_GREEN_LASER,
	GADGET_MACHINE_BLUE_LASER,
	GADGET_MACHINE_BLACK_LASER,
	RED_PORTAL,						// Portals
	YELLOW_PORTAL,
	GREEN_PORTAL,
	BLUE_PORTAL,
	CITIZEN,						// Actors
	ZOMBIE,
	COP,
	ROBOT,
}

#endregion