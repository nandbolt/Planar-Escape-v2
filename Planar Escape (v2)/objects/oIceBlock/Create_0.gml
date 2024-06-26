// Inherit the parent event
event_inherited();

// Low Friction
box.setDamping(0.995);

// Size
maxScale = 2;
minScale = 0.5;
changeSpeed = 0.005;
baseMass = box.getMass();

#region Functions

/// @func	zap({enum.Power} type);
zap = function(_type)
{
	// Set zap velocity
	var _zapVel = changeSpeed;
	if (_type == Power.GREEN) _zapVel *= -1;
	
	// Change ice
	setSize(image_xscale - _zapVel);
}

/// @func	setSize({real} imageScale);
setSize = function(_imageScale)
{
	// Clamp size
	_imageScale = clamp(_imageScale, 0, maxScale);
	
	// Set size
	image_xscale = _imageScale;
	image_yscale = _imageScale;
	
	// Set mass
	box.setMass(baseMass * _imageScale * _imageScale);
	
	// Destroy ice if too small
	if (_imageScale < minScale)
	{
		with (oParticleManager)
		{
			part_particles_create_color(partSystem, other.x, other.y, partTypeDust, c_aqua, 3);
		}
		destroyBox(self.id, be_oBoxEngine);
	}
}

#endregion

// Start alarms
alarm[0] = 20;