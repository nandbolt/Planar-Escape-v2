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
	totalStardisks = instance_number(oStarDisk);
}
else if (mode == Mode.MARK || mode == Mode.TRACE)
{
	// Destroy all stars
	instance_destroy(oStar);
	instance_destroy(oStarDisk);
}

// Entity meter
if (instance_exists(oSpawnPortal)) playerY = oSpawnPortal.y;