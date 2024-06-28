// Inherit the parent event
event_inherited();

// States
mentalState = 0;

// Target
target = noone;

// Thinking
prevTilePosition = new BEVector2(floor(x / TILE_SIZE) * TILE_SIZE, floor(y / TILE_SIZE) * TILE_SIZE);
thinkFreq = 120;

// Alert
alertY = 0;

#region Functions

/// @func	updateRotation();
updateRotation = function()
{
	// Rotate if on the same tile as before
	var _tx = floor(x / TILE_SIZE) * TILE_SIZE, _ty = floor(y / TILE_SIZE) * TILE_SIZE;
	if (_tx == prevTilePosition.x && _ty == prevTilePosition.y)
	{
		var _idx = (image_index + 2) mod image_number;
		if (_idx mod 2 == 1) _idx++;	// If odd, add one to make even
		setFacing(_idx);
		onRotate();
	}
		
	// Set tile
	prevTilePosition.x = floor(x / TILE_SIZE) * TILE_SIZE;
	prevTilePosition.y = floor(y / TILE_SIZE) * TILE_SIZE;
}

/// @func	onRotate();
onRotate = function(){}

#endregion

// Set think alarm
alarm[0] = thinkFreq;