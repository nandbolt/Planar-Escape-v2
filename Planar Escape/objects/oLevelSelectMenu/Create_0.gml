// Inherit the parent event
event_inherited();

// Level select
levelSelectName = "???";
global.customLevelIdx = 0;

// Map
mapWidth = 29;
mapHeight = 90;
mapDrawWidth = mapWidth * 3;
mapDrawHeight = mapHeight * 3;
mapArray = array_create(mapWidth * mapHeight, 0);

// Levels
levels = [];
levelSelectButtons = [];
selectedLevelIdx = 0;
selectedLevel = rLevelMain01;
selectedLevelName = getLevelName(selectedLevel);
selectedLevelCreator = "";

// High scores
highscoreTextIdx = 0;
highscoreTexts = ["fastest times", "escape scores", "mark scores", "trace scores"];
highscoreText = highscoreTexts[highscoreTextIdx];
highscores = array_create(3, -1);
highscores = [30, 31, 32];
stars = 0;
stardisks = 0;
maxStars = 0;
maxStardisks = 0;
highscoreHoverSpeed = 0.005;
highscoreHoverRange = 2;
showStarCount = true;

#region Functions

/// @func	selectLevel({room} room);
selectLevel = function(_room)
{
	// Exit if room doesn't exist
	if (!room_exists(_room)) return;
	
	// If room is empty
	if (_room == rLevelEmpty)
	{
		scoreButton.locked = true;
		playButton.locked = true;
		modeButton.locked = true;
		entitySpeedButton.locked = true;
	}
	else
	{
		scoreButton.locked = false;
		playButton.locked = false;
		modeButton.locked = false;
		entitySpeedButton.locked = false;
	}
	
	// Custom level index
	for (var _i = 0; _i < array_length(levels); _i++)
	{
		if (levels[_i] == _room)
		{
			selectedLevelIdx = _i;
			global.customLevelIdx = selectedLevelIdx;
			break;
		}
	}
	
	// Set room
	selectedLevel = _room;
	selectedLevelName = getLevelName(_room);
	selectedLevelCreator = getLevelCreator(_room);
	getMapData(_room);
}

/// @func	getMapData({room} room);
getMapData = function(_room)
{
	// Reset map data
	for (var _i = 0; _i < array_length(mapArray); _i++)
	{
		mapArray[_i] = 0;
	}
	
	// Set target room for layers to level
	layer_set_target_room(_room);
	
	// Get layers
	var _collisionLayer = layer_get_id("WorldTiles");
	var _collisionMap = layer_tilemap_get_id(_collisionLayer);
	
	// Loop through tilemap
	for (var _j = 0; _j < mapHeight; _j++)
	{
		for (var _i = 0; _i < mapWidth; _i++)
		{
			// Get position
			var _x = _i * TILE_SIZE, _y = _j * TILE_SIZE;
			
			// Get tile
			var _tile = tilemap_get_at_pixel(_collisionMap, _x, _y);
			mapArray[_j * mapWidth + _i] = _tile;
		}
	}
	
	// Count stars
	var _stars = 0;
	var _layers = layer_get_all();
	for (var _i = 0; _i < array_length(_layers); _i++)
	{
		var _layer = _layers[_i];
		var _layerElements = layer_get_all_elements(_layer);
		for (var _j = 0; _j < array_length(_layerElements); _j++)
		{
			var _layerElement = _layerElements[_j];
			var _layerElementType = layer_get_element_type(_layerElement);
			if (_layerElementType == layerelementtype_instance)
			{
				if (_layer == layer_get_id("CollectableInstances")) _stars++;
			}
		}
	}
	maxStars = _stars;
	
	// Reset target room
	layer_reset_target_room();
}

/// @func	drawMap({real} startX, {real} startY);
drawMap = function(_startX, _startY)
{
	// Loop through map
	for (var _i = 0; _i < array_length(mapArray); _i++)
	{
		// Get draw position
		var _x = _startX + (_i mod mapWidth) * 3, _y = _startY + floor(_i / mapWidth) * 3;
		
		// Draw based off of value
		switch (mapArray[_i])
		{
			case 1:
				draw_sprite_stretched_ext(sPixel, 0, _x, _y, 3, 3, c_dkgray, 1);
				break;
			case 2:
				draw_sprite_stretched_ext(sPixel, 0, _x, _y, 3, 3, c_gray, 1);
				break;
			case 3:
				draw_sprite_stretched_ext(sPixel, 0, _x, _y, 3, 3, c_ltgray, 1);
				break;
		}
	}
}

