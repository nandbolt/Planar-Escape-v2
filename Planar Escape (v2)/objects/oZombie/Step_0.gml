// State logic
switch (mentalState)
{
	case ZombieState.WANDER:
		// Move forward
		moveInput.setVector(facingDirection); 
		
		// Update view
		sight.update();
		break;
	case ZombieState.ALERTED:
		alertY = lerp(alertY, y-6, 0.1);
		break;
	case ZombieState.CHASE:
		// If has a target
		if (instance_exists(target))
		{
			// Move to target
			var _dx = target.x - x, _dy = target.y - y;
			var _relativeAngle = point_direction(0, 0, _dx, _dy) mod 90;
			if (_relativeAngle > 30 && _relativeAngle < 60)
			{
				moveInput.x = sign(_dx);
				moveInput.y = sign(_dy);
			}
			else if (abs(_dx) > abs(_dy)) moveInput.x = sign(_dx);
			else moveInput.y = sign(_dy);
			moveInput.normalize();
		}
		else mentalState = ZombieState.WANDER;
		break;
}

// Check zombification
with (oActor)
{
	if ((object_index == oPlayer || object_index == oCop || object_index == oCitizen) && point_distance(x, y, other.x, other.y) < 8) zombify(self);
}

// Inherit the parent event
event_inherited();