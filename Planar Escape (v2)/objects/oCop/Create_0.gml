// Inherit the parent event
event_inherited();

// Movement
moveSpeed = 5000;

// Think
thinkFreq = 60;
targets = [oPlayer, oZombie, oCitizen];

// View
scanPhase = 0;
scanSpeed = 0.05;
sight1 = new Sightline(targets, 72, 45);
sight2 = new Sightline(targets, 72, -45);

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