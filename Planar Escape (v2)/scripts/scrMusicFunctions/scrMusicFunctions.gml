/// @func   updateMusic();
/// @desc   Updates the music for the current room.
function updateMusic()
{
	// Creation song
	if (room == rLevelMain01 || room == rLevelMain02 || room == rLevelMain03 || room == rLevelMain04) playSong(mCreation);
	else if (room == rLevelMain05 || room == rLevelMain06 || room == rLevelMain07 || room == rLevelMain08) playSong(mRadiation);
}

/// @func	playSong({sound} song);
/// @desc	Plays the requested song if it isn't already being played.
function playSong(_song)
{
	// If song is not being played
	if (!audio_is_playing(_song))
	{
		// Stop current song that is playing
		audio_stop_all();
			
		// Play requested song
		audio_play_sound(_song, 50, true);
	}
}