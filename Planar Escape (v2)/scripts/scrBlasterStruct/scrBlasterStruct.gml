/// @func	Blaster({enum.Power} powerType);
function Blaster(_powerType) : Gadget() constructor
{
	type = GadgetType.BLASTER;
	
	powerType = _powerType;
	laserPulse = oLaserPulse;
	blasterIdx = 0;
	launchSpeed = 4;
	blasterPosition = new BEVector2();
	cooldown = 0;
	maxCooldown = 30;
	
	/// @func	setPower({enum.Power} type);
	static setPower = function(_type)
	{
		// Set power
		powerType = _type;
		blasterIdx = _type-1;
		
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
		
		// Update position
		blasterPosition.x = owner.x + lengthdir_x(8, owner.facingAngle-30);
		blasterPosition.y = owner.y + lengthdir_y(8, owner.facingAngle-30);
		
		// Cooldown
		if (cooldown > 0) cooldown--;
	}
	
	/// @func	use();
	static use = function()
	{
		// Fire if no cooldown
		if (cooldown <= 0) fire();
	}
	
	/// @func	fire();
	static fire = function()
	{
		// Get launch direction
		var _facingDir = owner.facingDirection;
			
		// Init hand
		with (instance_create_layer(blasterPosition.x, blasterPosition.y, "Instances", laserPulse))
		{
			// Launch
			velocity.x = _facingDir.x;
			velocity.y = _facingDir.y;
			image_angle = point_direction(0, 0, _facingDir.x, _facingDir.y);
			velocity.normalize();
			velocity.scale(other.launchSpeed);
		}
		
		// Set cooldown
		cooldown = maxCooldown;
	}
	
	/// @func	draw();
	static draw = function()
	{
		draw_sprite_ext(sBlaster, blasterIdx, blasterPosition.x, blasterPosition.y, 1, 1, owner.facingAngle, c_white, 1);
	}
	
	// Set power
	setPower(powerType);
}