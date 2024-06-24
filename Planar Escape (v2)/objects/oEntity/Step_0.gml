// Move
y += yVelocity;

// Exit if no box exists
if (!instance_exists(be_oBox)) exit;

// Loop through boxes
with (be_oBox)
{
	// If box is colliding with entity
	if (other.y < bbox_top)
	{
		// Remove from the engine
		with (be_oBoxEngine)
		{
			removeBox(other.box);
		}
		
		// If visible
		//if (isVisible(id))
		//{
		//	// Emit dust particles
		//	for (var _j = 0; _j <= 1; _j += 0.5)
		//	{
		//		for (var _i = 0; _i <= 1; _i += 0.5)
		//		{
		//			var _x = bbox_left + (bbox_right - bbox_left) * _i, _y = bbox_top + (bbox_bottom - bbox_top) * _j;
		//			with (oParticleManager)
		//			{
		//				part_particles_create(partSystem, _x, _y, partTypeDust, 1);
		//			}
		//		}
		//	}
		//}
		
		// Destroy box
		instance_destroy();
	}
}