// Inherit the parent event
event_inherited();

// Laser
sprLaser = sZombieLaser;
laserColor = c_green;

#region Functions

/// @func	zapActor({id} actor);
zapActor = function(_actor)
{
	// Return if zombie
	if (_actor.object_index == oZombie) return;
	
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
	
	// Create zombie
	with (instance_create_layer(_actor.x, _actor.y, "Instances", oZombie))
	{
		// Add boxes to box engine
		array_push(be_oBoxEngine.boxes, box);
		
		// Set velocity
		box.setVelocityVector(_actor.box.getVelocity());
	}
				
	// Destroy actor
	destroyBox(_actor, be_oBoxEngine);
}

#endregion