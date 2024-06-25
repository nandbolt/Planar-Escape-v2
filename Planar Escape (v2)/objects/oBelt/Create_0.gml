// States
beltDirection = 0;
beltStrength = 0.175;
//beltStrength = 5;

// Layer
wireMap = layer_tilemap_get_id("WireTiles");

/// @func	updateBelt({int} dir);
updateBelt = function(_dir)
{
	// Return if no belt change
	if (beltDirection == _dir) return;
	
	// Set belt direction
	beltDirection = _dir;
	if (beltDirection == 0) image_speed = 0;
	else
	{
		image_speed = 1;
		if (beltDirection == 1) sprite_index = sBeltForward;
		else sprite_index = sBeltBackward;
	}
}

// Init belt
image_speed = 0;