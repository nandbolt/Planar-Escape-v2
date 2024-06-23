// Move input direction
moveInput.x = keyboard_check(ord("D")) - keyboard_check(ord("A"));
moveInput.y = keyboard_check(ord("S")) - keyboard_check(ord("W"));
moveInput.normalize();

// Move input strength
if (keyboard_check_pressed(vk_space)) moveInput.scale(moveSpeed * 50);
else moveInput.scale(moveSpeed);

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