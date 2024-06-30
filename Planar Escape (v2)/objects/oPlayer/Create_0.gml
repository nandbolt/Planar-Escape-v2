// Inherit the parent event
event_inherited();

// Movement
moveSpeed = 5000;

// Collectables
stars = 0;

// Gadgets
gadget = new Grapple();

// Dash
dashStrength = 40;
afterimageCounter = 0;
afterimageFrequency = 10;
dashAfterImageNumber = 5;
dashAfterImageCounter = 0;
dashCooldown = 60;

#region Functions

/// @func	dash();
dash = function()
{
	// Set move input
	moveInput.addScaledVector(facingDirection, moveSpeed * dashStrength);
	
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
	
	// Dash sound
	audio_play_sound(sfxDash, 10, false);
	
	// Set afterimage
	dashAfterImageCounter = dashAfterImageNumber;
	
	// Cooldown
	alarm[0] = dashCooldown;
}

#endregion