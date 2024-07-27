// If self-powered
if (selfPowered)
{
	// Set power
	updatePower(powerType);
	exit;
}

// If power is different
var _powerType = wireToPower(tilemap_get_at_pixel(wireMap, x, y));
if (_powerType != powerType)
{
	// Set power
	updatePower(_powerType);
	powerType = _powerType;
}

// Reset alarm
alarm[11] = powerCheckFreq;