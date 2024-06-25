// Check power
var _tile = tilemap_get_at_pixel(wireMap, x, y);
if (_tile > 17 && _tile < 36) updateBelt(1);
else if (_tile > 35) updateBelt(-1);
else updateBelt(0);

// Set velocity
if (beltDirection != 0 && place_meeting(x, y, be_oBox))
{
	// Get list of boxes
	var _boxes = ds_list_create();
	var _boxCount = instance_place_list(x, y, be_oBox, _boxes, false);
	for (var _i = 0; _i < _boxCount; _i++)
	{
		// Get box
		var _box = _boxes[| _i];
		_box.box.velocity.x += lengthdir_x(beltStrength, image_angle) * sign(beltDirection);
		_box.box.velocity.y += lengthdir_y(beltStrength, image_angle) * sign(beltDirection);
	}
	ds_list_destroy(_boxes);
}