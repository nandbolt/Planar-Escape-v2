var _x = 0, _y = 0;

// Draw right area
_x = guiCenterX + 8;
_y = 28;
draw_sprite_stretched(sBorder1, 0, _x, _y, guiCenterX - 16, 286);

// Map
_x += 8;
_y += 8;
draw_sprite_stretched_ext(sPixel, 0, _x, _y, mapDrawWidth, mapDrawHeight, c_black, 1);
drawMap(_x, _y);

// Level name
draw_set_halign(fa_left);
draw_set_valign(fa_top);
_x += 87 + 8;
draw_text(_x, _y, selectedLevelName);

// Draw left area
_x = 8;
_y = 28;
draw_sprite_stretched(sBorder1, 0, _x, _y, guiCenterX - 16, 286);

// Inherit the parent event
event_inherited();

// Menu title
draw_set_halign(fa_left);
draw_set_valign(fa_top);
_x = 8;
_y = 8;
draw_text(_x, _y, "main levels");