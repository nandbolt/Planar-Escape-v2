// Inherit the parent event
event_inherited();

// States
active = true;

// Laser
laserStart = new BEVector2(x + lengthdir_x(5, image_angle), y + lengthdir_y(5, image_angle));
maxLaserLength = 314;
laserLength = 0;
sprLaser= sLaser;
laserColor = c_red;
powerType = Power.RED;

// Layers
collisionMap = layer_tilemap_get_id("CollisionTiles");

// Start alarms
alarm[0] = 20;