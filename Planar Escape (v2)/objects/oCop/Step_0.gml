// State logic
switch (mentalState)
{
	case CopState.PATROL:
		// Move forward
		moveInput.setVector(facingDirection);
		moveInput.scale(0.5);
		
		// Update view counter
		viewDashImgIdx += viewDashImgSpd;
		if (viewDashImgIdx > viewDashImgNum) viewDashImgIdx = 0;
		
		// Update view
		if (viewDistance < maxViewDistance) currentMaxViewDistance = lerp(currentMaxViewDistance, maxViewDistance, 0.02);
		viewStart.x = x + lengthdir_x(6, facingAngle);
		viewStart.y = y + lengthdir_y(6, facingAngle);
		var _x = viewStart.x, _y = viewStart.y;
		for (viewDistance = 6; viewDistance <= currentMaxViewDistance; viewDistance += 6)
		{
			// Check view tile collision
			_x = viewStart.x + lengthdir_x(viewDistance, facingAngle);
			_y = viewStart.y + lengthdir_y(viewDistance, facingAngle);
			if (tilemap_get_at_pixel(collisionMap, _x, _y) == 1)
			{
				// Set current max view distance and break
				currentMaxViewDistance = viewDistance;
				break;
			}
			else
			{
				// Check view block collision
				var _inst = collision_point(_x, _y, oSolid, false, true);
				if (_inst != noone && _inst.object_index != oGlassBlock)
				{
					// If found a valid target
					if (_inst.object_index == oPlayer || _inst.object_index == oZombie || _inst.object_index == oCitizen)
					{
						// Switch to alert state
						target = _inst;
						mentalState = CopState.ALERTED;
						alertY = y;
						alarm[0] = 30;
					}
					
					// Set current max view distance and break
					currentMaxViewDistance = viewDistance;
					break;
				}
			}
		}
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