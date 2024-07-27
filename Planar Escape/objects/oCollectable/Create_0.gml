/// @func	collect({id} actor);
collect = function(_actor){}

// Loop through instances
var _layerId = layer_get_id("CollectableInstances");
layer_add_instance(_layerId, self);