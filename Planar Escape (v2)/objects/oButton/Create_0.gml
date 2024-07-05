// Wiremap
wireMap = layer_tilemap_get_id("WireTiles");

#region Functions

/// @func	pressButton();
pressButton = function()
{
	image_index = 1;
	
	// Button sound
	if (isVisible(id)) audio_play_sound(sfxButtonPressed, 5, false);
	
	// Add wire
	tilemap_set_at_pixel(wireMap, 7, x, y);
	
	// Loop through neighbors
	for (var _i = 0; _i < 4; _i++)
	{
		// Get tile direction
		var _dx = 0, _dy = 0;
		if (_i == 0) _dx = TILE_SIZE;
		else if (_i == 1) _dx = -TILE_SIZE;
		else if (_i == 2) _dy = TILE_SIZE;
		else if (_i == 3) _dy = -TILE_SIZE;
		
		// If there is power nearby
		var _nx = x + _dx, _ny = y + _dy;
		var _tile = tilemap_get_at_pixel(wireMap, _nx, _ny);
		if (_tile > 17)
		{
			// Find power source
			var _power = findWirePowersource(wireMap, _nx, _ny, wireToPower(_tile));
		
			// If found one
			if (instance_exists(_power))
			{
				// Toggle powerline
				with (_power)
				{
					// Start at the button
					toggleWirePowerline(wireMap, other.x, other.y, powerType);
				}
			}
		}
	}
}

/// @func	releaseButton();
releaseButton = function()
{
	image_index = 0;
	
	// Button sound
	if (isVisible(id)) audio_play_sound(sfxButtonReleased, 5, false);
	
	// Remove wire
	tilemap_set_at_pixel(wireMap, 0, x, y);
	
	// Loop through neighbors
	for (var _i = 0; _i < 4; _i++)
	{
		// Get tile direction
		var _dx = 0, _dy = 0;
		if (_i == 0) _dx = TILE_SIZE;
		else if (_i == 1) _dx = -TILE_SIZE;
		else if (_i == 2) _dy = TILE_SIZE;
		else if (_i == 3) _dy = -TILE_SIZE;
		
		// If there is power nearby
		var _nx = x + _dx, _ny = y + _dy;
		var _tile = tilemap_get_at_pixel(wireMap, _nx, _ny);
		if (_tile > 17)
		{
			// Find power source
			var _power = findWirePowersource(wireMap, _nx, _ny, wireToPower(_tile));
		
			// If didn't find one
			if (!instance_exists(_power))
			{
				// Toggle powerline off starting at the nearby powered wire
				toggleWirePowerline(wireMap, _nx, _ny, Power.OFF);
			}
		}
	}
}

#endregion

// Remove wire
tilemap_set_at_pixel(wireMap, 0, x, y);