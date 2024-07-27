/// @desc Think Timer

// State logic
switch (mentalState)
{
	case CitizenState.WANDER:
		// Update rotation
		updateRotation();
		break;
	case CitizenState.ALERTED:
		// Switch to chase
		mentalState = CitizenState.FLEE;
		alarm[0] = 180;
		break;
	case CitizenState.FLEE:
		// Switch to wander if no target or target is too far
		if (!instance_exists(target) || point_distance(x, y, target.x, target.y) > sight.maxViewDistance) mentalState = CitizenState.WANDER;
		break;
}

// Reset alarm
alarm[0] = thinkFreq;