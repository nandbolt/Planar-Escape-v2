// If editing level
if (global.editingLevel)
{
	// Create level editor and destroy self
	instance_create_layer(oSpawnPortal.x, oSpawnPortal.y, "Instances", oLevelEditor);
	instance_destroy();
	exit;
}

// If custom level
if (roomIsCustomLevel(room))
{
	// Get rotation grid
	var _rotationGrid = [];
	array_copy(_rotationGrid, 0, global.customRotationGrid, 0, array_length(global.customRotationGrid));
	
	// Loop through instances
	var _gridWidth = floor(room_width / TILE_SIZE) - 2;
	with (all)
	{
		if (x != 0 || y != 0)
		{
			// Grid position
			var _gridX = floor(x / TILE_SIZE) - 1, _gridY = floor(y / TILE_SIZE) - 1;
			var _rotationValue = _rotationGrid[_gridWidth * _gridY + _gridX];
			if (object_is_ancestor(object_index, oActor)) image_index = floor(_rotationValue / 45);
			else image_angle = _rotationValue;
		}
	}
}

// State
levelComplete = false;
levelFailed = false;
levelTime = 0;
fastestTime = 0;
starsCollected = 0;
totalStars = 0;
stardisksCollected = 0;
totalStardisks = 0;
levelName = getLevelName(room);
mode = global.mode;
modeName = getModeName(mode);
entitySpeedName = getEntitySpeedName(global.entitySpeed);
tilesTraced = 0;

// End menu
levelEndMenus = 0;
levelEndMenuDelay = 60;
maxCompleteLevelMenu = 3;
maxFailedLevelMenu = 1;

// Layers
collisionLayer = layer_get_id("CollisionTiles");
gridLayer = layer_get_id("GridBackground");

// Tilemaps
collisionMap = layer_tilemap_get_id("CollisionTiles");
worldMap = layer_tilemap_get_id("WorldTiles"); 

// Checkpoint
checkpoint = noone;
respawnDelay = 60;

// Text
worldTextScale = 2/3;

// Entity meter
playerY = room_height;

// GUI
starAnimCounter = 0;
starAnimSpeed = 0.1;

#region Functions

/// @func	completeLevel();
completeLevel = function()
{
	levelComplete = true;
	alarm[0] = levelEndMenuDelay;
}

/// @func	failLevel();
failLevel = function()
{
	levelFailed = true;
	alarm[0] = levelEndMenuDelay;
}

#endregion

// Camera
instance_create_layer(0, 0, "Instances", oCamera);

#region Box Engine

// Create box engine
boxEngine = instance_create_layer(0, 0, "Instances", be_oBoxEngine);

// Add box collision generator
cgBoxes = new BEBoxContactGen();
cgTiles = new BETileContactGen(layer_tilemap_get_id("CollisionTiles"), TILE_SIZE);
with (boxEngine)
{
	array_push(contactGens, other.cgBoxes);
	array_push(contactGens, other.cgTiles);
}

#endregion

// Hide debug layer
layer_set_visible(collisionLayer, false);
layer_set_visible(gridLayer, false);

// Entity
instance_create_layer(room_width * 0.5, room_height, "Instances", oEntity);

// Start fade
alarm[1] = 60;

// Set world tiles
for (var _y = HALF_TILE_SIZE; _y < room_height; _y += TILE_SIZE)
{
	for (var _x = HALF_TILE_SIZE; _x < room_width; _x += TILE_SIZE)
	{
		// Set collision tile
		tilemap_set_at_pixel(collisionMap, tilemap_get_at_pixel(worldMap, _x, _y), _x, _y);
	}
}

// Update music
updateMusic();

// Hide cursor
window_set_cursor(cr_none);