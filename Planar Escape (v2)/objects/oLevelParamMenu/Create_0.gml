// Inherit the parent event
event_inherited();

#region Button Functions

/// @func	saveLevelButtonClicked();
saveLevelButtonClicked = function()
{
	// Save level
	show_debug_message("Level saved!");
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