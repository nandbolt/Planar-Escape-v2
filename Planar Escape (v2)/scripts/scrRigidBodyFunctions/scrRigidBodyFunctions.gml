/// @func	rbInit();
/// @desc	Inits the rigid body's variables.
function rbInit()
{
	// Dimensions
	bboxWidth = bbox_right - bbox_left;
	bboxHeight = bbox_bottom - bbox_top;
	imageAngle = 0;
	
	// States
	onGround = true;
	
	// Movement
	velocity = new Vector2();
	
	// Collisions
	collisionMap = layer_tilemap_get_id("CollisionTiles");
	collisionThreshold = 0.1;
	collisionVelocity = new Vector2();
	onCollision = function(){};
	
	// Resistances
	airResistance = new Vector2();
	airConstant = 0.002;
	groundResistance = new Vector2();
	groundConstant = 0.1;
	
	// Bounce
	bounciness = 0;
}

/// @func	rbCleanup();
/// @desc	Cleans up data structures.
function rbCleanup()
{
	// Vectors
	delete velocity;
	delete collisionVelocity;
	delete airResistance;
	delete groundResistance;
}

/// @func	rbUpdate();
///	@desc	Updates the velocity and position of the rigid body based on external conditions.
function rbUpdate()
{
	// Bounce
	rbHandleBounce();
	
	// Resistances
	rbHandleResistances();
	
	// X Tiles
	rbHandleXTileCollisions();
	
	// Move x
	x += velocity.x;
	
	// Y Tiles
	rbHandleYTileCollisions();
	
	// Move
	y += velocity.y;
	
	// Call on collision if collision
	if (!collisionVelocity.isZero()) onCollision();
}

/// @func	rbDraw();
/// @desc	Draws the rigid body's important physics information.
function rbDraw()
{
	// Collision box
	draw_sprite_pos(sPixel, 0, bbox_left, bbox_top, bbox_right, bbox_top, bbox_right, bbox_bottom, bbox_left, bbox_bottom, 0.25);
}

/// @func	rbHandleXTileCollisions();
/// @desc	Handles any tile collisions on the x-axis.
function rbHandleXTileCollisions()
{
	// Choose bounding box
	var _bboxSide = bbox_left;
	if (velocity.x > 0) _bboxSide = bbox_right;
	for (var _i = 0; _i < 2; _i++)
	{
		// Check for tile collision
		var _y = bbox_top + _i * bboxHeight;
		var _tile = tilemap_get_at_pixel(collisionMap, _bboxSide + velocity.x, _y);
		if (_tile == 1)
		{
			// Store collision
			collisionVelocity.x = velocity.x;
			
			// Loop until close enough to tile
			while (abs(velocity.x) > collisionThreshold)
			{
				// Halve velocity
				velocity.x *= 0.5;
				
				// Move if no collision
				_tile = tilemap_get_at_pixel(collisionMap, _bboxSide + velocity.x, _y);
				if (_tile != 1)
				{
					_bboxSide += velocity.x;
					x += velocity.x;
				}
			}
			
			// Collision
			velocity.x = 0;
			break;
		}
	}
}

/// @func	rbHandleYTileCollisions();
/// @desc	Handles any tile collisions on the y-axis.
function rbHandleYTileCollisions()
{
	// Choose bounding box
	var _bboxSide = bbox_top;
	if (velocity.y > 0) _bboxSide = bbox_bottom;
	for (var _i = 0; _i < 2; _i++)
	{
		// Check for tile collision
		var _x = bbox_left + _i * bboxWidth;
		var _tile = tilemap_get_at_pixel(collisionMap, _x, _bboxSide + velocity.y);
		if (_tile == 1)
		{
			// Store collision
			collisionVelocity.y = velocity.y;
			
			// Loop until close enough to tile
			while (abs(velocity.y) > collisionThreshold)
			{
				// Halve velocity
				velocity.y *= 0.5;
				
				// Move if no collision
				_tile = tilemap_get_at_pixel(collisionMap, _x, _bboxSide + velocity.y);
				if (_tile != 1)
				{
					_bboxSide += velocity.y;
					y += velocity.y;
				}
			}
			
			// Collision
			velocity.y = 0;
			break;
		}
	}
}

/// @func	rbHandleBounce();
/// @desc	Handles bouncing.
function rbHandleBounce()
{
	// If bouncy
	if (bounciness != 0)
	{
		// Bounce if collision
		if (collisionVelocity.x != 0)
		{
			velocity.x -= collisionVelocity.x * bounciness;
			collisionVelocity.x = 0;
		}
		if (collisionVelocity.y != 0)
		{
			velocity.y -= collisionVelocity.y * bounciness;
			collisionVelocity.y = 0;
		}
	}
}

/// @func	rbHandleResistances();
/// @desc	Handles air and ground resistances.
function rbHandleResistances()
{
	// If moving
	var _speed = velocity.getLength();
	if (_speed > 0)
	{
		// Apply air resistance
		airResistance.setLengthVector(velocity, -1 * airConstant * _speed * _speed);
		velocity.addResistanceVector(airResistance);
		
		// If on ground
		if (onGround)
		{
			// Apply ground resistance
			groundResistance.setLengthVector(velocity, -1 * groundConstant);
			velocity.addResistanceVector(groundResistance);		
		}
	}
}