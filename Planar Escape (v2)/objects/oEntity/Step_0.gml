// Move
y += yVelocity;

// Exit if no box exists
if (!instance_exists(be_oBox)) exit;

// Loop through boxes
with (be_oBox)
{
	// If box is colliding with entity
	if (other.y < bbox_top)
	{
		// Remove from the engine
		with (be_oBoxEngine)
		{
			removeBox(other.box);
		}
		
		// End game if player
		if (object_index == oPlayer) oLevel.levelFailed = true;
		
		// Destroy box
		instance_destroy();
	}
}