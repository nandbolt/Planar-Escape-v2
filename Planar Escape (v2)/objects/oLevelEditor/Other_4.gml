// Loop through level parent objects
for (var _i = 0; _i < array_length(levelParentObjects); _i++)
{
	// Get object
	var _obj = levelParentObjects[_i];
	
	// Create sprite if the object exists
	if (instance_exists(_obj))
	{
		// Loop through objects
		with (_obj)
		{
			// Get grid position
			var _gridX = floor(x / TILE_SIZE) - 1, _gridY = floor(y / TILE_SIZE) - 1;
			var _gridIdx = other.gridWidth * _gridY + _gridX;
			other.levelGrid[_gridIdx] = getLevelObjectIdx(object_index);
			
			// Create sprite
			with (instance_create_layer(x, y, "Instances", oSprite))
			{
				sprite_index = other.sprite_index;
			}
		}
		
		// Destroy instances
		instance_destroy(_obj);
	}
}