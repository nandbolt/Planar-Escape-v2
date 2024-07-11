// Inherit the parent event
event_inherited();

// State
traceActive = false;

// Movement
moveSpeed = 5000;

// Collectables
stars = 0;
stardisks = 0;

// Gadgets
gadget = undefined;

// Dash
dashStrength = 40;
afterimageCounter = 0;
afterimageFrequency = 10;
dashAfterImageNumber = 5;
dashAfterImageCounter = 0;
dashCooldown = 60;

// Tiles
groundTiles = layer_tilemap_get_id("GroundTiles");

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
	audio_sound_pitch(sfxDash, random_range(0.9, 1.1));
	
	// Set afterimage
	dashAfterImageCounter = dashAfterImageNumber;
	
	// Cooldown
	alarm[0] = dashCooldown;
}

/// @func	trace();
trace = function()
{
	// Init trace
	var _traced = false;
	
	// Loop around bbox
	for (var _j = 0; _j < 2; _j++)
	{
		for (var _i = 0; _i < 2; _i++)
		{
			// Get position
			var _x = bbox_left + _i * (bbox_right - bbox_left), _y = bbox_top + _j * (bbox_bottom - bbox_top);
			
			// If tile is not already traced
			if (tilemap_get_at_pixel(groundTiles, _x, _y) == 0)
			{
				// Trace tile
				tilemap_set_at_pixel(groundTiles, 1, _x, _y);
				_traced = true;
				oLevel.tilesTraced++;
			}
		}
	}
	
	// Trace sound
	if (_traced) audio_play_sound(sfxTrace, 5, false);
}

#endregion

// If grafitti mode
if (global.mode == Mode.TRACE) traceActive = true;

// Set player sprite
sprite_index = global.skin;