/// @func initLevelSelection();
initLevelSelection = function()
{
	// Open save
	var _file = file_text_open_read("save-data.txt");
	
	// Parse save file
	var _jsonString = file_text_read_string(_file);
	var _saveData = json_parse(_jsonString);
	
	// Close save
	file_text_close(_file);
	
	// Create level select buttons
	for (var _i = 0; _i < array_length(levels); _i++)
	{
		// Get position
		var _spacing = 34;
		var _x = 16 + (_i mod 8) * _spacing, _y = 36 + floor(_i / 8) * _spacing;
		
		// Make button
		var _level = levels[_i], _buttonName = string(_i + 1);
		if (_level == rLevelEmpty) _buttonName = "++";
		var _button = new GuiButton(guiController, _buttonName, _x, _y, levelSelectButtonClicked)
		_button.width = 24;
		
		// Set locks
		if (room == rMainLevelSelectMenu)
		{	
			// Check unlocks
			switch (_i)
			{
				case 1:
					// If no score
					if (_saveData.levelMain01FastestTimes[0] <= 0)
					{
						_button.locked = true;
						_button.hoverText = "escape level 1 to unlock!";
					}
					break;
				case 2:
					// If no score
					if (_saveData.levelMain02FastestTimes[0] <= 0)
					{
						_button.locked = true;
						_button.hoverText = "escape level 2 to unlock!";
					}
					break;
				case 3:
					// If no score
					if (_saveData.levelMain03FastestTimes[0] <= 0)
					{
						_button.locked = true;
						_button.hoverText = "escape level 3 to unlock!";
					}
					break;
				case 4:
					// If no score
					if (_saveData.levelMain04FastestTimes[0] <= 0)
					{
						_button.locked = true;
						_button.hoverText = "escape level 4 to unlock!";
					}
					break;
				case 5:
					// If no score
					if (_saveData.levelMain05FastestTimes[0] <= 0)
					{
						_button.locked = true;
						_button.hoverText = "escape level 5 to unlock!";
					}
					break;
				case 6:
					// If no score
					if (_saveData.levelMain06FastestTimes[0] <= 0)
					{
						_button.locked = true;
						_button.hoverText = "escape level 6 to unlock!";
					}
					break;
				case 7:
					// If no score
					if (_saveData.levelMain07FastestTimes[0] <= 0)
					{
						_button.locked = true;
						_button.hoverText = "escape level 7 to unlock!";
					}
					break;
				case 8:
				case 9:
				case 10:
				case 11:
				case 12:
				case 13:
				case 14:
				case 15:
					_button.locked = true;
					_button.hoverText = "coming soon!";
					break;
			}
		}
		
		// Add button to list
		array_push(levelSelectButtons, _button);
		
		// Break if at max
		if (_i >= 63) break;
	}
	
	// Select first level
	selectedLevel = levels[selectedLevelIdx];
	selectLevel(selectedLevel);
	
	// Change scores
	changeScores();
}

/// @func	changeScores();
changeScores = function()
{
	loadLevelScores(selectedLevel);
	if (highscoreTextIdx == 0) highscores = global.currentLevelFastestTimes;
	else if (highscoreTextIdx == 1) highscores = global.currentLevelEscapeScores;
	else if (highscoreTextIdx == 2) highscores = global.currentLevelMarkScores;
	else if (highscoreTextIdx == 3) highscores = global.currentLevelTraceScores;
	stars = global.currentLevelStarsCollected;
	stardisks = global.currentLevelStardisksCollected;
}

#region Button Functions

/// @func	backButtonClicked();
backButtonClicked = function()
{
	// Go to first level in campaign
	room_goto(rMainMenu);
}

/// @func	playButtonClicked();
playButtonClicked = function()
{
	// Go to first level in campaign
	global.editingLevel = false;
	room_goto(selectedLevel);
}

/// @func	modeButtonClicked();
modeButtonClicked = function()
{
	// Change mode
	if (global.mode == Mode.ESCAPE) global.mode = Mode.MARK;
	else if (global.mode == Mode.MARK) global.mode = Mode.TRACE;
	else if (global.mode == Mode.TRACE) global.mode = Mode.ESCAPE;
	modeButton.name = "mode:" + getModeName(global.mode);
	modeButton.hoverText = getModeDescription(global.mode);
}

/// @func	entitySpeedButtonClicked();
entitySpeedButtonClicked = function()
{
	// Change mode
	if (global.entitySpeed == EntitySpeed.NORMAL) global.entitySpeed = EntitySpeed.HYPER;
	else if (global.entitySpeed == EntitySpeed.HYPER) global.entitySpeed = EntitySpeed.STASIS;
	else if (global.entitySpeed == EntitySpeed.STASIS) global.entitySpeed = EntitySpeed.NORMAL;
	entitySpeedButton.name = "speed:" + getEntitySpeedName(global.entitySpeed);
	entitySpeedButton.hoverText = getEntitySpeedDescription(global.entitySpeed);
}

/// @func	levelSelectButtonClicked();
levelSelectButtonClicked = function()
{
	// Loop through buttons
	for (var _i = 0; _i < array_length(levelSelectButtons); _i++)
	{
		// If button has focus
		var _button = levelSelectButtons[_i];
		if (_button.hasFocus())
		{
			// Select the level and break
			selectLevel(levels[_i]);
			break;
		}
	}
	
	// Change scores
	changeScores();
}

/// @func	scoreButtonClicked();
scoreButtonClicked = function()
{
	// Change mode
	if (highscoreTextIdx >= array_length(highscoreTexts)-1) highscoreTextIdx = 0;
	else highscoreTextIdx++;
	highscoreText = highscoreTexts[highscoreTextIdx];
	scoreButton.name = highscoreText;
	
	// Change scores
	changeScores();
}

#endregion

#endregion

// Init gui buttons
var _x = guiCenterX + 16 + mapDrawWidth + 8, _y = 28 + mapDrawHeight - 16 - 8 - 32 * 6;
scoreButton = new GuiButton(guiController, highscoreText, _x, _y, scoreButtonClicked);
scoreButton.hoverText = "scores";
_y = 28 + mapDrawHeight - 16 - 32 * 2;
modeButton = new GuiButton(guiController, "mode:escape", _x, _y, modeButtonClicked);
modeButton.hoverText = getModeDescription(Mode.ESCAPE);
_y += 32;
entitySpeedButton = new GuiButton(guiController, "speed:normal", _x, _y, entitySpeedButtonClicked);
entitySpeedButton.hoverText = getEntitySpeedDescription(EntitySpeed.NORMAL);
_y += 32;
playButton = new GuiButton(guiController, "play", _x, _y, playButtonClicked);
playButton.hoverText = "ready?";
_x = 16;
backButton = new GuiButton(guiController, "back", _x, _y, backButtonClicked);
backButton.hoverText = "to main menu";