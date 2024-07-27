/// @desc Particles
if (isVisible(id))
{
	var _x = irandom_range(bbox_left, bbox_right), _y = irandom_range(bbox_bottom, bbox_top);
	with (oParticleManager)
	{
		part_particles_create_color(partSystem, _x, _y, partTypeDust, c_aqua, 1);
	}
}
alarm[0] = 20;