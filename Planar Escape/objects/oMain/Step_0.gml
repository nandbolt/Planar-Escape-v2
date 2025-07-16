/// @desc Input

// If on windows
if (onDesktop()) room_goto_next();
// If everything is loaded
else if (loadIdx >= loadMaxIdx)
{
	var _mx = device_mouse_x_to_gui(0), _my = device_mouse_y_to_gui(0);
	var _cx = display_get_gui_width() * 0.5, _cy = display_get_gui_height() * 0.5;
	if (point_in_rectangle(_mx, _my, _cx - 300, _cy - 50, _cx + 300, _cy + 50))
	{
		hovering = true;
		if (mouse_check_button_pressed(mb_left)) room_goto_next();
	}
	else hovering = false;
}