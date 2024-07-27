/// @desc Spawn

// If hasn't spawned
if (!spawned)
{
	// Spawn player + particles
	emitZapParticles(spawnBox(oPlayer, x, y, "Instances", be_oBoxEngine), c_gray);
	spawned = true;
	
	// Spawn sound
	audio_play_sound(sfxPortalEnter, 10, false);
	
	// Reset alarm
	alarm[0] = fadeOutSpeed;
}
else instance_destroy();