// Inherit the parent event
event_inherited();

// Level select
levelSelectName = "custom";
customLevelRooms = [
	rLevelCustom01,
	rLevelCustom02,
	rLevelCustom03,
	rLevelCustom04,
	rLevelCustom05,
	rLevelCustom06,
	rLevelCustom07,
	rLevelCustom08,
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
for (var _i = 0; _i < array_length(_levelFiles); _i++)
{
	// Open level file
	var _file = file_text_open_read(working_directory + "/custom-levels/" + _levelFiles[_i]);
	
	// Parse level file
	var _jsonString = file_text_read_string(_file);
	var _levelData = json_parse(_jsonString);
	
	// Set room level grid
	var _room = customLevelRooms[_i];
	
	// Clear target room
	room_assign(_room, rLevelEmpty);
	
	// Set target room for layers to level
	layer_set_target_room(_room);
	
	// Get layers
	var _collisionLayer = layer_get_id("WorldTiles");
	var _collisionMap = layer_tilemap_get_id(_collisionLayer);
	
	// Level data
	//var _levelData = 
	//{
	//	version : global.version,
	//	name : oLevelEditor.levelName,
	//	levelGrid : oLevelEditor.levelGrid,
	//	wireGrid : oLevelEditor.wireGrid,
	//}
	
	// Loop through level grid
	for (var _i = 0; _i < array_length(_levelData.levelGrid); _i++)
	{
		// Get value
		var _gridValue = _levelData.levelGrid[_i];
		
		// Continue if empty
		if (_gridValue == 0) continue;
		
		// Get position
		var _gridWidth = mapWidth - 2;
		var _x = (_i mod _gridWidth) * TILE_SIZE + TILE_SIZE + HALF_TILE_SIZE, _y = floor(_i / _gridWidth) * TILE_SIZE + TILE_SIZE + HALF_TILE_SIZE;
		
		// If world tile
		if (_gridValue == LevelObject.SOLID_WALL) tilemap_set_at_pixel(_collisionMap, 1, _x, _y);
		else if (_gridValue == LevelObject.GLASS_WALL) tilemap_set_at_pixel(_collisionMap, 2, _x, _y);
		else if (_gridValue == LevelObject.RUBBLE_FLOOR) tilemap_set_at_pixel(_collisionMap, 3, _x, _y);
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