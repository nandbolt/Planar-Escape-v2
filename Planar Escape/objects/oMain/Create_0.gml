// Load
loadIdx = 0;
loadMaxIdx = 2;
loadText = "Loading music...";

// Hover
hovering = false;

// Persistent
instance_create_layer(0, 0, "Instances", oGameManager);
instance_create_layer(0, 0, "Instances", oDisplayManager);
instance_create_layer(0, 0, "Instances", oParticleManager);
instance_create_layer(0, 0, "Instances", oPauseManager);

// Audio
audio_group_load(agMusic);
audio_group_load(agSfxs);

// Debugger
//instance_create_layer(0, 0, "Instances", oDebugger);

// Font
draw_set_font(fDefault);

// Randomize
randomize();

if (onDesktop())
{
	if (!file_exists("save-data.txt"))
	{
		// Create save struct
		var _saveData = getDefaultSaveData();
		var _jsonString = json_stringify(_saveData);
	
		// Create a save file
		var _file = file_text_open_write("save-data.txt");
	
		// Save string to file
		file_text_write_string(_file, _jsonString);
	
		// Close file
		file_text_close(_file);
	}
}
else
{
	if (LoadFromLocalStorage("save-data") == "")
	{
		// Create save struct
		var _saveData = getDefaultSaveData();
		var _jsonString = json_stringify(_saveData);
		SaveToLocalStorage("save-data", _jsonString);
	}
}