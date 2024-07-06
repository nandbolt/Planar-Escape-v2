// Inherit the parent event
event_inherited();

// States
activated = false;
deadly = false;
detonateExplosives = false;
startExplosives = true;

// Explosion
maxExplosionForce = 500000;
maxExplosionForceRadius = 36;
explosionRadius = 60;
explosionParticleDensityFactor = 1/32;
explosionColor = c_orange;

// Tiles
collisionMap = layer_tilemap_get_id("CollisionTiles");
worldMap = layer_tilemap_get_id("WorldTiles");

// Detection hitbox
detectionBox = instance_create_layer(x, y, "Instances", oHitbox);
with (detectionBox)
{
	image_xscale = (other.bbox_right - other.bbox_left + 4) * 0.5;
	image_yscale = (other.bbox_bottom - other.bbox_top + 4) * 0.5;
}

#region Functions

/// @func	activate();
activate = function()
{
	activated = true;
	alarm[0] = 60;
	image_index++;
			
	// Countdown sound
	if (isVisible(id) && !audio_is_playing(sfxCountdown)) audio_play_sound(sfxCountdown, 10, false);
}

/// @func	explode();
explode = function()
{
	// Loop through boxes
	with (oSolid)
	{
		// If close
		var _dist = point_distance(x, y, other.x, other.y);
		if (_dist < other.explosionRadius)
		{
			// If made of glass and close enough
			if (object_index == oGlassBlock && _dist < other.maxExplosionForceRadius)
			{
				// Glass particles
				emitZapParticles(self, c_ltgray);
				
				// Destroy box
				destroyBox(id, be_oBoxEngine);
			}
			// If explosion is deadly and non-robot actor and close enough
			else if (other.deadly && object_is_ancestor(object_index, oActor) && object_index != oRobot && _dist < other.maxExplosionForceRadius)
			{
				// Actor particles
				emitZapParticles(self, c_red);
				
				// Destroy actor
				destroyBox(id, be_oBoxEngine);
			}
			else
			{
				// Init explosion force direction
				var _explosionForce = new BEVector2(x - other.x, y - other.y);
				_explosionForce.normalize();
			
				// Set explosion strength
				if (_dist < other.maxExplosionForceRadius) _explosionForce.scale(other.maxExplosionForce);
				else
				{
					var _range = other.explosionRadius - other.maxExplosionForceRadius;
					_explosionForce.scale((_range - clamp(_dist, 0, _range-2)) / _range * other.maxExplosionForce);
				}
			
				// Apply explosion force
				box.addForceVector(_explosionForce);
				
				// If detonate explosives and an explosive block
				if ((object_index == oExplosiveBlock || object_index == oRedExplosiveBlock) && _dist < other.maxExplosionForceRadius)
				{
					if (other.detonateExplosives)
					{
						// Explode block (next frame)
						if (!activated) activate();
						
						// Set to explode next frame
						image_index = image_number-1;
						alarm[0] = 2;
					}
					else if (other.startExplosives)
					{
						// Start explosive
						if (!activated) activate();
					}
				}
			}
		}
	}
	
	// Loop through tiles
	for (var _y = y - maxExplosionForceRadius; _y <= y + maxExplosionForceRadius; _y += TILE_SIZE)
	{
		for (var _x = x - maxExplosionForceRadius; _x <= x + maxExplosionForceRadius; _x += TILE_SIZE)
		{
			// If tile is glass
			if (tilemap_get_at_pixel(collisionMap, _x, _y) == 2)
			{
				// Break glass
				tilemap_set_at_pixel(collisionMap, 0, _x, _y);
				tilemap_set_at_pixel(worldMap, 0, _x, _y);
				
				// Glass particles
				with (oParticleManager)
				{
					part_particles_create(partSystem, _x, _y, partTypeDust, 3);
				}
			}
		}
	}
	
	// Explosion particles
	repeat (floor(explosionRadius * explosionRadius * explosionParticleDensityFactor))
	{
		var _len = irandom(explosionRadius), _dir = irandom(359);
		var _x = x + lengthdir_x(_len, _dir), _y = y + lengthdir_y(_len, _dir);
		with (oParticleManager)
		{
			part_particles_create_color(partSystem, _x, _y, partTypeDust, other.explosionColor, 1);
		}
	}
	
	// Explosion sound
	if (isVisible(id) && !audio_is_playing(sfxExplosion)) audio_play_sound(sfxExplosion, 10, false);;
	
	// Explode
	destroyBox(id, be_oBoxEngine);
}

#endregion