// Time
draw_set_halign(fa_right);
draw_set_valign(fa_top);
var _x = display_get_gui_width(), _y = 0;
draw_text(_x, _y, string(levelTime));
_y += 16;
draw_text(_x, _y, string(starsCollected));
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
if (levelComplete) draw_text(_x * 0.5, display_get_gui_height() * 0.5, "level complete");
else if (levelFailed) draw_text(_x * 0.5, display_get_gui_height() * 0.5, "level failed");