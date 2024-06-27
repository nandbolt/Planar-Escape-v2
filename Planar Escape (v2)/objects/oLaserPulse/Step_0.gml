// Move
x += velocity.x;
y += velocity.y;

// If colliding with a block
if (place_meeting(x, y, oBlock))
{
	// Zap
	with (instance_place(x, y, oBlock))
	{
		zap(other.powerType);
	}
	
	// Destroy self
	instance_destroy();
}
// If colliding with an actor
else if (place_meeting(x, y, oActor))
{
	// Zap
	with (instance_place(x, y, oActor))
	{
		destroyBox(id, be_oBoxEngine);
		//zap(other.powerType);
	}
	
	// Destroy self
	instance_destroy();
}
// Else if colliding with a tile
else if (tilemap_get_at_pixel(collisionMap, x, y) > 0)
{
	// Destroy self
	instance_destroy();
}