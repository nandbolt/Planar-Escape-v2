/// @desc Countdown Timer
if (image_index == image_number-1) explode();
else
{
	image_index++;
	alarm[0] = 60;
	
	// Countdown sound
	if (isVisible(id) && !audio_is_playing(sfxCountdown)) audio_play_sound(sfxCountdown, 10, false);
}