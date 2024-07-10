/// @desc Pulse Timer
if (inCamView && powerType != Power.OFF && !instance_exists(target))
{
	with (oParticleManager)
	{
		part_particles_create_color(partSystem, other.x, other.y, partTypePulse, other.zapColor, 1);
	}
}
alarm[1] = pulseFreq;