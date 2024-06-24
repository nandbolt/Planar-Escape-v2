// Move input direction
moveInput.set();
if (instance_exists(oPlayer))
{
	// Check attack
	var _dx = oPlayer.x - x, _dy = oPlayer.y - y;
	if (point_distance(0, 0, _dx, _dy) < 8)
	{
		// Death dust particles
		with (oPlayer)
		{
			for (var _j = 0; _j <= 1; _j += 0.5)
			{
				for (var _i = 0; _i <= 1; _i += 0.5)
				{
					var _x = bbox_left + (bbox_right - bbox_left) * _i, _y = bbox_top + (bbox_bottom - bbox_top) * _j;
					with (oParticleManager)
					{
						part_particles_create_color(partSystem, _x, _y, partTypeDust, c_green, 1);
					}
				}
			}
		}
		
		destroyBox(oPlayer, be_oBoxEngine);
	}
	else
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

// Move input strength
moveInput.scale(moveSpeed);

// Apply move input
box.addForceVector(moveInput);

// Animations
if (moveInput.x == 0 || moveInput.y == 0)
{
	if (moveInput.x > 0) image_index = 0;
	else if (moveInput.x < 0) image_index = 4;
	else if (moveInput.y < 0) image_index = 2;
	else if (moveInput.y > 0) image_index = 6;
}
else
{
	if (moveInput.x > 0 && moveInput.y < 0) image_index = 1;
	else if (moveInput.x < 0 && moveInput.y < 0) image_index = 3;
	else if (moveInput.x < 0 && moveInput.y > 0) image_index = 5;
	else if (moveInput.x > 0 && moveInput.y > 0) image_index = 7;
}