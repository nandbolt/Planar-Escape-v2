// Emit particles if on
if (inCamView && powerType != Power.OFF)
{
	var _c = zapColor;
	with (oParticleManager)
	{
		if (instance_exists(other.target))
		{
			part_particles_create_color(partSystem, other.target.x, other.target.y, partTypeDust, _c, 1);
		}
	}
}

// Reset alarm
alarm[0] = particleFreq;