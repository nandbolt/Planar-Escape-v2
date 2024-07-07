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
if (keyboard_check_pressed(vk_escape) && canPause)
{
	// If not paused
	if (!paused)
	{
		// Pause
		paused = true;
		
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
	}
	else
	{
		// Unpause
		paused = false;
		instance_activate_all();
		if (surface_exists(pausedSurface)) surface_free(pausedSurface);
		if (buffer_exists(pausedSurfaceBuffer)) buffer_delete(pausedSurfaceBuffer);
	}
}

// Enable alpha blending
gpu_set_blendenable(true);