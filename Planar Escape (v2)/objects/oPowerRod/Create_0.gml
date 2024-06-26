// Power
powerType = Power.OFF;
particleFreq = 20;

// Layer
wireMap = layer_tilemap_get_id("WireTiles");

// Target
target = noone;
targetRange = 60;

// Zap
zapColor = c_red;
sprZap = sLaser;

#region Functions

/// @func	updateRod({enum.Power} type);
updateRod = function(_type)
{
	// Set power type
	powerType = _type;
	if (_type == Power.RED)
	{
		image_index = 1;
		zapColor = c_red;
		sprZap = sLaser;
	}
	else if (_type == Power.GREEN)
	{
		image_index = 2;
		zapColor = c_green;
		sprZap = sZombieLaser;
	}
	else
	{
		image_index = 0;
		target = noone;
	}
}

/// @func	zapActor({id} actor);
zapActor = function(_actor)
{
	// Return if green and zombie
	if (powerType == Power.GREEN && target.object_index == oZombie) return;
	
	// Death dust particles
	var _c = zapColor;
	with (_actor)
	{
		for (var _j = 0; _j <= 1; _j += 0.5)
		{
			for (var _i = 0; _i <= 1; _i += 0.5)
			{
				var _x = bbox_left + (bbox_right - bbox_left) * _i, _y = bbox_top + (bbox_bottom - bbox_top) * _j;
				with (oParticleManager)
				{
					part_particles_create_color(partSystem, _x, _y, partTypeDust, _c, 1);
				}
			}
		}
	}
	
	// If green power
	if (powerType == Power.GREEN)
	{
		// Create zombie
		target = instance_create_layer(_actor.x, _actor.y, "Instances", oZombie);
		with (target)
		{
			// Add boxes to box engine
			array_push(be_oBoxEngine.boxes, box);
		
			// Set velocity
			box.setVelocityVector(_actor.box.getVelocity());
		}
	}
				
	// Destroy actor
	destroyBox(_actor, be_oBoxEngine);
}

#endregion

// Particle alarm
alarm[0] = particleFreq;