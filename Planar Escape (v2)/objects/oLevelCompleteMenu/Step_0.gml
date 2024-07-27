// Inherit the parent event
event_inherited();

// Next level
if (keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(0, gp_face1))
{
	if (!customLevel) nextLevelButtonClicked();
	else retryButtonClicked();
}
// Retry
else if (keyboard_check_pressed(ord("R")) || gamepad_button_check_pressed(0, gp_face3)) retryButtonClicked();
// Main menu
else if (keyboard_check_pressed(ord("M")) || gamepad_button_check_pressed(0, gp_face2)) mainMenuButtonClicked();