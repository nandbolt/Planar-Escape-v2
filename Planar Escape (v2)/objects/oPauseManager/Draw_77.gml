// Disable alpha blending
gpu_set_blendenable(false);

// If paused
if (paused)
{
	// Draw frozen image to screen
	surface_set_target(application_surface);
	if (surface_exists(pausedSurface)) draw_surface(pausedSurface, 0, 0);
	else
	{
		// Restore buffer if we lost surface
		pausedSurface = surface_create(resolutionWidth, resolutionHeight);
		buffer_set_surface(pausedSurfaceBuffer, pausedSurface, 0);
	}
	surface_reset_target();
}

// If pause pressed and can pause
if (pauseQueued && canPause)
{
	// If not paused
	if (!paused)
	{
		// Pause
		paused = true;
		
		// Pause particles
		with (oParticleManager)
		{
			pauseParticles();
		}
		
		// Deactivate instances
		instance_deactivate_all(true);
		
		// Capture the game moment
		pausedSurface = surface_create(resolutionWidth, resolutionHeight);
		surface_set_target(pausedSurface);
		draw_surface(application_surface, 0, 0);
		surface_reset_target();
		
		// Back up the surface to a buffer
		if (buffer_exists(pausedSurfaceBuffer)) buffer_delete(pausedSurfaceBuffer);
		pausedSurfaceBuffer = buffer_create(resolutionWidth * resolutionHeight * 4, buffer_fixed, 1);
		buffer_get_surface(pausedSurfaceBuffer, pausedSurface, 0);
		
		// Create pause menu
		if (!instance_exists(oPauseMenu)) instance_create_layer(0, 0, "Instances", oPauseMenu);
	}
	else
	{
		// Destroy pause menu
		if (instance_exists(oPauseMenu)) instance_destroy(oPauseMenu);
		
		// Unpause
		paused = false;
		
		// Activate all instances
		instance_activate_all();
		
		// Clear paused surface + buffer
		if (surface_exists(pausedSurface)) surface_free(pausedSurface);
		if (buffer_exists(pausedSurfaceBuffer)) buffer_delete(pausedSurfaceBuffer);
		
		// Resume particles
		with (oParticleManager)
		{
			resumeParticles();
		}
		
		// Hide cursor
		window_set_cursor(cr_none);
		
		// If new room on unpause
		if (goToNewRoomOnUnpause)
		{
			// Reset unpause query
			goToNewRoomOnUnpause = false;
			
			// Change rooms
			room_goto(newRoom);
		}
	}
	
	// Reset pause queue
	pauseQueued = false;
}

// Enable alpha blending
gpu_set_blendenable(true);