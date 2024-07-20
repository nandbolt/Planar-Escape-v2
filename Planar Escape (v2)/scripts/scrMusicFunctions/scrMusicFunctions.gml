/// @func   updateMusic();
/// @desc   Updates the music for the current room.
function updateMusic()
{
	if (global.editingLevel) audio_stop_all();
	else if (room == rLevelMain01 || room == rLevelMain02 || room == rLevelMain03 || room == rLevelMain04) playSong(mCreation);
	else if (room == rLevelMain05 || room == rLevelMain06 || room == rLevelMain07 || room == rLevelMain08) playSong(mRadiation);
	else if (room == rLevelMain09 || room == rLevelMain10 || room == rLevelMain11 || room == rLevelMain12) playSong(mPopulation);
	else if (room == rLevelMain13 || room == rLevelMain14 || room == rLevelMain15 || room == rLevelMain16) playSong(mSalvation);
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