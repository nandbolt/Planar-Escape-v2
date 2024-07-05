// Get camera position
var _camX = camera_get_view_x(view_camera[0]), _camY = camera_get_view_y(view_camera[0]);

// If target exists
if (instance_exists(target))
{
	// Set target to player
	targetPosition.x = clamp(target.x - halfCamWidth, 6, room_width - camWidth - 6);
	
	// Padded box
	if (target.y < _camY + halfCamHeight)
	{
		targetPosition.y = clamp(target.y - halfCamHeight, 0, room_height - camHeight);
	}
	else if (target.y > _camY + camHeight * 0.75)
	{
		targetPosition.y = clamp(target.y - camHeight * 0.75, 0, room_height - camHeight);
	}
}

// Follow target
var _newCamX = lerp(_camX, targetPosition.x, followAcceleration);
var _newCamY = lerp(_camY, targetPosition.y, followAcceleration);
camera_set_view_pos(view_camera[0], _newCamX, _newCamY);