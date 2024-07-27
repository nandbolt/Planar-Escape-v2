// Inherit the parent event
event_inherited();

/// @func	collect({id} actor);
collect = function(_actor)
{
	with (_actor)
	{
		stardisks++;
	}
	oLevel.stardisksCollected++;
	
	// Particles
	with (oParticleManager)
	{
		part_particles_create(partSystem, other.x+4, other.y-4, partTypeStardustN, 1);
		part_particles_create(partSystem, other.x-4, other.y-4, partTypeStardustN, 1);
		part_particles_create(partSystem, other.x-8, other.y, partTypeStardustSW, 1);
		part_particles_create(partSystem, other.x-4, other.y+4, partTypeStardustSW, 1);
		part_particles_create(partSystem, other.x+8, other.y, partTypeStardustSE, 1);
		part_particles_create(partSystem, other.x+4, other.y+4, partTypeStardustSE, 1);
	}
	
	// Sound
	audio_play_sound(sfxCollectStardisk, 20, false);
	audio_sound_pitch(sfxCollect, random_range(0.95, 1.05));
	
	// Destroy star
	instance_destroy();
}