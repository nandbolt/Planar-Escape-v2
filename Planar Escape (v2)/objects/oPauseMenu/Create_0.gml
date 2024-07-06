// Inherit the parent event
event_inherited();

/// @func	unpause();
unpause = function()
{
	// Activate all
	instance_activate_all();
	
	// Destroy menu
	instance_destroy();
}

// Pause game
instance_deactivate_all(true);