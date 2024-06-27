// Inherit the parent event
event_inherited();

// Box
box.setMass(25);

// Movement
moveInput = new BEVector2();
moveSpeed = 5000;
facingDirection = new BEVector2(1, 0);
facingAngle = 0;

#region Functions

/// @func	updateAnimations()
updateAnimations = function()
{
	// Return if no move input
	if (moveInput.x == 0 && moveInput.y == 0) return;
	
	// If not moving diagonal
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
	
	// Set facing direction
	facingDirection.setVector(moveInput);
	facingDirection.normalize();
	facingAngle = facingDirection.angleDegrees();
}

#endregion