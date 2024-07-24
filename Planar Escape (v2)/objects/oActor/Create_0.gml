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

/// @func	setFacing({int} imageIdx);
setFacing = function(_imageIdx=0)
{
	// Set index
	image_index = _imageIdx;
	
	// Set direction
	if (image_index == 0) facingDirection.set(1, 0);
	else if (image_index == 1) facingDirection.set(1, -1);
	else if (image_index == 2) facingDirection.set(0, -1);
	else if (image_index == 3) facingDirection.set(-1, -1);
	else if (image_index == 4) facingDirection.set(-1, 0);
	else if (image_index == 5) facingDirection.set(-1, 1);
	else if (image_index == 6) facingDirection.set(0, 1);
	else if (image_index == 7) facingDirection.set(1, 1);
	
	// Normalize and set angle
	facingDirection.normalize();
	facingAngle = facingDirection.angleDegrees();
}

#endregion

// Loop through instances
var _layerId = layer_get_id("ActorInstances");
layer_add_instance(_layerId, self);