// Movement
yVelocity = 0;
moveSpeed = 0.1;

// Start delay
alarm[0] = 60;

// Entity sound
audio_play_sound(sfxEntity, 5, true);
audio_sound_gain(sfxEntity, 0, 0);

// Set speed
if (global.entitySpeed == EntitySpeed.STASIS) moveSpeed = 0;
else if (global.entitySpeed == EntitySpeed.HYPER) moveSpeed *= 2;