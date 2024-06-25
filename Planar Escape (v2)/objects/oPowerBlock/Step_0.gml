// If on a new tile
var _tx = floor(x / TILE_SIZE) * TILE_SIZE, _ty = floor(y / TILE_SIZE) * TILE_SIZE;
if (_tx != prevTilePosition.x || _ty != prevTilePosition.y)
{
	// Turn off power if not on a wire
	if (tilemap_get_at_pixel(wireMap, _tx, _ty) == 0) toggleWirePowerline(wireMap, prevTilePosition.x, prevTilePosition.y, false);
}

// Set previous tile
prevTilePosition.x = _tx;
prevTilePosition.y = _ty;