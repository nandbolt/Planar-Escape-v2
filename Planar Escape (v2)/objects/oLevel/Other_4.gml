// Add boxes to box engine
with (be_oBox)
{
	array_push(other.boxEngine.boxes, box);
}

// Init start time + stars
totalStars = instance_number(oStar);

// Entity meter
if (instance_exists(oSpawnPortal)) playerY = oSpawnPortal.y;