// Inherit the parent event
event_inherited();

// States
active = false;
pushStrength = 1000;
pullStrength = 1000;

/// @func	splitBeam({id} zapper, {enum.Power} type);
splitBeam = function(_zapper, _type)
{
	// Activate
	active = true;
	alarm[1] = 2;
	image_angle = _zapper.image_angle + 90;
	
	// Set power
	powerType = _type;
	if (powerType == Power.RED)
	{
		laserColor = c_red;
		sprLaser = sLaser;
	}
	else if (powerType == Power.GREEN)
	{
		laserColor = c_green;
		sprLaser = sZombieLaser;
	}
	else if (powerType == Power.BLUE)
	{
		laserColor = c_blue;
		sprLaser = sCopLaser;
	}
	else if (powerType == Power.YELLOW)
	{
		laserColor = c_yellow;
		sprLaser = sCitizenLaser;
	}
	else if (powerType == Power.BLACK)
	{
		laserColor = c_dkgray;
		sprLaser = sEntityLaser;
	}
}