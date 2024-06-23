// Move input direction
moveInput.x = keyboard_check(ord("D")) - keyboard_check(ord("A"));
moveInput.y = keyboard_check(ord("S")) - keyboard_check(ord("W"));
moveInput.normalize();

// Move input strength
if (keyboard_check_pressed(vk_space)) moveInput.scale(moveSpeed * 50);
else moveInput.scale(moveSpeed);

// Apply move input
box.addForceVector(moveInput);