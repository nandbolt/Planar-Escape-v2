// Inherit the parent event
event_inherited();

// Retry
if (keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(0, gp_face1)) retryButtonClicked();
// Main menu
else if (keyboard_check_pressed(ord("M")) || gamepad_button_check_pressed(0, gp_face2)) mainMenuButtonClicked();