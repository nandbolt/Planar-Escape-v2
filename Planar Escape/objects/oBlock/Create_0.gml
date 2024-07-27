// Inherit the parent event
event_inherited();

// Loop through instances
var _layerId = layer_get_id("BlockInstances");
layer_add_instance(_layerId, self);