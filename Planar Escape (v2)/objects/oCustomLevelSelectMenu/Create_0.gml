// Inherit the parent event
event_inherited();

// Level select
levelSelectName = "custom";
customLevelRooms = [
	rLevelCustom01,
];

#region Button Functions

/// @func	editButtonClicked();
editButtonClicked = function()
{
	// Go to selected level
	global.editingLevel = true;
	room_goto(selectedLevel);
}

#endregion

// Create custom levels folder if it doesn't exists
if (!directory_exists("\custom-levels")) directory_create("\custom-levels");

// Gather level files
var _levelFiles = [];
var _fileName = file_find_first(working_directory + "/custom-levels/*.txt", 0);
while (_fileName != "")
{
	array_push(_levelFiles, _fileName);
	_fileName = file_find_next();
}
file_find_close();

// Loop through each level file
var _fileCount = array_length(_levelFiles)
for (var _i = 0; _i < _fileCount; _i++)
{
	// Open level file
	var _file = file_text_open_read(working_directory + "/custom-levels/" + _levelFiles[_i]);
	
	// Parse level file
	var _jsonString = file_text_read_string(_file);
	var _levelData = json_parse(_jsonString);
	
	// Set room level grid
	var _room = customLevelRooms[_i];
	
	// Clear room instances
	room_assign(_room, rLevelCustom);
	
	// Add level objects
	room_instance_add(_room, 0, 0, oLevel);
	for (var _j = 0; _j < array_length(_levelData.levelGrid); _j++)
	{
		// Get value
		var _gridValue = _levelData.levelGrid[_j];
		
		// If index is an object
		if (levelObjectIdxIsObject(_gridValue))
		{
			// Get position
			var _gridWidth = mapWidth - 2;
			var _x = (_j mod _gridWidth) * TILE_SIZE + TILE_SIZE + HALF_TILE_SIZE, _y = floor(_j / _gridWidth) * TILE_SIZE + TILE_SIZE + HALF_TILE_SIZE;
			
			// Add instance to room
			room_instance_add(_room, _x, _y, getLevelObject(_gridValue));
		}
	}
	
	// Set target room for layers to level
	layer_set_target_room(_room);
	
	// Get layers
	var _collisionLayer = layer_get_id("WorldTiles");
	var _wireLayer = layer_get_id("WireTiles");
	var _collisionMap = layer_tilemap_get_id(_collisionLayer);
	var _wireMap = layer_tilemap_get_id(_wireLayer);
	
	// Clear tiles
	for (var _j = 0; _j < array_length(_levelData.levelGrid); _j++)
	{
		// Get position
		var _gridWidth = mapWidth - 2;
		var _x = (_j mod _gridWidth) * TILE_SIZE + TILE_SIZE + HALF_TILE_SIZE, _y = floor(_j / _gridWidth) * TILE_SIZE + TILE_SIZE + HALF_TILE_SIZE;
		
		// Clear tile
		tilemap_set_at_pixel(_collisionMap, 0, _x, _y);
		tilemap_set_at_pixel(_wireMap, 0, _x, _y);
	}
	
	// Loop through level grid
	for (var _j = 0; _j < array_length(_levelData.levelGrid); _j++)
	{
		// Get value
		var _gridValue = _levelData.levelGrid[_j];
		var _wireValue = _levelData.wireGrid[_j];
		
		// Continue if empty
		if (_gridValue == 0 && _wireValue == 0) continue;
		
		// Get position
		var _gridWidth = mapWidth - 2;
		var _x = (_j mod _gridWidth) * TILE_SIZE + TILE_SIZE + HALF_TILE_SIZE, _y = floor(_j / _gridWidth) * TILE_SIZE + TILE_SIZE + HALF_TILE_SIZE;
		
		// Set grid value in room
		if (_gridValue == LevelObject.SOLID_WALL) tilemap_set_at_pixel(_collisionMap, 1, _x, _y);
		else if (_gridValue == LevelObject.GLASS_WALL) tilemap_set_at_pixel(_collisionMap, 2, _x, _y);
		else if (_gridValue == LevelObject.RUBBLE_FLOOR) tilemap_set_at_pixel(_collisionMap, 3, _x, _y);
		
		// Set grid value in room
		if (_wireValue == 1) setWireAutotile(_wireMap, _x, _y, true);
	}
	
	// Reset target room
	layer_reset_target_room();
	
	// Add room to levels
	array_push(levels, _room);
	
	// Close file
	file_text_close(_file);
}

// Add last level (empty)
array_push(levels, rLevelEmpty);

// Init play + edit buttons
playButton.width *= 0.5;
editButton = new GuiButton(guiController, "edit", playButton.x + playButton.width + 4, playButton.y, editButtonClicked);
editButton.width = playButton.width;

// Init
initLevelSelection();