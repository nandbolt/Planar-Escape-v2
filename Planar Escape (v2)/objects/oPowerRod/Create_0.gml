// Power
powerType = Power.OFF;
particleFreq = 20;

// Layer
wireMap = layer_tilemap_get_id("WireTiles");

/// @func	updateRod({enum.Power} type);
updateRod = function(_type)
{
	// Set power type
	powerType = _type;
	if (_type == Power.RED) image_index = 1;
	else if (_type == Power.GREEN) image_index = 2;
	else image_index = 0;
}

// Particle alarm
alarm[0] = particleFreq;