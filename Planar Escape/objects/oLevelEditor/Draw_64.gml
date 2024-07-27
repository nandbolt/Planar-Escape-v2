// Exit if paused
if (paused) exit;

// Init cursor draw position
var _x = 0, _y = 0;

// Title
draw_set_halign(fa_center);
draw_set_valign(fa_top);
_x = display_get_gui_width() * 0.5;
_y = 8;
draw_text(_x, _y, "level editor");
_y += 34;
draw_text(_x, _y, cursorText);

// Controls
draw_set_halign(fa_left);
draw_set_valign(fa_bottom);
var _x = 8, _y = display_get_gui_height() - 8 - 16;
draw_text_color(_x, _y, "move:AWSD, place:space, change:Q/E, level params:esc", c_white, c_white, c_white, c_white, 0.25);
_y += 16;
draw_text_color(_x, _y, "shortcuts:0-9, hide tiles:L", c_white, c_white, c_white, c_white, 0.25);

// Map
//for (var