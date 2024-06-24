// Inherit the parent event
event_inherited();

// State
powered = false;

// Power
offDelay = 10;

// Wires
wireMap = layer_tilemap_get_id("WireTiles");

#region Functions

/// @func	turnOn();
turnOn = function()
{
	powered = true;
	alarm[0] = offDelay;
	image_index = 1;
	
	// Wires
	var _tile = tilemap_get_at_pixel(wireMap, x, y);
	if (_tile > 0 && _tile < 18) tilemap_set_at_pixel(wireMap, _tile + 18, x, y);
}

#endregion