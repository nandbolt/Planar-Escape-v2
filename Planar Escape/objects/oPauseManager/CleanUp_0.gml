// Surface + buffer
if (surface_exists(pausedSurface)) surface_free(pausedSurface);
if (buffer_exists(pausedSurfaceBuffer)) buffer_delete(pausedSurfaceBuffer);