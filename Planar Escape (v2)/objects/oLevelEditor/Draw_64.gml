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

// Map
//for (var