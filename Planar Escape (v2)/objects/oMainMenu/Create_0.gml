// Inherit the parent event
event_inherited();

// Version
version = global.version;

#region Button Functions

/// @func	startButtonClicked();
startButtonClicked = function()
{
	// Setup run
	global.mode = Mode.ESCAPE;
	global.entitySpeed = EntitySpeed.NORMAL;
	
	// Go to first level in campaign
	room_goto(rCutsceneMain01);
}

/// @func	levelSelectButtonClicked();
levelSelectButtonClicked = function()
{
	// Go to first level in campaign
	room_goto(rMainLevelSelectMenu);
}

/// @func	levelEditorButtonClicked();
levelEditorButtonClicked = function()
{
	// Go to first level in campaign
	room_goto(rCustomLevelSelectMenu);
}

/// @func	quitButtonClicked();
quitButtonClicked = function()
{
	// End game
	game_end();
}

#endregion

// Init gui buttons
var _x = display_get_gui_width() * 0.25 - 75, _y = display_get_gui_height() / 6 - 16;
startButton = new GuiButton(guiController, "begin escape", _x, _y, startButtonClicked);
_y = display_get_gui_height() / 6 * 1.8 - 16;
levelSelectButton = new GuiButton(guiController, "level select", _x, _y, levelSelectButtonClicked);
_y = display_get_gui_height() / 6 * 2.6 - 16;
levelEditorButton = new GuiButton(guiController, "level editor", _x, _y, levelEditorButtonClicked);
_y = display_get_gui_height() / 6 * 3.4 - 16;
logbookSelectButton = new GuiButton(guiController, "logbook", _x, _y, levelSelectButtonClicked);
_y = display_get_gui_height() / 6 * 4.2 - 16;
optionsSelectButton = new GuiButton(guiController, "options", _x, _y, levelSelectButtonClicked);
_y = display_get_gui_height() / 6 * 5 - 16;
quitButton = new GuiButton(guiController, "quit", _x, _y, quitButtonClicked);

// Show cursor
window_set_cursor(cr_arrow);

// Play music
if (!audio_is_playing(mEscape))
{
	audio_stop_all();
	audio_play_sound(mEscape, 20, true);
}