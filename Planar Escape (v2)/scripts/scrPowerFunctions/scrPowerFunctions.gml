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
	else if (_target.object_index == oCrystalBlock)
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
				if (_zapper.object_index == oPowerRod) _zapper.target = zombify(_target);
				else zombify(_target);
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
				// Return if a zombie
				if (_target.object_index == oCop) return;
				
				// Zap particles
				emitZapParticles(_target, c_blue);
				
				// Create cop
				with (instance_create_layer(_target.x, _target.y, "Instances", oCop))
				{
					// Add boxes to box engine
					array_push(be_oBoxEngine.boxes, box);
		
					// Set velocity
					box.setVelocityVector(_target.box.getVelocity());
					
					// Set zapper target if zapper is a rod
					if (_zapper.object_index == oPowerRod) _zapper.target = self;
				}
				
				// Destroy actor
				destroyBox(_target, be_oBoxEngine);
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
				
				// Zap particles
				emitZapParticles(_target, c_yellow);
				
				// Create citizen
				with (instance_create_layer(_target.x, _target.y, "Instances", oCitizen))
				{
					// Add boxes to box engine
					array_push(be_oBoxEngine.boxes, box);
		
					// Set velocity
					box.setVelocityVector(_target.box.getVelocity());
					
					// Set zapper target if zapper is a rod
					if (_zapper.object_index == oPowerRod) _zapper.target = self;
				}
				
				// Destroy actor
				destroyBox(_target, be_oBoxEngine);
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

/// @func	zombify({id} target);
function zombify(_target)
{
	// Zap particles
	emitZapParticles(_target, c_green);
				
	// Create zombie
	var _zombie = instance_create_layer(_target.x, _target.y, "Instances", oZombie);
	with (_zombie)
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
	
	// Return zombie
	return _zombie;
}