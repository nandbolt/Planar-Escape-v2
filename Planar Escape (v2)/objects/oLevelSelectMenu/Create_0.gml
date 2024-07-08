// Inherit the parent event
event_inherited();

// Levels
selectedLevel = rLevelMain01;
selectedLevelName = getLevelName(selectedLevel);

// Map
mapWidth = 29;
mapHeight = 90;
mapDrawWidth = mapWidth * 3;
mapDrawHeight = mapHeight * 3;
mapArray = array_create(mapWidth * mapHeight, 0);

// Buttons
levelSelectButtonStartX = 16;

#region Functions

/// @func	selectLevel({room} room);
selectLevel = function(_room)
{
	// Exit if room doesn't exist
	if (!room_exists(_room)) return;
	
	// Set room
	selectedLevel = _room;
	selectedLevelName = getLevelName(_room);
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
	room_goto(selectedLevel);
}

/// @func	modeButtonClicked();
modeButtonClicked = function()
{
	// Change mode
	if (global.mode == Mode.ESCAPE)
	{
		global.mode = Mode.TRACE;
		modeButton.name = "mode: trace";
	}
	else if (global.mode == Mode.TRACE)
	{
		global.mode = Mode.ESCAPE;
		modeButton.name = "mode: escape";
	}
}

/// @func	entitySpeedButtonClicked();
entitySpeedButtonClicked = function()
{
	// Change mode
	if (global.entitySpeed == EntitySpeed.NORMAL)
	{
		global.entitySpeed = EntitySpeed.HYPER;
		entitySpeedButton.name = "speed: hyper";
	}
	else if (global.entitySpeed == EntitySpeed.HYPER)
	{
		global.entitySpeed = EntitySpeed.STASIS;
		entitySpeedButton.name = "speed: stasis";
	}
	else if (global.entitySpeed == EntitySpeed.STASIS)
	{
		global.entitySpeed = EntitySpeed.NORMAL;
		entitySpeedButton.name = "speed: normal";
	}
}

#region Level Button Functions

/// @func	level1ButtonClicked();
level1ButtonClicked = function(){ selectLevel(rLevelMain01); }

/// @func	level2ButtonClicked();
level2ButtonClicked = function(){ selectLevel(rLevelMain02); }

/// @func	level3ButtonClicked();
level3ButtonClicked = function(){ selectLevel(rLevelMain03); }

/// @func	level4ButtonClicked();
level4ButtonClicked = function(){ selectLevel(rLevelMain04); }

/// @func	level5ButtonClicked();
level5ButtonClicked = function(){ selectLevel(rLevelMain05); }

/// @func	level6ButtonClicked();
level6ButtonClicked = function(){ selectLevel(rLevelMain06); }

/// @func	level7ButtonClicked();
level7ButtonClicked = function(){ selectLevel(rLevelMain07); }

/// @func	level8ButtonClicked();
level8ButtonClicked = function(){ selectLevel(rLevelMain08); }

/// @func	level9ButtonClicked();
level9ButtonClicked = function(){ selectLevel(rLevelMain09); }

/// @func	level10ButtonClicked();
level10ButtonClicked = function(){ selectLevel(rLevelMain10); }

/// @func	level11ButtonClicked();
level11ButtonClicked = function(){ selectLevel(rLevelMain11); }

/// @func	level12ButtonClicked();
level12ButtonClicked = function(){ selectLevel(rLevelMain12); }

/// @func	level13ButtonClicked();
level13ButtonClicked = function(){ selectLevel(rLevelMain13); }

/// @func	level14ButtonClicked();
level14ButtonClicked = function(){ selectLevel(rLevelMain14); }

/// @func	level15ButtonClicked();
level15ButtonClicked = function(){ selectLevel(rLevelMain15); }

/// @func	level16ButtonClicked();
level16ButtonClicked = function(){ selectLevel(rLevelMain16); }

/// @func	level17ButtonClicked();
level17ButtonClicked = function(){ selectLevel(rLevelMain17); }

/// @func	level18ButtonClicked();
level18ButtonClicked = function(){ selectLevel(rLevelMain18); }

