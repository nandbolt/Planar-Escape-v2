// Inherit the parent event
event_inherited();

// States
beltDirection = 0;
//beltStrength = 0.175;
beltStrength = 0.35;
//beltStrength = 5;

#region Functions

///	@func	updatePower({enum.Power} type);
updatePower = function(_type)
{
	// Set belt direction
	if (_type == Power.OFF) beltDirection = 0;
	else if ((_type mod 2) == 1) beltDirection = 1;
	else beltDirection = -1;
	
	// Update sprite
	if (beltDirection == 0) image_speed = 0;
	else
	{
		image_speed = 1;
		if (beltDirection == 1) sprite_index = sBeltForward;
		else sprite_index = sBeltBackward;
	}
}

#endregion

// Init belt
image_speed = 0;