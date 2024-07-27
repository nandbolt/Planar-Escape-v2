// State logic
switch (mentalState)
{
	case CitizenState.WANDER:
		// Move forward
		moveInput.setVector(facingDirection);
		moveInput.scale(0.5);
		
		// Update sight
		scanPhase += scanSpeed;
		var _scanOffset = sin(scanPhase) * scanRange;
		sight.viewAngleOffset = _scanOffset;
		sight.update();
		break;
	case CitizenState.ALERTED:
		alertY = lerp(alertY, y-6, 0.1);
		break;
	case CitizenState.FLEE:
		// If has a target
		if (instance_exists(target))
		{
			// Move to target
			var _dx = x - target.x, _dy = y - target.y;
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
		else mentalState = CitizenState.WANDER;
		break;
}

// Inherit the parent event
event_inherited();