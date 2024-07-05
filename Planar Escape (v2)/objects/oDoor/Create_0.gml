// Inherit the parent event
event_inherited();

// Power
doorType = -1;

// Tiles
collisionMap = layer_tilemap_get_id("CollisionTiles");

#region Functions

/// @func	open();
open = function()
{
	image_index = 1;
	tilemap_set_at_pixel(collisionMap, 0, x, y);
}

/// @func	close();
close = function()
{
	image_index = 0;
	tilemap_set_at_pixel(collisionMap, 1, x, y);
}

///	@func	updatePower({enum.Power} type);
updatePower = function(_type)
{
	// If powers match or is a white door + any power
	if (_type == doorType || (sprite_index == sDoor && _type > 0)) open();
	else close();
	
	// Door sound
	if (isVisible(id) && !audio_is_playing(sfxDoor)) audio_play_sound(sfxDoor, 10, false);
}

#endregion

// Set tile
tilemap_set_at_pixel(collisionMap, 1, x, y);