/// @func	level19ButtonClicked();
level19ButtonClicked = function(){ selectLevel(rLevelMain19); }

/// @func	level20ButtonClicked();
level20ButtonClicked = function(){ selectLevel(rLevelMain20); }

#endregion

#endregion

#endregion

// Init gui buttons
var _x = 16, _y = 28 + mapDrawHeight - 16 - 8;
backButton = new GuiButton(guiController, "back", _x, _y, backButtonClicked);
_x = guiCenterX + 16 + mapDrawWidth + 8;
playButton = new GuiButton(guiController, "play", _x, _y, playButtonClicked);
_x = guiCenterX + 16 + mapDrawWidth + 8;
_y -= 40;
entitySpeedButton = new GuiButton(guiController, "speed: normal", _x, _y, entitySpeedButtonClicked);
_y -= 40;
modeButton = new GuiButton(guiController, "mode: escape", _x, _y, modeButtonClicked);

#region Init Level Buttons

var _xSpacing = 34;

// Row 1
_y = 36;
_x = levelSelectButtonStartX;
level1Button = new GuiButton(guiController, "01", _x, _y, level1ButtonClicked);
level1Button.width = 32;
_x += _xSpacing;
level2Button = new GuiButton(guiController, "02", _x, _y, level2ButtonClicked);
level2Button.width = 32;
_x += _xSpacing;
level3Button = new GuiButton(guiController, "03", _x, _y, level3ButtonClicked);
level3Button.width = 32;
_x += _xSpacing;
level4Button = new GuiButton(guiController, "04", _x, _y, level4ButtonClicked);
level4Button.width = 32;
_x += _xSpacing;
level5Button = new GuiButton(guiController, "05", _x, _y, level5ButtonClicked);
level5Button.width = 32;
_x += _xSpacing;
level6Button = new GuiButton(guiController, "06", _x, _y, level6ButtonClicked);
level6Button.width = 32;
_x += _xSpacing;
level7Button = new GuiButton(guiController, "07", _x, _y, level7ButtonClicked);
level7Button.width = 32;
_x += _xSpacing;
level8Button = new GuiButton(guiController, "08", _x, _y, level8ButtonClicked);
level8Button.width = 32;

// Row 3
_y += 34;
_x = levelSelectButtonStartX;
level9Button = new GuiButton(guiController, "09", _x, _y, level9ButtonClicked);
level9Button.width = 32;
_x += _xSpacing;
level10Button = new GuiButton(guiController, "10", _x, _y, level10ButtonClicked);
level10Button.width = 32;
_x += _xSpacing;
level11Button = new GuiButton(guiController, "11", _x, _y, level11ButtonClicked);
level11Button.width = 32;
_x += _xSpacing;
level12Button = new GuiButton(guiController, "12", _x, _y, level12ButtonClicked);
level12Button.width = 32;
_x += _xSpacing;
level13Button = new GuiButton(guiController, "13", _x, _y, level13ButtonClicked);
level13Button.width = 32;
_x += _xSpacing;
level14Button = new GuiButton(guiController, "14", _x, _y, level14ButtonClicked);
level14Button.width = 32;
_x += _xSpacing;
level15Button = new GuiButton(guiController, "15", _x, _y, level15ButtonClicked);
level15Button.width = 32;
_x += _xSpacing;
level16Button = new GuiButton(guiController, "16", _x, _y, level16ButtonClicked);
level16Button.width = 32;

// Row 5
_y += 34;
_x = levelSelectButtonStartX;
level17Button = new GuiButton(guiController, "17", _x, _y, level17ButtonClicked);
level17Button.width = 32;
_x += _xSpacing;
level18Button = new GuiButton(guiController, "18", _x, _y, level18ButtonClicked);
level18Button.width = 32;
_x += _xSpacing;
level19Button = new GuiButton(guiController, "19", _x, _y, level19ButtonClicked);
level19Button.width = 32;
_x += _xSpacing;
level20Button = new GuiButton(guiController, "20", _x, _y, level20ButtonClicked);
level20Button.width = 32;

#endregion

// Init map data
getMapData(rLevelMain01);