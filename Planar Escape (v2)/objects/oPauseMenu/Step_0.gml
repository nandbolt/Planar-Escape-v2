// Inherit the parent event
event_inherited();

// Queue pause if pause pressed
if (keyboard_check_pressed(vk_escape)) oPauseManager.pauseQueued = true;