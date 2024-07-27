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
	
	// Sound
	audio_play_sound(sfxCollect, 10, false);
	audio_sound_pitch(sfxCollect, random_range(0.8, 1.2));
	
	// Destroy star
	instance_destroy();
}