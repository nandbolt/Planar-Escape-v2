// Time + stars
draw_set_halign(fa_left);
draw_set_valign(fa_top);
var _x = 8, _y = 8;
draw_text(_x, _y, string(levelTime));
_y += 16;
draw_text(_x, _y, string(starsCollected));

// Level messages
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
if (levelComplete) draw_text(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5, "level complete");
else if (levelFailed) draw_text(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5, "level failed");