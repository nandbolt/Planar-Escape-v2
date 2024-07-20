// Level Grids
gridWidth = floor(room_width / TILE_SIZE) - 2;
gridHeight = floor(room_height / TILE_SIZE) - 2;
levelGrid = array_create(gridWidth * gridHeight, 0);

// Movement
moveInput = new BEVector2();
moveHoldDelay = 20;

// Camera
instance_create_layer(0, 0, "Instances", oCamera);

// Destroy all solids
instance_destroy(oSolid);

// Destroy portals
instance_destroy(oPortal);
instance_destroy(oSpawnPortal);

// Update music
updateMusic();