// Emit particles if on
if (powerType != Power.OFF)
{
	var _c = c_red;
	if (powerType == Power.GREEN) _c = c_green;
	with (oParticleManager)
	{
		part_particles_create_color(partSystem, other.x, other.y, partTypePulse, _c, 1);
	}
}

// Reset alarm
alarm[0] = particleFreq;