// Emit particles if on
if (isVisible(id) && powerType != Power.OFF)
{
	var _c = c_red;
	if (powerType == Power.GREEN) _c = c_green;
	with (oParticleManager)
	{
		if (instance_exists(other.target)) part_particles_create_color(partSystem, other.target.x, other.target.y, partTypeDust, _c, 1);
		part_particles_create_color(partSystem, other.x, other.y, partTypePulse, _c, 1);
	}
}

// Reset alarm
alarm[0] = particleFreq;