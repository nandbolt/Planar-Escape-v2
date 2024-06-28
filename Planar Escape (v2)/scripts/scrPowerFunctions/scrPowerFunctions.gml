/// @func	wireToPower({int} wireTile);
function wireToPower(_wireTile)
{
	return floor(_wireTile / 18);
}

/// @func	findWirePowersource({id} wireMap, {real} x, {real} y, {enum.Power} type);
///	@desc	Updates the power line by turning it on or off.
function findWirePowersource(_wireMap, _x, _y, _type)
{
	// Return if no power blocks exist
	if (!instance_exists(oPowerBlock)) return noone;
	
	// Loop until all power lines are touched
	var _start = new BEVector2(floor(_x), floor(_y));
	var _frontier = [_start], _loops = 0, _visited = [_start];
	while (array_length(_frontier) > 0 && _loops < 2000)
	{
		// Increment counter
		_loops++;
		
		// Get position
		var _tp = array_pop(_frontier);
		var _tx = floor(_tp.x / TILE_SIZE), _ty = floor(_tp.y / TILE_SIZE);
		
		// Loop through power blocks
		with (oPowerBlock)
		{
			// If has the same power and on tile
			if (powerType == _type && floor(x / TILE_SIZE) == _tx && floor(y / TILE_SIZE) == _ty)
			{
				// Found power source
				_frontier = -1;
				return self;
			}
		}
		
		// Check neighbors
		for (var _i = 0; _i < 4; _i++)
		{
			// Get direction
			var _dx = 0, _dy = 0;
			if (_i == 0) _dx = TILE_SIZE;
			else if (_i == 1) _dx = -TILE_SIZE;
			else if (_i == 2) _dy = TILE_SIZE;
			else _dy = -TILE_SIZE;
			
			// Get wire tile
			_x = _tp.x + _dx;
			_y = _tp.y + _dy;
			var _tile = tilemap_get_at_pixel(_wireMap, _x, _y);
			var _tileType = wireToPower(_tile);
			
			// If power type is the same
			if (_type == _tileType)
			{
				// Check if visited
				var _hasVisited = false;
				for (var _j = 0; _j < array_length(_visited); _j++)
				{
					// Get position
					var _ntp = _visited[_j];
					if (_ntp.x == _x && _ntp.y == _y)
					{
						// Break since visited already
						_hasVisited = true;
						break;
					}
				}
					
				// If hasn't visited
				if (!_hasVisited)
				{
					// Add to frontier and visited
					var _node = new BEVector2(_x, _y);
					array_push(_frontier, _node);
					array_push(_visited, _node);
				}
			}
		}
	}
	_frontier = -1;
	
	// Found no power block
	return noone;
}

/// @func	toggleWirePowerline({id} wireMap, {real} x, {real} y, {enum.Power} type);
///	@desc	Updates the power line by turning it on or off.
function toggleWirePowerline(_wireMap, _x, _y, _type)
{
	// Return if starting point isn't on a powerline or already toggled
	var _tile = tilemap_get_at_pixel(_wireMap, _x, _y);
	var _tileType = floor(_tile / 18);
	if (_tile == 0 || _type == _tileType || (_type != Power.OFF && _tileType > Power.OFF)) return;
	
	// Toggle power of first tile
	toggleWirePower(_wireMap, _tile, _x, _y, _type);
	
	// Loop until all power lines are touched
	var _frontier = [new BEVector2(floor(_x), floor(_y))], _loops = 0;
	while (array_length(_frontier) > 0 && _loops < 2000)
	{
		// Increment counter
		_loops++;
		
		// Get position
		var _tp = array_pop(_frontier);
		
		// Check neighbors
		for (var _i = 0; _i < 4; _i++)
		{
			// Get direction
			var _dx = 0, _dy = 0;
			if (_i == 0) _dx = TILE_SIZE;
			else if (_i == 1) _dx = -TILE_SIZE;
			else if (_i == 2) _dy = TILE_SIZE;
			else _dy = -TILE_SIZE;
			
			// If tile is a wire
			_x = _tp.x + _dx;
			_y = _tp.y + _dy;
			_tile = tilemap_get_at_pixel(_wireMap, _x, _y);
			_tileType = floor(_tile / 18);
			if (_tile != 0)
			{
				// If not already toggled
				if (_type != _tileType)
				{
					// Add to frontier if not already in it
					var _inFrontier = false;
					for (var _j = 0; _j < array_length(_frontier); _j++)
					{
						// Get position
						var _ntp = _frontier[_j];
						if (_ntp.x == _x && _ntp.y == _y)
						{
							// Break since in frontier already
							_inFrontier = true;
							break;
						}
					}
					
					// If not in frontier
					if (!_inFrontier)
					{
						// Add to frontier and toggle power 
						array_push(_frontier, new BEVector2(_x, _y));
						toggleWirePower(_wireMap, _tile, _x, _y, _type);
					}
				}
			}
		}
	}
	_frontier = -1;	
}

/// @func	toggleWirePower({id} wireMap, {int} tile, {real} x, {real} y, {enum.Power} type);
///	@desc	Updates the power of one tile by turning it on or off.
function toggleWirePower(_wireMap, _tile, _x, _y, _type)
{
	// Toggle power of first tile
	if (_type != Power.OFF && _tile < 18) tilemap_set_at_pixel(_wireMap, _tile+18*_type, _x, _y);
	else if (_type == Power.OFF && _tile > 17) tilemap_set_at_pixel(_wireMap, _tile-18*floor(_tile/18), _x, _y);
}

