// Inherit the parent event
event_inherited();

// Movement
moveSpeed = 5000;

// Gadgets
gadget = new Blaster(Power.RED);
with (gadget)
{
	actionUse = function()
	{
		if (instance_exists(oPlayer))
		{
			// Check attack
			var _dx = oPlayer.x - other.x, _dy = oPlayer.y - other.y;
			if (point_distance(0, 0, _dx, _dy) < 128) return true;
		}
		return false;
	}
}