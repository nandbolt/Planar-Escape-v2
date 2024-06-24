// Inherit the parent event
event_inherited();

// State
powered = false;

// Power
offDelay = 10;

#region Functions

/// @func	turnOn();
turnOn = function()
{
	powered = true;
	alarm[0] = offDelay;
	image_index = 1;
}

#endregion