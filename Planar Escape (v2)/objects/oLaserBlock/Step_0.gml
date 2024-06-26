// Update laser
laserStart.x = x + lengthdir_x(5, image_angle);
laserStart.y = y + lengthdir_y(5, image_angle);
var _x = laserStart.x, _y = laserStart.y;
for (laserLength = 6; laserLength <= maxLaserLength; laserLength += 3)
{
	// Check laser tile collision
	_x = laserStart.x + lengthdir_x(laserLength, image_angle);
	_y = laserStart.y + lengthdir_y(laserLength, image_angle);
	if (tilemap_get_at_pixel(collisionMap, _x, _y) == 1) break;
	else
	{
		// Check laser block collision
		var _inst = collision_point(_x, _y, be_oBox, false, true);
		if (_inst != noone && _inst.object_index != oGlassBlock)
		{
			// If actor
			if (object_is_ancestor(_inst.object_index, oActor)) zapActor(_inst);
			else if (_inst.object_index == oIceBlock || _inst.object_index == oBigIceBlock)
			{
				with (_inst)
				{
					zap(other.powerType);
				}
			}
			else if (_inst.object_index == oPowerBlock)
			{
				// Turn on power block
				with (_inst)
				{
					togglePower(other.powerType);
				}
			}
			break;
		}
	}
}