#region Global Variables

// Build
global.version = "1.9";

// Run
global.mode = Mode.ESCAPE;
global.entitySpeed = EntitySpeed.NORMAL;
global.skin = sPlayerDebug;

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

#endregion