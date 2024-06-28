// State logic
switch (mentalState)
{
	case CopState.PATROL:
		// Move forward
		moveInput.setVector(facingDirection);
		moveInput.scale(0.5);
		
		// Update sight
		scanPhase += scanSpeed;
		var _scanOffset = sin(scanPhase) * 45;
		sight1.viewAngleOffset = _scanOffset;
		sight2.viewAngleOffset = -_scanOffset;
		sight1.update();
		sight2.update();
		break;
	case CopState.ALERTED:
		alertY = lerp(alertY, y-6, 0.1);
		break;
	case CopState.CHASE:
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
		else mentalState = CopState.PATROL;
		break;
}

// Inherit the parent event
event_inherited();

// Gadget
if (!is_undefined(gadget)) gadget.update();