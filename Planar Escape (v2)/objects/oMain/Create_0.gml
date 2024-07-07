// Persistent
instance_create_layer(0, 0, "Instances", oGameManager);
instance_create_layer(0, 0, "Instances", oDisplayManager);
instance_create_layer(0, 0, "Instances", oParticleManager);
instance_create_layer(0, 0, "Instances", oPauseManager);

// Debugger
instance_create_layer(0, 0, "Instances", oDebugger);

// Font
draw_set_font(fDefault);