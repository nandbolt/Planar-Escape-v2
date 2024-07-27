// Inherit the parent event
event_inherited();

// Queue pause if pause pressed
if (keyboard_check_pressed(vk_escape) || gamepad_button_check_pressed(0, gp_start)) oPauseManager.pauseQueued = true;