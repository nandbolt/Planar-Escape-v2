// Update time
if (!levelComplete && !levelFailed)
{
	// Increment level time
	levelTime += delta_time / 1000000;
	
	// Queue pause if pause pressed
	if (keyboard_check_pressed(vk_escape) || gamepad_button_check_pressed(0, gp_start)) oPauseManager.pauseQueued = true;
}
else
{
	// Get space pressed
	var _spacePressed = keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(0, gp_face1);
	
	// Change menu if space pressed
	if (_spacePressed) alarm[0] = 1;
}
