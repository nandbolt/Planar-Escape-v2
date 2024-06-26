// Get power state of wire
var _tile = tilemap_get_at_pixel(wireMap, x, y);
if (_tile > 17)
{
	// Apply power type
	if (_tile < 36) updateRod(Power.RED);
	else if (_tile > 35) updateRod(Power.GREEN);
	
	// If has no target
	if (!instance_exists(target))
	{
		// Loop through boxes
		with (be_oBox)
		{
			// If in range
			if (point_distance(other.x, other.y, x, y) < other.targetRange)
			{
				// Set target and break
				other.target = self;
				break;
			}
		}
	}
	// Else if target is out of range
	else if (point_distance(x, y, target.x, target.y) > targetRange)
	{
		// Reset target
		target = noone;
	}
	else
	{
		// Move zap position to target
		
		// If on actor
		if (object_is_ancestor(target.object_index, oActor)) zapActor(target);
		else if (target.object_index == oPowerBlock)
		{
			// Turn on power block
			with (target)
			{
				togglePower(other.powerType);
			}
		}
	}
}
else updateRod(Power.OFF);