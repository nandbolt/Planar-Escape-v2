/// @func	Blaster({enum.Power} powerType);
function Blaster(_powerType) : Gadget() constructor
{
	type = GadgetType.BLASTER;
	
	powerType = _powerType;
	laserPulse = oLaserPulse;
	launchSpeed = 5;
	
	/// @func	setPower({enum.Power} type);
	static setPower = function(_type)
	{
		// Set power
		powerType = _type;
		
		// Set pulse
		if (powerType == Power.GREEN) laserPulse = oZombieLaserPulse;
		else if (powerType == Power.BLUE) laserPulse = oCopLaserPulse;
		else if (powerType == Power.YELLOW) laserPulse = oCitizenLaserPulse;
		else if (powerType == Power.BLACK) laserPulse = oEntityLaserPulse;
		else laserPulse = oLaserPulse;
	}
	
	/// @func	update();
	static update = function()
	{
		updateActions();
	}
	
	/// @func	usePressed();
	static usePressed = function()
	{
		// Get launch direction
		var _facingDir = undefined;
		with (owner)
		{
			_facingDir = getFacingVector();
		}
			
		// Init hand
		with (instance_create_layer(owner.x + _facingDir.x * 8, owner.y + _facingDir.y * 8, "Instances", laserPulse))
		{
			// Launch
			velocity.x = _facingDir.x;
			velocity.y = _facingDir.y;
			image_angle = point_direction(0, 0, _facingDir.x, _facingDir.y);
			velocity.normalize();
			velocity.scale(other.launchSpeed);
		}
	}
	
	// Set power
	setPower(powerType);
}