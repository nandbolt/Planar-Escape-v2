// States
spawned = false;

// Fade
fadeInSpeed = 60;
fadeOutSpeed = 180;

// Start alarm
alarm[0] = fadeInSpeed;

// Loop through instances
var _layerId = layer_get_id("PortalInstances");
layer_add_instance(_layerId, self);