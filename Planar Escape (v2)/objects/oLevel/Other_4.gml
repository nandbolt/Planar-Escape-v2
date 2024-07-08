// Add boxes to box engine
with (be_oBox)
{
	array_push(other.boxEngine.boxes, box);
}

// If escape mode
if (mode == Mode.ESCAPE)
{
	// Init start time + stars
	totalStars = instance_number(oStar);
}
else if (mode == Mode.TRACE)
{
	// Destroy all stars
	instance_destroy(oStar);
}

// Entity meter
if (instance_exists(oSpawnPortal)) playerY = oSpawnPortal.y;