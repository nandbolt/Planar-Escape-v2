// Add boxes to box engine
with (be_oBox)
{
	array_push(other.boxEngine.boxes, box);
}

// Init start time + stars
startTime = current_time;
totalStars = instance_number(oStar);

// Start fade