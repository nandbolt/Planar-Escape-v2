// Inherit the parent event
event_inherited();

// Level
customLevel = roomIsCustomLevel(room);

#region Functions

#region Button Functions

/// @func	nextLevelButtonClicked();
nextLevelButtonClicked = function()
{
	with (oLevel)
	{
		if (alarm[1] == -1)
		{
			// If next room is a level
			nextRoom = room_next(room);
			if (roomIsLevel(nextRoom)) loadLevelScores(nextRoom);
			alarm[1] = 60;
		}
	}
}

/// @func	retryButtonClicked();
retryButtonClicked = function()
{
	with (oLevel)
	{
		if (alarm[1] == -1)
		{
			nextRoom = room;
			alarm[1] = 60;
		}
	}
}

/// @func	mainMenuButtonClicked();
mainMenuButtonClicked = function()
{
	// Go to next level
	with (oLevel)
	{
		if (alarm[1] == -1)
		{
			nextRoom = rMainMenu;
			alarm[1] = 60;
		}
	}
}

#endregion

#endregion

// Init gui buttons
var _x = display_get_gui_width() * 0.5 - 75, _y = display_get_gui_height() - 32 - 12;
if (!customLevel) nextLevelButton = new GuiButton(guiController, "next level", _x, _y - 48 * 2, nextLevelButtonClicked);
retryButton = new GuiButton(guiController, "retry", _x, _y - 48, retryButtonClicked);
mainMenuButton = new GuiButton(guiController, "main menu", _x, _y, mainMenuButtonClicked);

// Show cursor
window_set_cursor(cr_arrow);