// Inherit the parent event
event_inherited();

// State
powered = false;
prevTilePosition = new BEVector2(floor(x / TILE_SIZE) * TILE_SIZE, floor(y / TILE_SIZE) * TILE_SIZE);

// Power
offDelay = 10;

// Wires
wireMap = layer_tilemap_get_id("WireTiles");

#region Functions

/// @func	togglePower({bool} on);
togglePower = function(_on)
{
	// Return if same powered state requested
	if (powered == _on) return;
	
	// Toggle block on/off
	if (_on)
	{
		// Set alarm
		alarm[0] = offDelay;
		image_index = 1;
	}
	else image_index = 0;
	
	// Set powered state
	powered = _on;
	
	// Toggle powerline
	toggleWirePowerline(wireMap, x, y, _on);
}

#endregion