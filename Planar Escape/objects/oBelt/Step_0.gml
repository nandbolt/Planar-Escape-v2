// Set velocity
if (beltDirection != 0 && place_meeting(x, y, oSolid))
{
	// Get list of boxes
	var _boxes = ds_list_create();
	var _boxCount = instance_place_list(x, y, oSolid, _boxes, false);
	for (var _i = 0; _i < _boxCount; _i++)
	{
		// Get box
		var _box = _boxes[| _i];
		_box.box.velocity.x += lengthdir_x(beltStrength, image_angle) * sign(beltDirection);
		_box.box.velocity.y += lengthdir_y(beltStrength, image_angle) * sign(beltDirection);
	}
	ds_list_destroy(_boxes);
}