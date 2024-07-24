// Inherit the parent event
event_inherited();

// Save error
saveTextColor = c_yellow;
saveText = "";

#region Button Functions

/// @func	levelNameTextfieldEntered();
levelNameTextfieldEntered = function()
{
	// Set level name
	oLevelEditor.levelName = levelNameTextfield.value;
}

/// @func	levelCreatorTextfieldEntered();
levelCreatorTextfieldEntered = function()
{
	// Set level name
	oLevelEditor.levelCreator = levelCreatorTextfield.value;
}

/// @func	musicButtonClicked();
musicButtonClicked = function()
{
	// Stop music
	updateMusic();
	
	// Change song
	if (oLevelEditor.musicIdx >= array_length(oLevelEditor.music)-1) oLevelEditor.musicIdx = 0;
	else oLevelEditor.musicIdx++;
	oLevelEditor.levelMusic = oLevelEditor.music[oLevelEditor.musicIdx];
	musicButton.name = "music:" + oLevelEditor.musicNames[oLevelEditor.musicIdx]
	
	// Play song
	playSong(oLevelEditor.levelMusic);
}

/// @func	saveLevelButtonClicked();
saveLevelButtonClicked = function()
{
	// If no name
	if (oLevelEditor.levelName == "")
	{
		saveTextColor = c_red;
		saveText = "no level name entered!";
		alarm[0] = 120;
		return;
	}
	else if (oLevelEditor.levelCreator == "")
	{
		saveTextColor = c_red;
		saveText = "no creator name entered!";
		alarm[0] = 120;
		return;
	}
	
	// Create room level data
	var _levelData = 
	{
		version : global.version,
		name : oLevelEditor.levelName,
		creator : oLevelEditor.levelCreator,
		music : oLevelEditor.levelMusic,
		levelGrid : oLevelEditor.levelGrid,
		wireGrid : oLevelEditor.wireGrid,
		rotationGrid : oLevelEditor.rotationGrid,
	}
	var _jsonString = json_stringify(_levelData);
	
	// Save level to file
	var _fileName = "custom-levels/" + oLevelEditor.levelName + ".txt";
	var _file = file_text_open_write(_fileName);
	file_text_write_string(_file, _jsonString);
	file_text_close(_file);
	
	// Successful save
	saveTextColor = c_yellow;
	saveText = "level saved!";
	
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
levelNameTextfield = new GuiTextfield(guiController, "level name", _x, _y - 48 * 2, oLevelEditor.levelName, "level name", levelNameTextfieldEntered);
levelNameTextfield.width = 250;
levelCreatorTextfield = new GuiTextfield(guiController, "level creator", _x, _y - 48, oLevelEditor.levelCreator, "level creator", levelCreatorTextfieldEntered);
levelCreatorTextfield.width = 250;
musicButton = new GuiButton(guiController, "music:" + oLevelEditor.musicNames[oLevelEditor.musicIdx], _x, _y, musicButtonClicked);
musicButton.width = 250;
saveLevelButton = new GuiButton(guiController, "save level", _x, _y + 48, saveLevelButtonClicked);
mainMenuButton = new GuiButton(guiController, "main menu", _x, _y + 48 * 2, mainMenuButtonClicked);

// Show cursor
window_set_cursor(cr_arrow);