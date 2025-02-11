// Inherit the parent event
event_inherited();

#region Button Functions

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

// Init gui buttons
var _x = display_get_gui_width() * 0.5 - 75, _y = display_get_gui_height() - 32 - 12;
retryButton = new GuiButton(guiController, "retry", _x, _y - 48, retryButtonClicked);
mainMenuButton = new GuiButton(guiController, "main menu", _x, _y, mainMenuButtonClicked);

// Show cursor
window_set_cursor(cr_arrow);