// Inherit the parent event
event_inherited();

// Laser
sprLaser = sEntityLaser;
laserColor = c_dkgray;
powerType = Power.BLACK;

#region Functions

/// @func	zapActor({id} actor);
zapActor = function(_actor)
{
	// Death dust particles
	var _laserColor = laserColor;
	with (_actor)
	{
		for (var _j = 0; _j <= 1; _j += 0.5)
		{
			for (var _i = 0; _i <= 1; _i += 0.5)
			{
				var _x = bbox_left + (bbox_right - bbox_left) * _i, _y = bbox_top + (bbox_bottom - bbox_top) * _j;
				with (oParticleManager)
				{
					part_particles_create_color(partSystem, _x, _y, partTypeDust, _laserColor, 1);
				}
			}
		}
	}
				
	// Destroy actor
	destroyBox(_actor, be_oBoxEngine);
}

/// @func	zapBlock({id} block);
zapBlock = function(_block)
{
	// Dust particles
	with (_block)
	{
		for (var _j = 0; _j <= 1; _j += 0.5)
		{
			for (var _i = 0; _i <= 1; _i += 0.5)
			{
				var _x = bbox_left + (bbox_right - bbox_left) * _i, _y = bbox_top + (bbox_bottom - bbox_top) * _j;
				with (oParticleManager)
				{
					part_particles_create_color(partSystem, _x, _y, partTypeDust, c_dkgray, 1);
				}
			}
		}
	}
	
	// Destroy block
	destroyBox(_block, be_oBoxEngine);
}

#endregion