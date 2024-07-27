// Change rooms if space pressed
if (keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(0, gp_face1))
{
	if (room == rCutsceneMain03) room_goto(rMainMenu);
	else room_goto_next();
}