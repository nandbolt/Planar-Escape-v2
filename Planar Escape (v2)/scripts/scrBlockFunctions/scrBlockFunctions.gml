/// @func   destroyBox({id} boxInst, {id} boxEngine);
/// @desc   Destroys a box instance an removes it from the physics engine.
function destroyBox(_boxInst, _boxEngine)
{
	// Remove from the engine
	with (_boxEngine)
	{
		removeBox(_boxInst.box);
	}
		
	// End game if player
	if (_boxInst.object_index == oPlayer && !oLevel.levelComplete) oLevel.levelFailed = true;
		
	// Destroy box instance
	instance_destroy(_boxInst);
}

/// @func	toggleWirePowerline({id} wireMap, {real} x, {real} y, {enum.Power} type);
///	@desc	Updates the power line by turning it on or off.
function toggleWirePowerline(_wireMap, _x, _y, _type)
{
	// Return if starting point isn't on a powerline or already toggled
	var _tile = tilemap_get_at_pixel(_wireMap, _x, _y);
	var _tileType = floor(_tile / 18);
	if (_tile == 0 || _type == _tileType || (_type != Power.OFF && _tileType > Power.OFF)) return;
	
	// Toggle power of first tile
	toggleWirePower(_wireMap, _tile, _x, _y, _type);
	
	// Loop until all power lines are touched
	var _frontier = [new BEVector2(floor(_x), floor(_y))], _loops = 0;
	while (array_length(_frontier) > 0 && _loops < 2000)
	{
		// Increment counter
		_loops++;
		
		// Get position
		var _tp = array_pop(_frontier);
		
		// Check neighbors
		for (var _i = 0; _i < 4; _i++)
		{
			// Get direction
			var _dx = 0, _dy = 0;
			if (_i == 0) _dx = TILE_SIZE;
			else if (_i == 1) _dx = -TILE_SIZE;
			else if (_i == 2) _dy = TILE_SIZE;
			else _dy = -TILE_SIZE;
			
			// If tile is a wire
			_x = _tp.x + _dx;
			_y = _tp.y + _dy;
			_tile = tilemap_get_at_pixel(_wireMap, _x, _y);
			_tileType = floor(_tile / 18);
			if (_tile != 0)
			{
				// If not already toggled
				if (_type != _tileType)
				{
					// Add to frontier if not already in it
					var _inFrontier = false;
					for (var _j = 0; _j < array_length(_frontier); _j++)
					{
						// Get position
						var _ntp = _frontier[_j];
						if (_ntp.x == _x && _ntp.y == _y)
						{
							// Break since in frontier already
							_inFrontier = true;
							break;
						}
					}
					
					// If not in frontier
					if (!_inFrontier)
					{
						// Add to frontier and toggle power 
						array_push(_frontier, new BEVector2(_x, _y));
						toggleWirePower(_wireMap, _tile, _x, _y, _type);
					}
				}
			}
		}
	}
	_frontier = -1;	
}

/// @func	toggleWirePower({id} wireMap, {int} tile, {real} x, {real} y, {enum.Power} type);
///	@desc	Updates the power of one tile by turning it on or off.
function toggleWirePower(_wireMap, _tile, _x, _y, _type)
{
	// Toggle power of first tile
	if (_type != Power.OFF && _tile < 18) tilemap_set_at_pixel(_wireMap, _tile+18*_type, _x, _y);
	else if (_type == Power.OFF && _tile > 17) tilemap_set_at_pixel(_wireMap, _tile-18*floor(_tile/18), _x, _y);
}

/// @func	isIce({id} block);
function isIce(_block)
{
	if (object_is_ancestor(_block.object_index, oIceBlock) || _block.object_index == oIceBlock) return true;
	return false;
}