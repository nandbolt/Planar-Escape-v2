/// @desc Think Timer

// State logic
switch (mentalState)
{
	case CopState.PATROL:
		// Update rotation
		updateRotation();
		break;
	case CopState.ALERTED:
		// Switch to chase
		mentalState = CopState.CHASE;
		alarm[0] = 180;
		break;
	case CopState.CHASE:
		// Switch to wander if no target or target is too far
		if (!instance_exists(target) || point_distance(x, y, target.x, target.y) > sight1.maxViewDistance) mentalState = CopState.PATROL;
		break;
}

// Reset alarm
alarm[0] = thinkFreq;