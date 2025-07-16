/// @desc Load

// Load text
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text_transformed(8, 8, loadText, 2, 2, 0);

// If everything is loaded
if (loadIdx >= loadMaxIdx)
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	if (hovering) draw_set_color(c_white);
	else draw_set_color(c_dkgray);
	draw_text_transformed(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5,
		"Wake up?", 2, 2, 0);
	draw_set_color(c_white);
}