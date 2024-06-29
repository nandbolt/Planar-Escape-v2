// Update time
if (!levelComplete && !levelFailed) levelTime = (current_time - startTime) * 0.001;
else
{
	// Get space pressed
	var _spacePressed = keyboard_check_pressed(vk_space);
	
	// Change menu if space pressed
	if (_spacePressed) alarm[0] = 1;
	
	// Restart
	if (keyboard_check_pressed(ord("R"))) room_restart();
	// Next level
	else if (levelComplete && keyboard_check_pressed(vk_enter) || (_spacePressed && levelEndMenus == maxCompleteLevelMenu))
	{
		// Go to next level if it exists
		if (room_exists(room_next(room))) room_goto_next();
		// Else restart (in the future, go to main menu)
		else room_restart();
	}
}