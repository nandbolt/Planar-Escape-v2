// Move
y += yVelocity;

// Exit if no solids exists
if (!instance_exists(oSolid)) exit;

// Loop through boxes
with (oSolid)
{
	// Destroy box if box is colliding with entity
	if (other.y < bbox_top) destroyBox(id, be_oBoxEngine);
}

// Exit if no contraptions exists
if (!instance_exists(oContraption)) exit;

// Loop through contraptions
with (oContraption)
{
	// Destroy box if box is colliding with entity
	if (other.y < bbox_top) instance_destroy();
}