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

#region Functions

/// @func	selectLevel({room} room);
selectLevel = function(_room)
{
	// Exit if room doesn't exist
	if (!room_exists(_room)) return;
	
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
			// If not first level
			if (_i > 0)
			{
				// Lock levels
				_button.locked = true;
				
				// Set lock text
				if (_i < 8) _button.hoverText = "escape level " + string(_i) + " to unlock!";
				else _button.hoverText = "coming soon!";
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
	loadLevelScores(selectedLevel);
	if (highscoreTextIdx == 0) highscores = global.currentLevelFastestTimes;
	else if (highscoreTextIdx == 1) highscores = global.currentLevelEscapeScores;
	else if (highscoreTextIdx == 2) highscores = global.currentLevelMarkScores;
	else if (highscoreTextIdx == 3) highscores = global.currentLevelTraceScores;
	stars = global.currentLevelStarsCollected;
	stardisks = global.currentLevelStardisksCollected;
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

// Change scores
loadLevelScores(selectedLevel);
highscores = global.currentLevelFastestTimes;
stars = global.currentLevelStarsCollected;
stardisks = global.currentLevelStardisksCollected;