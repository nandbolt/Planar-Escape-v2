/// @func	Grapple();
function Grapple() : Gadget() constructor
{
	type = GadgetType.GRAPPLE;
	
	hand = noone;
	restLength = 32;
	pullStrength = 0.01;
	grabPullStrength = 1000;
	launchSpeed = 5;
	
	/// @func	update();
	static update = function()
	{
		updateActions();
		
		// If the hand exists
		if (instance_exists(hand))
		{
			// Pull in grapple if too far
			var _dist = point_distance(owner.x, owner.y, hand.x, hand.y);
			if (_dist > restLength)
			{
				var _pullForce = new BEVector2(hand.x - owner.x, hand.y - owner.y);
				_pullForce.normalize();
				_pullForce.scale((_dist - restLength) * -pullStrength);
				hand.velocity.addVector(_pullForce);
			}
		}
	}
	
	/// @func	draw();
	static draw = function()
	{
		if (instance_exists(hand))
		{
			//draw_line(owner.x, owner.y, hand.x, hand.y);
			var _dist = point_distance(owner.x, owner.y, hand.x, hand.y), _dir = point_direction(owner.x, owner.y, hand.x, hand.y);
			draw_sprite_ext(sGrappleArm, 0, owner.x, owner.y, _dist, 1, _dir, c_white, 1);
			draw_sprite(sGrappleHand, 0, hand.x, hand.y);
		}
	}
	
	/// @func	usePressed();
	static usePressed = function()
	{
		if (hand == noone || !instance_exists(hand))
		{
			// Get launch direction
			var _facingDir = undefined;
			with (owner)
			{
				_facingDir = getFacingVector();
			}
			
			// Init hand
			hand = instance_create_layer(owner.x, owner.y, "Instances", oGrappleHand);
			with (hand)
			{
				// Gadget
				gadget = other;
				
				// Launch
				velocity.x = _facingDir.x;
				velocity.y = _facingDir.y;
				velocity.normalize();
				velocity.scale(other.launchSpeed);
			}
		}
		else instance_destroy(hand);
	}
	
	/// @func	cleanup();
	static cleanup = function()
	{
		if (instance_exists(hand)) instance_destroy(hand);
	}
}