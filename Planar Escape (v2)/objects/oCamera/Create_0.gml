// Dimensions
camWidth = oDisplayManager.baseCamWidth;
camHeight = oDisplayManager.baseCamHeight;
halfCamWidth = camWidth * 0.5;
halfCamHeight = camHeight * 0.5;

// Follow
target = oPlayer;
if (global.editingLevel) target = oLevelEditor;
targetPosition = new BEVector2();
followAcceleration = 0.25;

// Init camera
view_enabled = true;
view_visible[0] = true;
camera_set_view_size(view_camera[0], camWidth, camHeight);
if (instance_exists(target))
{
	targetPosition.x = clamp(target.x - halfCamWidth, 0, room_width - camWidth);
	targetPosition.y = clamp(target.y - halfCamHeight, 0, room_height - camHeight);
}
else
{
	targetPosition.x = room_width * 0.5 - halfCamWidth;
	targetPosition.y = room_height - camHeight;
}
camera_set_view_pos(view_camera[0], targetPosition.x, targetPosition.y);