// Inherit the parent event
event_inherited();

/// @func	teleport({id} solid);
teleport = function(_solid)
{
	// Complete level if player
	if (_solid.object_index == oPlayer)
	{
		with (oLevel)
		{
			if (!levelComplete) completeLevel();
		}
		
		// Teleport sound
		audio_play_sound(sfxPortalEnter, 100, false);
	}
	
	// Destroy box
	destroyBox(_solid, be_oBoxEngine);
}