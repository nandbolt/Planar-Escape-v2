// Move detection box
detectionBox.x = x;
detectionBox.y = y;

// Check detection if not active
if (!activated)
{
	with (detectionBox)
	{
		if (place_meeting(x, y, oActor))
		{
			other.activated = true;
			other.alarm[0] = 60;
			other.image_index++;
		}
	}
}