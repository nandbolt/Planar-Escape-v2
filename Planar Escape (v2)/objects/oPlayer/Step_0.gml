// Move input direction
moveInput.x = keyboard_check(ord("D")) - keyboard_check(ord("A"));
moveInput.y = keyboard_check(ord("S")) - keyboard_check(ord("W"));
moveInput.normalize();
moveInput.scale(moveSpeed);

// Dash
if (keyboard_check_pressed(vk_space) && alarm[0] == -1) dash();

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
updateAnimations();

// Gadget
if (!is_undefined(gadget)) gadget.update();

#region After Image

// If can dash and particle ready or a dash afterimage exists
if ((afterimageCounter >= afterimageFrequency && alarm[0] == -1) || dashAfterImageCounter > 0)
{
	// Spawn afterimage
	with (oParticleManager)
	{
		part_particles_create(partSystemLow, other.x, other.y, partTypeAfterImage, 1);
	}
	
	// Reset counter
	afterimageCounter = 0;
	if (dashAfterImageCounter > 0) dashAfterImageCounter--;
}
else afterimageCounter++;

#endregion