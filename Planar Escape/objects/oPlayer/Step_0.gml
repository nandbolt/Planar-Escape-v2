// Move input direction
moveInput.x = (keyboard_check(ord("D")) || gamepad_button_check(0, gp_padr)) - (keyboard_check(ord("A")) || gamepad_button_check(0, gp_padl));
moveInput.y = (keyboard_check(ord("S")) || gamepad_button_check(0, gp_padd)) - (keyboard_check(ord("W")) || gamepad_button_check(0, gp_padu));
moveInput.normalize();
moveInput.scale(moveSpeed);

// Dash
if ((keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(0, gp_face1)) && alarm[0] == -1) dash();

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
else if (keyboard_check_pressed(ord("J")) || gamepad_button_check_pressed(0, gp_face2)) audio_play_sound(sfxGuiButtonLockedPressed, 10, false);

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

// Trace
if (markActive) mark();
else if (traceActive) trace();