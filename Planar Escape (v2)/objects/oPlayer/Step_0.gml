// Move input
moveInput.x = keyboard_check(ord("D")) - keyboard_check(ord("A"));
moveInput.y = keyboard_check(ord("S")) - keyboard_check(ord("W"));
moveInput.normalize();
moveInput.scale(moveSpeed);

// Velocity
velocity.addVector(moveInput);

// Rigid body
rbUpdate();