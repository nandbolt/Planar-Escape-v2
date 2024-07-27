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
			var _gridValue = getLevelObjectIdx(object_index);
			other.levelGrid[_gridIdx] = _gridValue;
			if (_gridValue == LevelObject.BIG_WHITE_BLOCK || _gridValue == LevelObject.BIG_ICE_BLOCK || _gridValue == LevelObject.STAR_DISK)
			{
				other.levelGrid[_gridIdx-1] = _gridValue;
				other.levelGrid[_gridIdx-other.gridWidth] = _gridValue;
				other.levelGrid[_gridIdx-other.gridWidth-1] = _gridValue;
			}
			var _rotation = other.rotationGrid[_gridIdx];
			
			// Create sprite
			with (instance_create_layer(x, y, "Instances", oSprite))
			{
				sprite_index = other.sprite_index;
				image_angle = _rotation;
				if (_gridValue == LevelObject.BIG_WHITE_BLOCK || _gridValue == LevelObject.BIG_ICE_BLOCK)
				{
					image_xscale = 2;
					image_yscale = 2;
				}
			}
		}
		
		// Destroy instances
		instance_destroy(_obj);
	}
}