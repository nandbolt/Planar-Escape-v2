// Inherit the parent event
event_inherited();

// Movement
moveSpeed = 5000;

// View
viewAngle = 0;
viewAngleSpeed = 0.1;

// Think
thinkFreq = 60;

// Gadgets
gadget = new Blaster(Power.RED);
with (gadget)
{
	actionUse = function()
	{
		if (other.mentalState == CopState.CHASE && instance_exists(other.target)) return true
		return false;
	}
}

// Set think alarm
alarm[0] = thinkFreq;