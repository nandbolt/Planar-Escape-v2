// Power
powerType = Power.OFF;
particleFreq = 20;

// Layer
wireMap = layer_tilemap_get_id("WireTiles");

// Target
target = noone;
targetRange = 60;

// Zap
zapColor = c_red;
sprZap = sLaser;
pushStrength = 1000;
pullStrength = 1000;

#region Functions

/// @func	updateRod({enum.Power} type);
updateRod = function(_type)
{
	// Set power type
	powerType = _type;
	image_index = _type;
	if (_type == Power.RED)
	{
		zapColor = c_red;
		sprZap = sLaser;
	}
	else if (_type == Power.GREEN)
	{
		zapColor = c_green;
		sprZap = sZombieLaser;
	}
	else if (_type == Power.BLUE)
	{
		zapColor = c_blue;
		sprZap = sCopLaser;
	}
	else if (_type == Power.YELLOW)
	{
		zapColor = c_yellow;
		sprZap = sCitizenLaser;
	}
	else if (_type == Power.BLACK)
	{
		zapColor = c_dkgray;
		sprZap = sEntityLaser;
	}
	else target = noone;
}

#endregion

// Particle alarm
alarm[0] = particleFreq;