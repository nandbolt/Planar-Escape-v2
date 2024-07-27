// States
powerType = Power.OFF;
selfPowered = false;

// Power
powerCheckFreq = 10;

// Layers
wireMap = layer_tilemap_get_id("WireTiles");

#region Functions

///	@func	updatePower({enum.Power} type);
updatePower = function(_type){}

#endregion

// Start alarms
alarm[11] = 1;

// Loop through instances
var _layerId = layer_get_id("ContraptionInstances");
layer_add_instance(_layerId, self);