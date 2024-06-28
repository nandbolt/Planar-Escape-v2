/// @desc Think Timer

// State logic
switch (mentalState)
{
	case CopState.PATROL:
		// Rotate if on the same tile as before
		var _tx = floor(x / TILE_SIZE) * TILE_SIZE, _ty = floor(y / TILE_SIZE) * TILE_SIZE;
		if (_tx == prevTilePosition.x && _ty == prevTilePosition.y)
		{
			var _idx = (image_index + 2) mod image_number;
			if (_idx mod 2 == 1) _idx++;	// If odd, add one to make even
			setFacing(_idx);
		}
		
		// Set tile
		prevTilePosition.x = floor(x / TILE_SIZE) * TILE_SIZE;
		prevTilePosition.y = floor(y / TILE_SIZE) * TILE_SIZE;
		break;
	case CopState.ALERTED:
		// Switch to chase
		mentalState = CopState.CHASE;
		alarm[0] = 180;
		break;
	case CopState.CHASE:
		// Switch to wander if no target or target is too far
		if (!instance_exists(target) || point_distance(x, y, target.x, target.y) > maxViewDistance) mentalState = CopState.PATROL;
		break;
}

// Reset alarm
alarm[0] = thinkFreq;