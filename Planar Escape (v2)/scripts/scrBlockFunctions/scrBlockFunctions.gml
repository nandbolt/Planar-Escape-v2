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
	if (_boxInst.object_index == oPlayer) oLevel.levelFailed = true;
		
	// Destroy box instance
	instance_destroy(_boxInst);
}

/// @func	toggleWirePowerline({id} wireMap, {real} x, {real} y, {bool} on);
///	@desc	Updates the power line by turning it on or off.
function toggleWirePowerline(_wireMap, _x, _y, _on)
{
	// Return if starting point isn't on a powerline
	var _tile = tilemap_get_at_pixel(_wireMap, _x, _y);
	if (_tile == 0) return;
	
	// Toggle power of first tile
	toggleWirePower(_wireMap, _tile, _x, _y, _on);
	
	// Loop until all power lines are touched
	var _frontier = [new BEVector2(x, y)];
	while (array_length(_frontier) > 0)
	{
		// Get position
		var _tp = array_pop(_frontier);
		
		// Check neighbors
		var _tile = tilemap_get_at_pixel(_wireMap, _tp.x, _tp.y);
	}
}

/// @func	toggleWirePower({id} wireMap, {int} tile, {real} x, {real} y, {bool} on);
///	@desc	Updates the power of one tile by turning it on or off.
function toggleWirePower(_wireMap, _tile, _x, _y, _on)
{
	// Toggle power of first tile
	if (_on && _tile < 18) tilemap_set_at_pixel(_wireMap, _tile+18, x, y);
	else if (!_on && _tile > 17) tilemap_set_at_pixel(_wireMap, _tile-18, x, y);
}