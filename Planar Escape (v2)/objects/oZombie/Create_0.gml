// Inherit the parent event
event_inherited();

// States
mentalState = ZombieState.WANDER;

// Movement
moveSpeed = 2000;

// Thoughts
prevTilePosition = new BEVector2(floor(x / TILE_SIZE) * TILE_SIZE, floor(y / TILE_SIZE) * TILE_SIZE);

// Set think alarm
alarm[0] = 120;