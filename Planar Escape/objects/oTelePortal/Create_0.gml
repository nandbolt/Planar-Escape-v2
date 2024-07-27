// Inherit the parent event
event_inherited();

// Teleport
otherPortal = noone;
teleColor = c_red;

/// @func	teleport({id} solid);
teleport = function(_solid)
{
	// Return if other portal doesn't exist
	if (!instance_exists(otherPortal)) return;
	
	// From particles
	emitZapParticles(_solid, teleColor);
	
	// Move to other portal
	_solid.x = otherPortal.x;
	_solid.y = otherPortal.y;
	_solid.alarm[11] = 2;
	
	// To particles
	emitZapParticles(_solid, otherPortal.teleColor);
}