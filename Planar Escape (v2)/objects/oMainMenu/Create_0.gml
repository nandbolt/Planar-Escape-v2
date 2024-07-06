// Inherit the parent event
event_inherited();

#region Button Functions

/// @func	startButtonClicked();
startButtonClicked = function()
{
	// Go to first level in campaign
	room_goto(rLevelMain01);
}

/// @func	levelSelectButtonClicked();
levelSelectButtonClicked = function()
{
	// Go to first level in campaign
	room_goto(rLevelSelectMenu);
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
startButton = new GuiButton(guiController, "begin escape", _x, _y - 48, startButtonClicked);
levelSelectButton = new GuiButton(guiController, "level select", _x, _y, levelSelectButtonClicked);
quitButton = new GuiButton(guiController, "quit", _x, _y + 48, quitButtonClicked);

// Show cursor
window_set_cursor(cr_arrow);