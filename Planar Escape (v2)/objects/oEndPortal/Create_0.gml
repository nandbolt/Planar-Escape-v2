// Inherit the parent event
event_inherited();

/// @func	teleport({id} solid);
teleport = function(_solid)
{
	// Complete level if player
	if (_solid.object_index == oPlayer) oLevel.levelComplete = true;
	
	// Destroy box
	destroyBox(_solid, be_oBoxEngine);
}