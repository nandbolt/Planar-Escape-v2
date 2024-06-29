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
	emitZapParticles(self, c_gray);
	
	// Destroy star
	instance_destroy();
}