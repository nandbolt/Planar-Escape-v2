// Inherit the parent event
event_inherited();

#region Button Functions

/// @func	saveLevelButtonClicked();
saveLevelButtonClicked = function()
{
	// Create room level data
	var _levelData = 
	{
		version : global.version,
		name : oLevelEditor.levelName,
		levelGrid : oLevelEditor.levelGrid,
		wireGrid : oLevelEditor.wireGrid,
	}
	var _jsonString = json_stringify(_levelData);
	
	// Save level to file
	var _fileName = "custom-levels/" + oLevelEditor.levelName + ".txt";
	var _file = file_text_open_write(_fileName);
	file_text_write_string(_file, _jsonString);
	file_text_close(_file);
	
	// Save level
	alarm[0] = 120;
}

/// @func	mainMenuButtonClicked();
mainMenuButtonClicked = function()
{
	// Main menu
	room_goto(rMainMenu);
}

#endregion

// Init gui buttons
var _x = display_get_gui_width() * 0.25 - 75, _y = guiCenterY - 16;
saveLevelButton = new GuiButton(guiController, "save level", _x, _y - 48, saveLevelButtonClicked);
mainMenuButton = new GuiButton(guiController, "main menu", _x, _y, mainMenuButtonClicked);

// Show cursor
window_set_cursor(cr_arrow);