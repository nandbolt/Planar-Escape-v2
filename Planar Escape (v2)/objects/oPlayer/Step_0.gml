// Move input direction
moveInput.x = keyboard_check(ord("D")) - keyboard_check(ord("A"));
moveInput.y = keyboard_check(ord("S")) - keyboard_check(ord("W"));
moveInput.normalize();
moveInput.scale(moveSpeed);

// Dash
if (keyboard_check_pressed(vk_space))
{
	var _facingDir = getFacingVector();
	_facingDir.scale(moveSpeed * 50);
	moveInput.addVector(_facingDir);
	
	// Dash particles
	for (var _j = 0; _j <= 1; _j += 0.5)
	{
		for (var _i = 0; _i <= 1; _i += 0.5)
		{
			var _x = bbox_left + (bbox_right - bbox_left) * _i, _y = bbox_top + (bbox_bottom - bbox_top) * _j;
			with (oParticleManager)
			{
				part_particles_create(partSystem, _x, _y, partTypeDust, 1);
			}
		}
	}
}

// Apply move input
box.addForceVector(moveInput);

// Collectables
if (place_meeting(x, y, oCollectable))
{
	// Collect instance
	with (instance_place(x, y, oCollectable))
	{
		collect(other.id);
	}
}

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

// Gadget
if (!is_undefined(gadget)) gadget.update();