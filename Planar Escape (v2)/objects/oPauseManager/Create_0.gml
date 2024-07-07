// State
canPause = false;
paused = false;
pauseQueued = false;

// Surfaces
pausedSurface = -1;
pausedSurfaceBuffer = -1;

// Resolution
resolutionWidth = surface_get_width(application_surface);
resolutionHeight = surface_get_height(application_surface);

// Unpause
goToNewRoomOnUnpause = false;
newRoom = rMainMenu;