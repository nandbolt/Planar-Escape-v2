// Draw right area
draw_sprite_stretched(sIceBlock, 0, guiCenterX + 8, 8, guiCenterX - 16, display_get_gui_height() - 16);

// Inherit the parent event
event_inherited();

// Menu title
draw_set_halign(fa_left);
draw_set_valign(fa_top);
var _x = 8, _y = 8;
draw_text(_x, _y, "Level Select");

// Level name
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_black);
_x = guiCenterX + guiCenterX * 0.5;
_y = 16;
draw_text(_x, _y, selectedLevelName);
draw_set_color(c_white);