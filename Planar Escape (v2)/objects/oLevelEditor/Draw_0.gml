// Self + cursor
var _x = x, _y = y;
if (cursorScale == 2)
{
	_x += HALF_TILE_SIZE;
	_y += HALF_TILE_SIZE;
}
draw_sprite_ext(cursorSprite, 0, _x, _y, cursorScale, cursorScale, cursorRotation, cursorColor, 0.75);
draw_self();

// Draw things in view