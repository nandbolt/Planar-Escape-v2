// If target
if (instance_exists(oPlayer))
{
	// Check attack
	var _dx = x - oPlayer.x, _dy = y - oPlayer.y;
	if (point_distance(0, 0, _dx, _dy) < 64)
	{
		// Move to target
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
}

// Inherit the parent event
event_inherited();

