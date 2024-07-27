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
var _x = display_get_gui_width() * 0.25 - 75, _y = display_get_gui_height() * 0.5 - 32 * 3;
startButton = new GuiButton(guiController, "begin escape", _x, _y, startButtonClicked);
startButton.hoverText = "wake up and find a way to escape the pursuing entity.";
_y += 32;
levelSelectButton = new GuiButton(guiController, "level select", _x, _y, levelSelectButtonClicked);
levelSelectButton.hoverText = "play levels that have been unlocked.";
_y += 32;
levelEditorButton = new GuiButton(guiController, "level editor", _x, _y, levelEditorButtonClicked);
levelEditorButton.hoverText = "make/play levels designed by those engrossed in the simulation.";
_y += 32;
logbookSelectButton = new GuiButton(guiController, "logbook", _x, _y, levelSelectButtonClicked);
logbookSelectButton.hoverText = "notes from the awoken that may prove useful (coming soon!).";
logbookSelectButton.locked = true;
_y += 32;
optionsSelectButton = new GuiButton(guiController, "options", _x, _y, levelSelectButtonClicked);
optionsSelectButton.hoverText = "change game parameters for a more pleasant escape (coming soon!).";
optionsSelectButton.locked = true;
_y += 32;
quitButton = new GuiButton(guiController, "quit", _x, _y, quitButtonClicked);
quitButton.hoverText = "so long...";

// Show cursor
window_set_cursor(cr_arrow);

// Play music
if (!audio_is_playing(mEscape))
{
	audio_stop_all();
	audio_play_sound(mEscape, 20, true);
}

// Reset edit
global.editingLevel = false;
global.mode = Mode.ESCAPE;
global.entitySpeed = EntitySpeed.NORMAL;