/// @desc Think Timer

// State logic
switch (mentalState)
{
	case ZombieState.WANDER:
		// Update rotation
		updateRotation();
		break;
	case ZombieState.ALERTED:
		// Switch to chase
		mentalState = ZombieState.CHASE;
		alarm[0] = 180;
		break;
	case ZombieState.CHASE:
		// Switch to wander if no target or target is too far
		if (!instance_exists(target) || point_distance(x, y, target.x, target.y) > sight.maxViewDistance) mentalState = ZombieState.WANDER;
		break;
}

// Reset alarm
alarm[0] = thinkFreq;