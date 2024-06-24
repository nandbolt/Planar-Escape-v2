/// @desc Particles
if (isVisible(id))
{
	with (oParticleManager)
	{
		part_particles_create_color(partSystem, other.laserStart.x, other.laserStart.y, partTypeDust, c_red, 1);
		part_particles_create_color(partSystem, other.laserStart.x+lengthdir_x(other.laserLength, other.image_angle), other.laserStart.y+lengthdir_y(other.laserLength, other.image_angle), partTypeDust, c_red, 1);
	}
}
alarm[0] = 20;