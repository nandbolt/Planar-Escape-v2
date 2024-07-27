// Self + cursor
var _x = x, _y = y;
var _cursorScale = cursorScale;
if (_cursorScale == 2)
{
	_x += HALF_TILE_SIZE;
	_y += HALF_TILE_SIZE;
	if (cursorIdx == LevelObject.STAR_DISK) _cursorScale = 1;
}
draw_sprite_ext(cursorSprite, 0, _x, _y, _cursorScale, _cursorScale, cursorRotation, cursorColor, 0.75);
draw_self();

// Draw things in view