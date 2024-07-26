// Inherit the parent event
event_inherited();

// Title
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
var _x = display_get_gui_width() * 0.75, _y = display_get_gui_height() * 0.5;
var _text = "Paused";
var _borderWidth = string_width(_text) + 4, _borderHeight = 16;
draw_sprite_stretched(sBorder3, 0, _x - _borderWidth * 0.5, _y-_borderHeight * 0.5-2, _borderWidth, _borderHeight);
draw_text(_x, _y, _text);