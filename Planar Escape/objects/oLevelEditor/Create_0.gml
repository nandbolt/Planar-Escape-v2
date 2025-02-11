// Music
musicIdx = 0;
music = [mEscape, mCreation, mRadiation, mPopulation, mSalvation];
musicNames = ["planar escape", "egress start", "journey's call", "passing through", "is there an end?"];

// Data
levelName = global.customLevelNames[global.customLevelIdx];
levelCreator = global.customLevelCreators[global.customLevelIdx];
levelMusic = global.customLevelMusic[global.customLevelIdx];
for (var _i = 0; _i < array_length(music); _i++)
{
	var _song = music[_i];
	musicIdx = _i;
	if (_song == levelMusic) break;
}

// Modes
paused = false;

// Level Grids
gridWidth = floor(room_width / TILE_SIZE) - 2;
gridHeight = floor(room_height / TILE_SIZE) - 2;
levelGrid = array_create(gridWidth * gridHeight, 0);
wireGrid = array_create(gridWidth * gridHeight, 0);
rotationGrid = [];
if (global.customRotationGrid == -1) global.customRotationGrid = array_create(gridWidth * gridHeight, 0);
array_copy(rotationGrid, 0, global.customRotationGrid, 0, array_length(global.customRotationGrid));
markGrid = global.currentLevelMarks;
traceGrid = global.currentLevelTraces;
levelParentObjects = [oSolid, oPortal, oSpawnPortal, oCollectable, oContraption];

// Grid position
gridX = floor(x / TILE_SIZE) - 1;
gridY = floor(y / TILE_SIZE) - 1;
gridValue = levelGrid[gridWidth * gridY + gridX];

// Movement
moveInput = new BEVector2();
moveHoldDelay = 20;

// Cursor
cursorIdx = 0;
cursorSprite = sprite_index;
cursorText = "empty";
cursorColor = c_red;
cursorRotation = 0;
cursorScale = 1;

// Layers
collisionLayer = layer_get_id("CollisionTiles");
gridLayer = layer_get_id("GridBackground");
worldLayer = layer_get_id("WorldTiles");

// Tilemaps
//collisionMap = layer_tilemap_get_id("CollisionTiles");
worldMap = layer_tilemap_get_id("WorldTiles");
wireMap = layer_tilemap_get_id("WireTiles");

#region Functions

