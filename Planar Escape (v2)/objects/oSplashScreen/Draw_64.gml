// Text
if (alarm[1] == -1)
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	var _x = display_get_gui_width() * 0.5, _y = display_get_gui_height() * 0.5;
	if (splashIdx == 0 || splashIdx == 3) draw_set_alpha(1 - alarm[0] / fadeTime);
	else if (splashIdx == 2 || splashIdx == 5) draw_set_alpha(alarm[0] / fadeTime);
	draw_text(_x, _y, text);
	draw_set_alpha(1);
}