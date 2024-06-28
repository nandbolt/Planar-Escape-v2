/// @func	Sightline({array} targets, {real} maxViewDist, {real} viewAngleOffset);
function Sightline(_targets, _maxViewDist, _viewAngleOffset) constructor
{
	owner = other
	targets = _targets;

	// View
	viewDistance = 0;
	maxViewDistance = _maxViewDist;
	currentMaxViewDistance = 0;
	viewStart = new BEVector2(owner.x, owner.y);
	viewDashImgIdx = 0;
	viewDashImgSpd = 4/60;
	viewDashImgNum = 2;
	viewAngleOffset = _viewAngleOffset;
	viewAdjustSpeed = 0.02;
	viewResolution = 6;

	// Tiles
	collisionMap = layer_tilemap_get_id("CollisionTiles");
	
	/// @func	update();
	static update = function()
	{
		// Update view counter
		viewDashImgIdx += viewDashImgSpd;
		if (viewDashImgIdx > viewDashImgNum) viewDashImgIdx = 0;
		
		// Update view
		if (viewDistance < maxViewDistance) currentMaxViewDistance = lerp(currentMaxViewDistance, maxViewDistance, viewAdjustSpeed);
		var _dir = owner.facingAngle + viewAngleOffset;
		viewStart.x = owner.x + lengthdir_x(viewResolution, _dir);
		viewStart.y = owner.y + lengthdir_y(viewResolution, _dir);
		var _x = viewStart.x, _y = viewStart.y;
		for (viewDistance = viewResolution; viewDistance <= currentMaxViewDistance; viewDistance += viewResolution)
		{
			// Check view tile collision
			_x = viewStart.x + lengthdir_x(viewDistance, _dir);
			_y = viewStart.y + lengthdir_y(viewDistance, _dir);
			if (tilemap_get_at_pixel(collisionMap, _x, _y) == 1)
			{
				// Set current max view distance and break
				currentMaxViewDistance = viewDistance;
				break;
			}
			else
			{
				// Check view block collision
				var _inst = collision_point(_x, _y, oSolid, false, true);
				if (_inst != noone && _inst.object_index != oGlassBlock)
				{
					// Loop through targets
					for (var _i = 0; _i < array_length(targets); _i++)
					{
						// If found a valid target
						if (_inst.object_index == targets[_i]) foundTarget(_inst);
					}
					
					// Set current max view distance and break
					currentMaxViewDistance = viewDistance;
					break;
				}
			}
		}
	}
	
	/// @func	draw();
	static draw = function()
	{
		draw_sprite_ext(sSightline, viewDashImgIdx, owner.x, owner.y, viewDistance * 0.125, 1, owner.facingAngle + viewAngleOffset, c_white, 0.5);
	}
	
	/// @func	foundTarget({id} target);
	static foundTarget = function(_target)
	{
		// Switch to alert state
		with (owner)
		{
			target = _target;
			mentalState = ZombieState.ALERTED;
			alertY = y;
			alarm[0] = 30;
		}
	}
}