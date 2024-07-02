// Move
y += yVelocity;

#region Update Entity Sound

// Get entity bounding box (for visible check)
var _camTop = camera_get_view_y(view_camera[0]);
var _camBottom = _camTop + camera_get_view_height(view_camera[0]);

// If visible
if (y < _camBottom && y > _camTop)
{
	// Adjust gain relative to camera center
	var _camHalfHeight = camera_get_view_height(view_camera[0]) * 0.5;
	var _camMiddle = _camTop + _camHalfHeight;
	
	// Calculate gain
	var _gain = 0;
	if (y > _camMiddle) _gain = 1 - clamp(y - _camMiddle, 0, _camHalfHeight) / _camHalfHeight;
	else  _gain = 1 - clamp(_camMiddle - y, 0, _camHalfHeight) / _camHalfHeight;
	
	// Apply gain
	audio_sound_gain(sfxEntity, _gain, 0);
}
// Else mute sound
else audio_sound_gain(sfxEntity, 0, 0);

#endregion

// Exit if no solids exists
if (!instance_exists(oSolid)) exit;

// Loop through boxes
with (oSolid)
{
	// Destroy box if box is colliding with entity
	if (other.y < bbox_top)
	{
		// Player death entity sound
		if (object_index == oPlayer) audio_play_sound(sfxPlayerDeathEntity, 20, false);
		
		// Destroy box
		destroyBox(id, be_oBoxEngine);
	}
}

// Exit if no contraptions exists
if (!instance_exists(oContraption)) exit;

// Loop through contraptions
with (oContraption)
{
	// Destroy box if box is colliding with entity
	if (other.y < bbox_top) instance_destroy();
}