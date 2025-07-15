// Inherit the parent event
event_inherited();

#region Button Functions

/// @func	resumeButtonClicked();
resumeButtonClicked = function()
{
	// Queue pause
	oPauseManager.pauseQueued = true;
}

/// @func	mainMenuButtonClicked();
mainMenuButtonClicked = function()
{
	// Queue new room
	oPauseManager.goToNewRoomOnUnpause = true;
	oPauseManager.newRoom = rMainMenu;
	
	// Queue pause
	oPauseManager.pauseQueued = true;
}

/// @func	quitButtonClicked();
quitButtonClicked = function()
{
	// End game
	game_end();
}

#endregion

// Init gui buttons
var _x = display_get_gui_width() * 0.25 - 75, _y = guiCenterY - 16;
resumeButton = new GuiButton(guiController, "resume", _x, _y - 48, resumeButtonClicked);
mainMenuButton = new GuiButton(guiController, "main menu", _x, _y, mainMenuButtonClicked);
quitButton = new GuiButton(guiController, "quit", _x, _y + 48, quitButtonClicked);
if (!onDesktop())
{
	quitButton.hoverText = "(NOT AVAILABLE FOR THE BROWSER!)";
	quitButton.locked = true;
}

// Show cursor
window_set_cursor(cr_arrow);