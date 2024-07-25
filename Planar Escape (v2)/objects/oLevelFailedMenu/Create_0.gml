// Inherit the parent event
event_inherited();

#region Button Functions

/// @func	nextLevelButtonClicked();
nextLevelButtonClicked = function(){ room_goto_next(); }

/// @func	retryButtonClicked();
retryButtonClicked = function(){ room_restart(); }

/// @func	mainMenuButtonClicked();
mainMenuButtonClicked = function(){ room_goto(rMainMenu); }

#endregion

// Init gui buttons
var _x = display_get_gui_width() * 0.5 - 75, _y = display_get_gui_height() - 32 - 12;
if (!roomIsCustomLevel(room)) nextLevelButton = new GuiButton(guiController, "next level", _x, _y - 48 * 2, nextLevelButtonClicked);
retryButton = new GuiButton(guiController, "retry", _x, _y - 48, retryButtonClicked);
mainMenuButton = new GuiButton(guiController, "main menu", _x, _y, mainMenuButtonClicked);

// Show cursor
window_set_cursor(cr_arrow);