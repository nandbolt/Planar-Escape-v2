// State
levelComplete = false;
levelFailed = false;
levelTime = 0;
startTime = 0;
starsCollected = 0;

// Layers
collisionLayer = layer_get_id("CollisionTiles");
gridLayer = layer_get_id("GridBackground");

// Checkpoint
checkpoint = noone;
respawnDelay = 60;

// Text
worldTextScale = 2/3;

// Camera
instance_create_layer(0, 0, "Instances", oCamera);

#region Box Engine

// Create box engine
boxEngine = instance_create_layer(0, 0, "Instances", be_oBoxEngine);

// Add box collision generator
cgBoxes = new BEBoxContactGen();
cgTiles = new BETileContactGen(layer_tilemap_get_id("CollisionTiles"), TILE_SIZE);
with (boxEngine)
{
	array_push(contactGens, other.cgBoxes);
	array_push(contactGens, other.cgTiles);
}

#endregion

// Hide debug layer
layer_set_visible(collisionLayer, false);
layer_set_visible(gridLayer, false);

// Entity
instance_create_layer(room_width * 0.5, room_height, "AirInstances", oEntity);