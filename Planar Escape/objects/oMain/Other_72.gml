/// @desc Music Loaded
var _prevLoadIdx = loadIdx;
if (async_load[? "type"] == "audiogroup_load")
{
	if (async_load[? "group_id"] == agMusic)
	{
		loadText = "Music loaded!";
		loadIdx++;
	}
	else if (async_load[? "group_id"] == agSfxs)
	{
		loadText = "SFXs loaded!";
		loadIdx++;
	}
}

// Check menu spawn
if (loadIdx == loadMaxIdx && loadIdx != _prevLoadIdx)
{
	// Load complete
	loadText = "";
}