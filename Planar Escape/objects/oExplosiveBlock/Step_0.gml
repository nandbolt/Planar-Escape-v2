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
			with (other)
			{
				activate();
			}
		}
	}
}