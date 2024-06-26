// Movement
velocity = new BEVector2();
damping = 0.975;

// Gadget
gadget = undefined;

// Grab
grabbing = false;
grabInst = noone;

// Tiles
collisionMap = layer_tilemap_get_id("CollisionTiles");