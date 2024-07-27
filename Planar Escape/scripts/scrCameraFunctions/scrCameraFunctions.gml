/// @func	isVisible({id} inst);
/// @desc	Returns whether the given object is in view of the camera.
function isVisible(_inst)
{
	// Get camera y
	var _camY = camera_get_view_y(view_camera[0]);
			
	// Check visibility
	if (_inst.y > _camY && _inst.y < _camY + camera_get_view_height(view_camera[0])) return true;
	
	// Not in view
	return false;
}