///	@func	changeCursor({enum.LevelObject} idx);
changeCursor = function(_idx)
{
	// Clamp index
	if (_idx > LevelObject.ROBOT) cursorIdx = LevelObject.WIRE;
	else if (_idx < LevelObject.WIRE) cursorIdx = LevelObject.ROBOT;
	else cursorIdx = _idx;
	cursorScale = 1;
	
	// Reset alpha
	with (oSprite)
	{
		image_alpha = 1;
	}
	
	// Cursor idx
	switch (cursorIdx)
	{
		case LevelObject.WIRE:
			cursorSprite = sWirePoint;
			cursorText = "power grid";
			with (oSprite)
			{
				image_alpha = 0.5;
			}
			image_blend = c_yellow;
			break;
		case LevelObject.NONE:
			cursorSprite = sprite_index;
			cursorText = "empty";
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
			cursorScale = 2;
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
			cursorScale = 2;
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
			cursorScale = 2;
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

/// @func	moveCursor({real} dx, {real} dy);
moveCursor = function(_dx, _dy)
{
	// Update position
	x = clamp(x + _dx, TILE_SIZE + HALF_TILE_SIZE, room_width - TILE_SIZE - HALF_TILE_SIZE);
	y = clamp(y + _dy, TILE_SIZE + HALF_TILE_SIZE, room_height - TILE_SIZE - HALF_TILE_SIZE);
	gridX = floor(x / TILE_SIZE) - 1;
	gridY = floor(y / TILE_SIZE) - 1;
	var _gridIdx = gridWidth * gridY + gridX;
	gridValue = levelGrid[_gridIdx];
	
	// Update color
	if (cursorIdx == LevelObject.WIRE)
	{
		cursorColor = c_white;
		image_blend = c_yellow;
	}
	else if (gridValue == 0)
	{
		cursorColor = c_white;
		image_blend = c_white;
	}
	else
	{
		cursorColor = c_red;
		image_blend = c_red;
	}
	
	// If placing a big object
	if (cursorScale == 2)
	{
		if (!(gridX < gridWidth-1 && gridY < gridHeight-1 && levelGrid[_gridIdx+1] == 0 &&
			levelGrid[_gridIdx+gridWidth] == 0 && levelGrid[_gridIdx+gridWidth+1] == 0))
		{
			cursorColor = c_red;
			image_blend = c_red;
		}
		
	}
}

/// @func	placeCursorObject();
placeCursorObject = function()
{
	// Get grid index
	var _gridIdx = gridWidth * gridY + gridX;
	var _cursorScale = cursorScale;
	if (cursorIdx == LevelObject.STAR_DISK) _cursorScale = 1;
	
	// If not placing a wire
	if (cursorIdx != -1)
	{
		// If placing a big object
		if (cursorScale == 2 && (gridX == gridWidth-1 || gridY == gridHeight-1)) return;
		
		// Set sprite for collision check
		sprite_index = cursorSprite;
		image_xscale = _cursorScale;
		image_yscale = _cursorScale;
		
		// If on a sprite
		var _sprites = ds_list_create();
		var _cx = x, _cy = y;
		if (cursorScale == 2)
		{
			_cx += HALF_TILE_SIZE;
			_cy += HALF_TILE_SIZE;
		}
		var _spriteCount = instance_place_list(_cx, _cy, oSprite, _sprites, false);
		for (var _i = 0; _i < _spriteCount; _i++)
		{
			// Get sprite
			var _sprite = _sprites[| _i];
			if (instance_exists(_sprite))
			{
				// If sprite is big
				if (_sprite.image_xscale == 2 || _sprite.sprite_index == sStarDisk)
				{
					// Get sprite grid info
					var _spriteGridX = floor((_sprite.x - HALF_TILE_SIZE) / TILE_SIZE) - 1;
					var _spriteGridY = floor((_sprite.y - HALF_TILE_SIZE) / TILE_SIZE) - 1;
					var _spriteGridIdx = gridWidth * _spriteGridY + _spriteGridX;
					
					// Clear surrounding grid points
					levelGrid[_spriteGridIdx] = 0;
					levelGrid[_spriteGridIdx+1] = 0;
					levelGrid[_spriteGridIdx+gridWidth] = 0;
					levelGrid[_spriteGridIdx+gridWidth+1] = 0;
				}
				instance_destroy(_sprite);
			}
		}
		ds_list_destroy(_sprites);
		
		// Reset sprite
		sprite_index = sLevelEditorCursor;
		image_xscale = 1;
		image_yscale = 1;
		
		// Fill grid space
		levelGrid[_gridIdx] = cursorIdx;
		rotationGrid[_gridIdx] = cursorRotation;
		gridValue = cursorIdx;
		if (cursorScale == 2)
		{
			levelGrid[_gridIdx+1] = cursorIdx;
			levelGrid[_gridIdx+gridWidth] = cursorIdx;
			levelGrid[_gridIdx+gridWidth+1] = cursorIdx;
		}
		cursorColor = c_red;
	
		// Update world tile placement
		if (cursorIdx == LevelObject.SOLID_WALL) tilemap_set_at_pixel(worldMap, 1, x, y);
		else if (cursorIdx == LevelObject.GLASS_WALL) tilemap_set_at_pixel(worldMap, 2, x, y);
		else if (cursorIdx == LevelObject.RUBBLE_FLOOR) tilemap_set_at_pixel(worldMap, 3, x, y);
		else
		{
			tilemap_set_at_pixel(worldMap, 0, x, y);
			if (cursorScale == 2)
			{
				tilemap_set_at_pixel(worldMap, 0, x + TILE_SIZE, y);
				tilemap_set_at_pixel(worldMap, 0, x, y + TILE_SIZE);
				tilemap_set_at_pixel(worldMap, 0, x + TILE_SIZE, y + TILE_SIZE);
			}
		}
		
		// If need to place a sprite
		if (cursorIdx > 0 && cursorIdx != LevelObject.SOLID_WALL && cursorIdx != LevelObject.GLASS_WALL && cursorIdx != LevelObject.RUBBLE_FLOOR)
		{
			with (instance_create_layer(x, y, "Instances", oSprite))
			{
				sprite_index = other.cursorSprite;
				image_angle = other.cursorRotation;
				if (other.cursorScale == 2)
				{
					x += HALF_TILE_SIZE;
					y += HALF_TILE_SIZE;
					image_xscale = _cursorScale;
					image_yscale = _cursorScale;
				}
			}
		}
	}
	// Else toggle wire
	else
	{
		// Fill grid space
		var _on = tilemap_get_at_pixel(wireMap, x, y) == 0;
		if (_on) wireGrid[_gridIdx] = 1;
		else wireGrid[_gridIdx] = 0;
		
		// Set wire
		setWireAutotile(wireMap, x, y, _on);
	}
}

#endregion

// Camera
instance_create_layer(0, 0, "Instances", oCamera);

// Fill grid
for (var _i = 0; _i < array_length(levelGrid); _i++)
{
	// Get position
	var _x = (_i mod gridWidth) * TILE_SIZE + TILE_SIZE + HALF_TILE_SIZE;
	var _y = floor(_i / gridWidth) * TILE_SIZE + TILE_SIZE + HALF_TILE_SIZE;
	
	// Check world tile
	var _tile = tilemap_get_at_pixel(worldMap, _x, _y);
	if (_tile == 1) levelGrid[_i] = LevelObject.SOLID_WALL;
	else if (_tile == 2) levelGrid[_i] = LevelObject.GLASS_WALL;
	else if (_tile == 3) levelGrid[_i] = LevelObject.RUBBLE_FLOOR;
	
	// Check wire tile
	if (tilemap_get_at_pixel(wireMap, _x, _y) != 0) wireGrid[_i] = 1;
}

// Hide debug layer
layer_set_visible(collisionLayer, false);
//layer_set_visible(gridLayer, false);

// Update music
updateMusic();