/// @func   destroyBox({id} boxInst, {id} boxEngine);
/// @desc   description.
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