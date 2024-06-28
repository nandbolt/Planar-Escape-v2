// State
active = false;

/// @func	activate();
activate = function()
{
	// Activate
	active = true;
	sprite_index = sCheckPointActive;
	
	// Level scope
	with (oLevel)
	{
		// If a checkpoint already exists
		if (instance_exists(checkpoint))
		{
			// Deactivate checkpoint
			with (checkpoint)
			{
				deactivate();
			}
		}
		
		// Set new checkpoint
		checkpoint = other;
	}
}

/// @func	deactivate();
deactivate = function()
{
	active = false;
	sprite_index = sCheckPointInactive;
}