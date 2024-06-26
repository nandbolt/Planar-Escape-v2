// Inherit the parent event
event_inherited();

// Box
box.setMass(25);

// Movement
moveInput = new Vector2();
moveSpeed = 5000;

#region Functions

/// @func	updateAnimations()
updateAnimations = function()
{
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
}

/// @func	getFacingVector();
getFacingVector = function()
{
	var _facingVector = new BEVector2();
	if (image_index == 0) _facingVector.set(1, 0);
	else if (image_index == 1) _facingVector.set(1, -1);
	else if (image_index == 2) _facingVector.set(0, -1);
	else if (image_index == 3) _facingVector.set(-1, -1);
	else if (image_index == 4) _facingVector.set(-1, 0);
	else if (image_index == 5) _facingVector.set(-1, 1);
	else if (image_index == 6) _facingVector.set(0, 1);
	else if (image_index == 7) _facingVector.set(1, 1);
	_facingVector.normalize();
	return _facingVector;
}

#endregion