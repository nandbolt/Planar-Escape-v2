// Inherit the parent event
event_inherited();

// Title
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
var _x = display_get_gui_width() * 0.5, _y = display_get_gui_height() * 0.5;
draw_text(_x, _y, "you've successfully escaped the entity's grasp!");
_y += 32;
draw_text(_x, _y, "thanks for playing!");
_y += 32;
draw_text(_x, _y, "main menu (space)");