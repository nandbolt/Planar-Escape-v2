// Self + range
draw_self();

// If visible
if (inCamView)
{
	// Radius
	if (powerType != Power.OFF && instance_exists(oPlayer))
	{
		// Get distance
		var _dist = point_distance(x, y, oPlayer.x, oPlayer.y);
		
		// If close enough
		if (_dist < targetRange + targetCircleBuffer)
		{
			var _alpha = targetCircleMaxAlpha;
			if (_dist > targetRange) _alpha = (1 - (_dist - targetRange) / targetCircleBuffer) * targetCircleMaxAlpha;
			var _diameter = targetRange * 2;
			draw_sprite_stretched_ext(sprTargetCircle, 0, x - targetRange, y - targetRange, _diameter, _diameter, zapColor, _alpha);
		}
	}
	
	// Arc
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
}