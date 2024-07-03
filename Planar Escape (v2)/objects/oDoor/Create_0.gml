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
	tilemap_set_at_pixel(collisionMap, 0, x, y);
}

#endregion

// Set tile
tilemap_set_at_pixel(collisionMap, 1, x, y);