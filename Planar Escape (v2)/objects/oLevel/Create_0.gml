// Create box engine
boxEngine = instance_create_layer(0, 0, "Instances", be_oBoxEngine);

// Add box collision generator
cgBoxes = new BEBoxContactGen();
with (boxEngine)
{
	array_push(contactGens, other.cgBoxes);
}