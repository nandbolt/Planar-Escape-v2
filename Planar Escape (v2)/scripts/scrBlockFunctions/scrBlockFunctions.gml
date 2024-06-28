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

/// @func	isIce({id} block);
function isIce(_block)
{
	if (object_is_ancestor(_block.object_index, oIceBlock) || _block.object_index == oIceBlock) return true;
	return false;
}