/// @func	zap({id} zapper, {id} target, {enum.Power} type);
///	@desc	Zaps the target based on the power type and solid parameters.
function zap(_zapper, _target, _type)
{
	// If power block
	if (_target.object_index == oPowerBlock)
	{
		// Power the block
		with (_target)
		{
			togglePower(_type);
		}
		
		// Exit
		return;
	}
	else if (_target.object_index == oCrystalBlock || object_is_ancestor(_target.object_index, oCrystalBlock))
	{
		// Activate
		_target.active = true;
		_target.alarm[1] = 2;
		if (_zapper.object_index == oPowerRod)
		{
			_target.image_angle = point_direction(_zapper.x, _zapper.y, _target.x, _target.y);
		}
		else _target.image_angle = _zapper.image_angle;
		
		// Exit
		return;
	}
	
	switch (_type)
	{
		case Power.RED:
			#region Red
			
			/*
			Destroys actors.
			Shrinks ice.
			*/
			
			// If actor
			if (object_is_ancestor(_target.object_index, oActor))
			{
				// Zap particles
				emitZapParticles(_target, c_red);
				
				// Destroy actor
				destroyBox(_target, be_oBoxEngine);
			}
			// Else if ice block
			else if (isIce(_target))
			{
				// Shrink
				with (_target)
				{
					setSize(image_xscale - changeSpeed);
				}
			}
			
			#endregion
			break;
		case Power.GREEN:
			#region Green
			
			/*
			Zombifies actors.
			Grows ice.
			*/
			
			// If actor
			if (object_is_ancestor(_target.object_index, oActor))
			{
				// Return if a zombie
				if (_target.object_index == oZombie) return;
				
				// Zombify target
				if (_zapper.object_index == oPowerRod) _zapper.target = transformTarget(_target, oZombie, c_green);
				else transformTarget(_target, oZombie, c_green);
			}
			// Else if ice block
			else if (isIce(_target))
			{
				// Shrink
				with (_target)
				{
					setSize(image_xscale + changeSpeed);
				}
			}
			
			#endregion
			break;
		case Power.BLUE:
			#region Blue
			
			/*
			Copifies actors.
			Pushes blocks.
			*/
			
			// If actor
			if (object_is_ancestor(_target.object_index, oActor))
			{
				// Return if a cop
				if (_target.object_index == oCop) return;
				
				// Copify target
				if (_zapper.object_index == oPowerRod) _zapper.target = transformTarget(_target, oCop, c_blue);
				else transformTarget(_target, oCop, c_blue);
			}
			else
			{
				// Push block
				with (_zapper)
				{
					if (object_index == oPowerRod)
					{
						var _force = new BEVector2(_target.x - x, _target.y - y);
						_force.normalize();
						_force.scale(pushStrength);
						_target.box.addForceVector(_force);
					}
					else _target.box.addForce(lengthdir_x(pushStrength, image_angle), lengthdir_y(pushStrength, image_angle));
				}
			}
			
			#endregion
			break;
		case Power.YELLOW:
			#region Yellow
			
			/*
			Citifies actors.
			Pulls blocks.
			*/
			
			// If actor
			if (object_is_ancestor(_target.object_index, oActor))
			{
				// Return if a zombie
				if (_target.object_index == oCitizen || _target.object_index == oPlayer) return;
				
				// Citify target
				if (_zapper.object_index == oPowerRod) _zapper.target = transformTarget(_target, oCitizen, c_yellow);
				else transformTarget(_target, oCitizen, c_yellow);
			}
			else
			{
				// Pull block
				with (_zapper)
				{
					if (object_index == oPowerRod)
					{
						var _force = new BEVector2(x - _target.x, y - _target.y);
						_force.normalize();
						_force.scale(pullStrength);
						_target.box.addForceVector(_force);
					}
					else _target.box.addForce(-lengthdir_x(pullStrength, image_angle), -lengthdir_y(pullStrength, image_angle));
				}
			}
			
			#endregion
			break;
		case Power.BLACK:
			#region Black
			
			/*
			Destroys everything but power blocks.
			*/
			
			// Zap particles
			emitZapParticles(_target, c_dkgray);
				
			// Destroy box
			destroyBox(_target, be_oBoxEngine);
			
			#endregion
			break;
	}
}

/// @func	emitZapParticles({id} target, {color} c);
function emitZapParticles(_target, _c)
{
	// Death particles
	with (_target)
	{
		for (var _j = 0; _j <= 1; _j += 0.5)
		{
			for (var _i = 0; _i <= 1; _i += 0.5)
			{
				var _x = bbox_left + (bbox_right - bbox_left) * _i, _y = bbox_top + (bbox_bottom - bbox_top) * _j;
				with (oParticleManager)
				{
					part_particles_create_color(partSystem, _x, _y, partTypeDust, _c, 1);
				}
			}
		}
	}
}

/// @func	transformTarget({id} target, {object} newObject, {color} color);
function transformTarget(_target, _newObject, _color)
{
	// Zap particles
	emitZapParticles(_target, _color);
				
	// Create citizen
	var _actor = instance_create_layer(_target.x, _target.y, "Instances", _newObject);
	with (_actor)
	{
		// Add boxes to box engine
		array_push(be_oBoxEngine.boxes, box);
		
		// Set velocity
		box.setVelocityVector(_target.box.getVelocity());
		
		// Set facing
		image_index = _target.image_index;
		facingDirection.setVector(_target.facingDirection);
		facingAngle = _target.facingAngle;
	}
				
	// Destroy actor
	destroyBox(_target, be_oBoxEngine);
	
	// Return object
	return _actor;
}