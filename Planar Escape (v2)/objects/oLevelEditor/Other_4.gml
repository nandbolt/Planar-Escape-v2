// Loop through level parent objects
for (var _i = 0; _i < array_length(levelParentObjects); _i++)
{
	// Get object
	var _obj = levelParentObjects[_i];
	
	// Create sprite if the object exists
	if (instance_exists(_obj))
	{
		with (_obj)
		{
			with (instance_create_layer(x, y, "Instances", oSprite))
			{
				sprite_index = other.sprite_index;
			}
		}
		
		// Destroy instances
		instance_destroy(_obj);
	}
}