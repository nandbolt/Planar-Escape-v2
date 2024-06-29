/// @desc Spawn Player/End Game

// If level complete
if (levelComplete)
{
	// Increment menu if below max
	if (levelEndMenus < maxCompleteLevelMenu)
	{
		levelEndMenus++;
		alarm[0] = levelEndMenuDelay;
	}
}
// If level failed
else if (levelFailed)
{
	// Increment menu if below max
	if (levelEndMenus < maxFailedLevelMenu)
	{
		levelEndMenus++;
		alarm[0] = levelEndMenuDelay;
	}
}
// If a checkpoint exists
else if (instance_exists(checkpoint))
{
	// Spawn player
	with (instance_create_layer(checkpoint.x, checkpoint.y, "Instances", oPlayer))
	{
		// Add boxes to box engine
		array_push(other.boxEngine.boxes, box);
	}
}
// Else end game
else failLevel();