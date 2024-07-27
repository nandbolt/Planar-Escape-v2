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
_y += 20;
if (selectedLevelCreator != "") draw_text(_x, _y, "by " + selectedLevelCreator);

// High scores
_y += 60;
draw_set_color(c_yellow);
var _yOff = sin(current_time * highscoreHoverSpeed) * highscoreHoverRange;
if (highscores[0] > 0) draw_text(_x, _y + _yOff, "1st " + string(highscores[0]));
else draw_text(_x, _y, "...");
_y += 20;
draw_set_color(c_ltgray);
if (highscores[1] > 0) draw_text(_x, _y + _yOff, "2nd " + string(highscores[1]));
else draw_text(_x, _y, "...");
_y += 20;
draw_set_color(#CD7F32);
if (highscores[2] > 0) draw_text(_x, _y + _yOff, "3rd " + string(highscores[2]));
else draw_text(_x, _y, "...");
draw_set_color(c_white);
_y += 20;
draw_text(_x, _y, "stars:" + string(stars) + "/" + string(maxStars));
_y += 20;
draw_text(_x, _y, "stardisks:" + string(stardisks) + "/" + string(maxStardisks));

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
draw_text(_x, _y, levelSelectName + " levels");