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

// Controls
draw_set_halign(fa_left);
draw_set_valign(fa_bottom);
var _x = 8, _y = display_get_gui_height() - 8 - 16;
draw_text_color(_x, _y, "(keyboard) move:AWSD, dash:space, use:j, pause:esc", c_white, c_white, c_white, c_white, 0.25);
_y += 16;
draw_text_color(_x, _y, "(controller) move:dpad, dash:X/A, use:O/B, pause:start", c_white, c_white, c_white, c_white, 0.25);