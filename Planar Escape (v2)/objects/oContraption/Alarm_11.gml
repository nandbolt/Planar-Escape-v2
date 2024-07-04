// If self-powered
if (selfPowered)
{
	// Set power
	updatePower(powerType);
	exit;
}

// If power is on
var _tile = tilemap_get_at_pixel(wireMap, x, y);
if (_tile > 17)
{
	// If power is different
	var _powerType = wireToPower(_tile);
	if (_powerType != powerType)
	{
		// Set power
		updatePower(_powerType);
		powerType = _powerType;
	}
}

// Reset alarm
alarm[11] = powerCheckFreq;