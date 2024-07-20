// Inherit the parent event
event_inherited();

// Title
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
var _x = display_get_gui_width() * 0.75, _y = display_get_gui_height() * 0.5;
draw_text(_x, _y, "Planar Escape");

// Credits
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);
var _x = display_get_gui_width() - 8, _y = display_get_gui_height() - 8;
draw_text_color(_x, _y, "created by nandbolt (v" + version + ")", c_white, c_white, c_white, c_white, 0.25);