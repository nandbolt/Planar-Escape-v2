/// @desc Countdown Timer
if (image_index == image_number-1)
{
	// Loop through boxes
	with (be_oBox)
	{
		// If close
		var _dist = point_distance(x, y, other.x, other.y);
		if (_dist < other.explosionRadius)
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
	
	
	// Explode
	destroyBox(id, be_oBoxEngine);
}
else
{
	image_index++;
	alarm[0] = 60;
}