// Inherit the parent event
event_inherited();

// Laser
laserStart = new BEVector2(x + lengthdir_x(5, image_angle), y + lengthdir_y(5, image_angle));
maxLaserLength = 314;
laserLength = 0;
iceShrinkSpeed = 0.005;
iceMinSize = 4;
sprLaser= sLaser;
laserColor = c_red;
powerType = Power.RED;

// Layers
collisionMap = layer_tilemap_get_id("CollisionTiles");

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

#endregion

// Start alarms
alarm[0] = 20;