// If grabbing
if (!grabbing)
{
	// Deaccelerate
	velocity.x *= damping;
	velocity.y *= damping;

	// Move
	x += velocity.x;
	y += velocity.y;
	
	// If colliding with a box
	if (place_meeting(x, y, be_oBox))
	{
		// If grabbable
		var _inst = instance_place(x, y, be_oBox);
		if (_inst.id != gadget.owner.id)
		{
			// Grab box
			grabInst = _inst;
			grabbing = true;
		}
	}
	// Else if colliding with a tile
	else if (tilemap_get_at_pixel(collisionMap, x, y) > 0)
	{
		// Grab tile
		x = floor(x / TILE_SIZE) * TILE_SIZE + HALF_TILE_SIZE;
		y = floor(y / TILE_SIZE) * TILE_SIZE + HALF_TILE_SIZE;
		grabbing = true;
	}
}
else
{
	// Move to grab instance if it exists
	if (instance_exists(grabInst))
	{
		x = grabInst.x;
		y = grabInst.y;
	}
	
	// Pull owner
	var _dist = point_distance(gadget.owner.x, gadget.owner.y, x, y);
	if (_dist > gadget.restLength)
	{
		// Calculate pull force
		var _pullForce = new BEVector2(x - gadget.owner.x, y - gadget.owner.y);
		_pullForce.normalize();
		_pullForce.scale((_dist - gadget.restLength) * gadget.grabPullStrength);
		
		// Add pull force to owner
		gadget.owner.box.addForceVector(_pullForce);
		
		// Add pull force to grabbed instance
		if (instance_exists(grabInst))
		{
			_pullForce.scale(-1);
			grabInst.box.addForceVector(_pullForce);
		}
	}
}