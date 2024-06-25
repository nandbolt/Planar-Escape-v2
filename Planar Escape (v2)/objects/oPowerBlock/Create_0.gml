// Inherit the parent event
event_inherited();

// State
powerType = Power.OFF;
prevTilePosition = new BEVector2(floor(x / TILE_SIZE) * TILE_SIZE, floor(y / TILE_SIZE) * TILE_SIZE);

// Power
offDelay = 10;

// Wires
wireMap = layer_tilemap_get_id("WireTiles");

#region Functions

/// @func	togglePower({enum.Power} type);
togglePower = function(_type)
{
	// If same powered state requested
	if (powerType == _type)
	{
		// Reset power off timer and return
		alarm[0] = offDelay;
		return;
	}
	// Return if trying to turn on power and power is already on
	else if (_type != Power.OFF && powerType > Power.OFF) return;
	
	// Toggle block on/off
	image_index = _type;
	if (_type != Power.OFF) alarm[0] = offDelay;
	
	// Set powered state
	powerType = _type;
	
	// Toggle powerline
	toggleWirePowerline(wireMap, x, y, _type);
}

#endregion