// Inherit the parent event
event_inherited();

// States
mentalState = 0;

// Target
target = noone;

// View
prevTilePosition = new BEVector2(floor(x / TILE_SIZE) * TILE_SIZE, floor(y / TILE_SIZE) * TILE_SIZE);
viewDistance = 0;
maxViewDistance = 144;
currentMaxViewDistance = 0;
viewStart = new BEVector2(x, y);
viewDashImgIdx = 0;
viewDashImgSpd = 4/60;
viewDashImgNum = 2;
thinkFreq = 120;

// Alert
alertY = 0;

// Tiles
collisionMap = layer_tilemap_get_id("CollisionTiles");

// Set think alarm
alarm[0] = thinkFreq;