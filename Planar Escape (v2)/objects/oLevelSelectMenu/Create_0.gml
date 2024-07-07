// Inherit the parent event
event_inherited();

// Levels
selectedLevel = rLevelMain01;
selectedLevelName = getLevelName(selectedLevel);

#region Functions

/// @func	selectLevel({room} room);
selectLevel = function(_room)
{
	// Exit if room doesn't exist
	if (!room_exists(_room)) return;
	
	// Set room
	selectedLevel = _room;
	selectedLevelName = getLevelName(_room);
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

// Init gui buttons
var _x = 8, _y = display_get_gui_height() - 48;
backButton = new GuiButton(guiController, "back", _x, _y, backButtonClicked);
_x = guiCenterX + guiCenterX * 0.5 - 75;
playButton = new GuiButton(guiController, "play", _x, _y, playButtonClicked);

#region Init Level Buttons

// Row 1
_y = 80;
_x = 8;
level1Button = new GuiButton(guiController, "01", _x, _y, level1ButtonClicked);
level1Button.width = 32;
_x += 34;
level2Button = new GuiButton(guiController, "02", _x, _y, level2ButtonClicked);
level2Button.width = 32;
_x += 34;
level3Button = new GuiButton(guiController, "03", _x, _y, level3ButtonClicked);
level3Button.width = 32;
_x += 34;
level4Button = new GuiButton(guiController, "04", _x, _y, level4ButtonClicked);
level4Button.width = 32;

// Row 2
_y += 34;
_x = 8;
level5Button = new GuiButton(guiController, "05", _x, _y, level5ButtonClicked);
level5Button.width = 32;
_x += 34;
level6Button = new GuiButton(guiController, "06", _x, _y, level6ButtonClicked);
level6Button.width = 32;
_x += 34;
level7Button = new GuiButton(guiController, "07", _x, _y, level7ButtonClicked);
level7Button.width = 32;
_x += 34;
level8Button = new GuiButton(guiController, "08", _x, _y, level8ButtonClicked);
level8Button.width = 32;

// Row 3
_y += 34;
_x = 8;
level9Button = new GuiButton(guiController, "09", _x, _y, level9ButtonClicked);
level9Button.width = 32;
_x += 34;
level10Button = new GuiButton(guiController, "10", _x, _y, level10ButtonClicked);
level10Button.width = 32;
_x += 34;
level11Button = new GuiButton(guiController, "11", _x, _y, level11ButtonClicked);
level11Button.width = 32;
_x += 34;
level12Button = new GuiButton(guiController, "12", _x, _y, level12ButtonClicked);
level12Button.width = 32;

// Row 4
_y += 34;
_x = 8;
level13Button = new GuiButton(guiController, "13", _x, _y, level13ButtonClicked);
level13Button.width = 32;
_x += 34;
level14Button = new GuiButton(guiController, "14", _x, _y, level14ButtonClicked);
level14Button.width = 32;
_x += 34;
level15Button = new GuiButton(guiController, "15", _x, _y, level15ButtonClicked);
level15Button.width = 32;
_x += 34;
level16Button = new GuiButton(guiController, "16", _x, _y, level16ButtonClicked);
level16Button.width = 32;

// Row 5
_y += 34;
_x = 8;
level17Button = new GuiButton(guiController, "17", _x, _y, level17ButtonClicked);
level17Button.width = 32;
_x += 34;
level18Button = new GuiButton(guiController, "18", _x, _y, level18ButtonClicked);
level18Button.width = 32;
_x += 34;
level19Button = new GuiButton(guiController, "19", _x, _y, level19ButtonClicked);
level19Button.width = 32;
_x += 34;
level20Button = new GuiButton(guiController, "20", _x, _y, level20ButtonClicked);
level20Button.width = 32;

#endregion