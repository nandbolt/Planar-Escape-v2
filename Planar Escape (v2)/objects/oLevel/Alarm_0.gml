/// @desc Spawn Player/End Game

// If a checkpoint exists
if (instance_exists(checkpoint))
{
	// Spawn player
	with (instance_create_layer(checkpoint.x, checkpoint.y, "Instances", oPlayer))
	{
		// Add boxes to box engine
		array_push(other.boxEngine.boxes, box);
	}
}
// Else end game
else levelFailed = true;