// Inherit the parent event
event_inherited();

// States
activated = false;

// Explosion
maxExplosionForce = 500000;
maxExplosionForceRadius = 24;
explosionRadius = 60;
explosionParticleDensityFactor = 1/32;

// Tiles
collisionMap = layer_tilemap_get_id("CollisionTiles");
worldMap = layer_tilemap_get_id("WorldTiles");

// Detection hitbox
detectionBox = instance_create_layer(x, y, "Instances", oHitbox);
with (detectionBox)
{
	image_xscale = (other.bbox_right - other.bbox_left + 2) * 0.5;
	image_yscale = (other.bbox_bottom - other.bbox_top + 2) * 0.5;
}

#region Functions

/// @func	explode();
explode = function()
{
	// Loop through boxes
	with (be_oBox)
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
			part_particles_create_color(partSystem, _x, _y, partTypeDust, c_orange, 1);
		}
	}
	
	// Explosion sound
	audio_play_sound(sfxExplosion, 10, false);
	
	// Explode
	destroyBox(id, be_oBoxEngine);
}

#endregion