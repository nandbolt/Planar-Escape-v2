/// @func   destroyBox({id} boxInst, {id} boxEngine);
/// @desc   Destroys a box instance an removes it from the physics engine.
function destroyBox(_boxInst, _boxEngine)
{
	// Remove from the engine
	with (_boxEngine)
	{
		removeBox(_boxInst.box);
	}
	
	// If player
	if (_boxInst.object_index == oPlayer && !oLevel.levelComplete)
	{
		// Set level alarm to either respawn or end game
		with (oLevel)
		{
			alarm[0] = respawnDelay;
		}
	}
		
	// Destroy box instance
	instance_destroy(_boxInst);
}

/// @func	spawnBox({object} boxObj, {real} x, {real} y, {string} layerName, {id} boxEngine);
function spawnBox(_boxObj, _x, _y, _layerName, _boxEngine)
{
	// Create box instance
	var _boxInst = instance_create_layer(_x, _y, _layerName, _boxObj);
	
	// Add box to engine
	with (_boxEngine)
	{
		array_push(boxes, _boxInst.box);
	}
	
	// Return box instance
	return _boxInst;
}

/// @func	isIce({id} block);
function isIce(_block)
{
	if (object_is_ancestor(_block.object_index, oIceBlock) || _block.object_index == oIceBlock) return true;
	return false;
}