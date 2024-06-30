// Move
x += velocity.x;
y += velocity.y;

// If colliding with a block
if (place_meeting(x, y, oSolid))
{
	// Check laser block collision
	var _inst = instance_place(x, y, oSolid);
	if (_inst != noone && _inst.object_index != oGlassBlock && _inst.object_index != oBeamSplitterBlock)
	{
		// Zap solid
		zap(self, _inst, powerType);
		
		// Particles
		with (oParticleManager)
		{
			part_particles_create_color(partSystem, other.x, other.y, partTypeDust, other.laserColor, 1);
		}
	
		// Destroy self
		instance_destroy();
	}
}
// Else if colliding with a tile
else if (tilemap_get_at_pixel(collisionMap, x, y) == 1)
{
	// Particles
	with (oParticleManager)
	{
		part_particles_create_color(partSystem, other.x, other.y, partTypeDust, other.laserColor, 1);
	}
	
	// Destroy self
	instance_destroy();
}