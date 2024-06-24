// Update laser
laserStart.x = x + lengthdir_x(5, image_angle);
laserStart.y = y + lengthdir_y(5, image_angle);
var _x = laserStart.x, _y = laserStart.y;
for (laserLength = 6; laserLength <= maxLaserLength; laserLength += 3)
{
	// Check laser tile collision
	_x = laserStart.x + lengthdir_x(laserLength, image_angle);
	_y = laserStart.y + lengthdir_y(laserLength, image_angle);
	if (tilemap_get_at_pixel(collisionMap, _x, _y) > 0) break;
	else
	{
		// Check laser block collision
		var _inst = collision_point(_x, _y, be_oBox, false, true);
		if (_inst != noone)
		{
			// If actor
			if (object_is_ancestor(_inst.object_index, oActor))
			{
				// Death dust particles
				with (_inst)
				{
					for (var _j = 0; _j <= 1; _j += 0.5)
					{
						for (var _i = 0; _i <= 1; _i += 0.5)
						{
							var _x = bbox_left + (bbox_right - bbox_left) * _i, _y = bbox_top + (bbox_bottom - bbox_top) * _j;
							with (oParticleManager)
							{
								part_particles_create_color(partSystem, _x, _y, partTypeDust, c_red, 1);
							}
						}
					}
				}
				
				// Destroy actor
				destroyBox(_inst, be_oBoxEngine);
			}
			else if (_inst.object_index == oIceBlock)
			{
				// Shrink ice
				_inst.image_xscale -= iceShrinkSpeed;
				_inst.image_yscale -= iceShrinkSpeed;
				
				// Destroy ice if too small
				if (_inst.bbox_right - _inst.bbox_left < iceMinSize)
				{
					with (oParticleManager)
					{
						part_particles_create_color(partSystem, _inst.x, _inst.y, partTypeDust, c_aqua, 3);
					}
					destroyBox(_inst, be_oBoxEngine);
				}
			}
			break;
		}
	}
}