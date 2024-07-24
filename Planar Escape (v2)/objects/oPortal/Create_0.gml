/// @func	teleport({id} solid);
teleport = function(_solid){}

// Loop through instances
var _layerId = layer_get_id("PortalInstances");
layer_add_instance(_layerId, self);