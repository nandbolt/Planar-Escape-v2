// Remove from the engine
var _box = other.box;
with (be_oBoxEngine)
{
	removeBox(_box);
}
		
// Destroy player
instance_destroy(other);

// Complete level
with (oLevel)
{
	levelComplete = true;
}