// States
powerType = Power.OFF;
selfPowered = false;

// Power
powerCheckFreq = 10;

// Layers
wireMap = layer_tilemap_get_id("WireTiles");

#region Functions

///	@func	updatePower({enum.Power} type);
updatePower = function(_type){}

#endregion

// Start alarms
alarm[11] = 1;