// Self + range
draw_self();
if (instance_exists(target))
{
	//draw_line(x, y, target.x, target.y);
	var _pos = new BEVector2(x, y), _fullDist = point_distance(x, y, target.x, target.y);
	var _partDist = _fullDist * 0.25;
	for (var _i = 0; _i < 4; _i++)
	{
		var _dir = point_direction(_pos.x, _pos.y, target.x, target.y) + irandom_range(-10,10);
		draw_sprite_ext(sprZap, 0, _pos.x, _pos.y, _partDist, 1, _dir, c_white, 0.5);
		
		// Update position
		_pos.x += lengthdir_x(_partDist, _dir);
		_pos.y += lengthdir_y(_partDist, _dir);
	}
}