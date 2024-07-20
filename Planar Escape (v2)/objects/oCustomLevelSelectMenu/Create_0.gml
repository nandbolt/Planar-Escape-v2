// Inherit the parent event
event_inherited();

// Level select
levelSelectName = "custom";

#region Button Functions

/// @func	editButtonClicked();
editButtonClicked = function()
{
	// Go to selected level
	global.editingLevel = true;
	room_goto(selectedLevel);
}

#endregion

// Add last level (empty)
array_push(levels, rLevelEmpty);

// Init play + edit buttons
playButton.width *= 0.5;
editButton = new GuiButton(guiController, "edit", playButton.x + playButton.width + 4, playButton.y, editButtonClicked);
editButton.width = playButton.width;

// Init
initLevelSelection();