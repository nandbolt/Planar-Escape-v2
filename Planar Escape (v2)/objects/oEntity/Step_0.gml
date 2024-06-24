// Move
y += yVelocity;

// Exit if no box exists
if (!instance_exists(be_oBox)) exit;

// Loop through boxes
with (be_oBox)
{
	// Destroy box if box is colliding with entity
	if (other.y < bbox_top) destroyBox(id, be_oBoxEngine);
}