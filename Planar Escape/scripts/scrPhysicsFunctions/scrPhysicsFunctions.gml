/// @func	raycast({array} targets, {tilemap} map, {real} xStart, {real} yStart, {real} dir, {real} maxDist, {real} res)
function raycast(_targets, _map, _xStart, _yStart, _dir, _maxDist, _res)
{
	// Loop forward
	for (var _len = _res; _len <= _maxDist; _len += _res)
	{
		// Check laser tile collision
		var _x = _xStart + lengthdir_x(_len, _dir);
		var _y = _yStart + lengthdir_y(_len, _dir);
		if (tilemap_get_at_pixel(_map, _x, _y) == 1) return new BEVector2(_x, _y);
		else
		{
			// Check laser block collision
			var _inst = collision_point(_x, _y, oSolid, false, true);
			if (_inst != noone && _inst.object_index != oGlassBlock)
			{
				// If in targets
				for (var _i = 0; _i < array_length(_targets); _i++)
				{
					if (_targets[_i] == _inst.object_index) return _inst;
				}
				return new BEVector2(_x, _y);
			}
		}
	}
}