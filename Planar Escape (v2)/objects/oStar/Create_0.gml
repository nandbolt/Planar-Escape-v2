// Inherit the parent event
event_inherited();

/// @func	collect({id} actor);
collect = function(_actor)
{
	with (_actor)
	{
		stars++;
	}
	oLevel.starsCollected++;
	
	// Particles
	with (oParticleManager)
	{
		part_particles_create(partSystem, other.x, other.y, partTypeStardustN, 1);
		part_particles_create(partSystem, other.x, other.y, partTypeStardustSW, 1);
		part_particles_create(partSystem, other.x, other.y, partTypeStardustSE, 1);
	}
	
	// Destroy star
	instance_destroy();
}