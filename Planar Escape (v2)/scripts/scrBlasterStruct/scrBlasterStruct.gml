/// @func	Blaster();
function Blaster() : Gadget() constructor
{
	type = GadgetType.BLASTER;
	
	launchSpeed = 5;
	
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
		with (instance_create_layer(owner.x + _facingDir.x * 8, owner.y + _facingDir.y * 8, "Instances", oLaserPulse))
		{
			// Launch
			velocity.x = _facingDir.x;
			velocity.y = _facingDir.y;
			image_angle = point_direction(0, 0, _facingDir.x, _facingDir.y);
			velocity.normalize();
			velocity.scale(other.launchSpeed);
		}
	}
}