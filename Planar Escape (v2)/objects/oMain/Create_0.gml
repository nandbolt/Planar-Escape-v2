// Persistent
instance_create_layer(0, 0, "Instances", oGameManager);
instance_create_layer(0, 0, "Instances", oDisplayManager);
instance_create_layer(0, 0, "Instances", oParticleManager);
instance_create_layer(0, 0, "Instances", oPauseManager);

// Debugger
//instance_create_layer(0, 0, "Instances", oDebugger);

// Font
draw_set_font(fDefault);

// Randomize
randomize();

// If a save file if it doesn't exist
if (!file_exists("save-data.txt"))
{
	// Create save struct
	var _roomSize = GRID_WIDTH * GRID_HEIGHT;
	var _saveData = {
		musicVolume : 0.2,
		sfxsVolume : 1,
		fullscreen : true,
		levelMain01Stars : 0,
		levelMain01Stardisks : 0,
		levelMain01FastestTimes : [-1, -1, -1],
		levelMain01EscapeScores : [0, 0, 0],
		levelMain01MarkScores : [0, 0, 0],
		levelMain01TraceScores : [0, 0, 0],
		levelMain01Marks : array_create(_roomSize, 0),
		levelMain01Traces : array_create(_roomSize, 0),
		levelMain02Stars : 0,
		levelMain02Stardisks : 0,
		levelMain02FastestTimes : [-1, -1, -1],
		levelMain02EscapeScores : [0, 0, 0],
		levelMain02MarkScores : [0, 0, 0],
		levelMain02TraceScores : [0, 0, 0],
		levelMain02Marks : array_create(_roomSize, 0),
		levelMain02Traces : array_create(_roomSize, 0),
		levelMain03Stars : 0,
		levelMain03Stardisks : 0,
		levelMain03FastestTimes : [-1, -1, -1],
		levelMain03EscapeScores : [0, 0, 0],
		levelMain03MarkScores : [0, 0, 0],
		levelMain03TraceScores : [0, 0, 0],
		levelMain03Marks : array_create(_roomSize, 0),
		levelMain03Traces : array_create(_roomSize, 0),
		levelMain04Stars : 0,
		levelMain04Stardisks : 0,
		levelMain04FastestTimes : [-1, -1, -1],
		levelMain04EscapeScores : [0, 0, 0],
		levelMain04MarkScores : [0, 0, 0],
		levelMain04TraceScores : [0, 0, 0],
		levelMain04Marks : array_create(_roomSize, 0),
		levelMain04Traces : array_create(_roomSize, 0),
		levelMain05Stars : 0,
		levelMain05Stardisks : 0,
		levelMain05FastestTimes : [-1, -1, -1],
		levelMain05EscapeScores : [0, 0, 0],
		levelMain05MarkScores : [0, 0, 0],
		levelMain05TraceScores : [0, 0, 0],
		levelMain05Marks : array_create(_roomSize, 0),
		levelMain05Traces : array_create(_roomSize, 0),
		levelMain06Stars : 0,
		levelMain06Stardisks : 0,
		levelMain06FastestTimes : [-1, -1, -1],
		levelMain06EscapeScores : [0, 0, 0],
		levelMain06MarkScores : [0, 0, 0],
		levelMain06TraceScores : [0, 0, 0],
		levelMain06Marks : array_create(_roomSize, 0),
		levelMain06Traces : array_create(_roomSize, 0),
		levelMain07Stars : 0,
		levelMain07Stardisks : 0,
		levelMain07FastestTimes : [-1, -1, -1],
		levelMain07EscapeScores : [0, 0, 0],
		levelMain07MarkScores : [0, 0, 0],
		levelMain07TraceScores : [0, 0, 0],
		levelMain07Marks : array_create(_roomSize, 0),
		levelMain07Traces : array_create(_roomSize, 0),
		levelMain08Stars : 0,
		levelMain08Stardisks : 0,
		levelMain08FastestTimes : [-1, -1, -1],
		levelMain08EscapeScores : [0, 0, 0],
		levelMain08MarkScores : [0, 0, 0],
		levelMain08TraceScores : [0, 0, 0],
		levelMain08Marks : array_create(_roomSize, 0),
		levelMain08Traces : array_create(_roomSize, 0),
		levelMain09Stars : 0,
		levelMain09Stardisks : 0,
		levelMain09FastestTimes : [-1, -1, -1],
		levelMain09EscapeScores : [0, 0, 0],
		levelMain09MarkScores : [0, 0, 0],
		levelMain09TraceScores : [0, 0, 0],
		levelMain09Marks : array_create(_roomSize, 0),
		levelMain09Traces : array_create(_roomSize, 0),
		levelMain10Stars : 0,
		levelMain10Stardisks : 0,
		levelMain10FastestTimes : [-1, -1, -1],
		levelMain10EscapeScores : [0, 0, 0],
		levelMain10MarkScores : [0, 0, 0],
		levelMain10TraceScores : [0, 0, 0],
		levelMain10Marks : array_create(_roomSize, 0),
		levelMain10Traces : array_create(_roomSize, 0),
		levelMain11Stars : 0,
		levelMain11Stardisks : 0,
		levelMain11FastestTimes : [-1, -1, -1],
		levelMain11EscapeScores : [0, 0, 0],
		levelMain11MarkScores : [0, 0, 0],
		levelMain11TraceScores : [0, 0, 0],
		levelMain11Marks : array_create(_roomSize, 0),
		levelMain11Traces : array_create(_roomSize, 0),
		levelMain12Stars : 0,
		levelMain12Stardisks : 0,
		levelMain12FastestTimes : [-1, -1, -1],
		levelMain12EscapeScores : [0, 0, 0],
		levelMain12MarkScores : [0, 0, 0],
		levelMain12TraceScores : [0, 0, 0],
		levelMain12Marks : array_create(_roomSize, 0),
		levelMain12Traces : array_create(_roomSize, 0),
		levelMain13Stars : 0,
		levelMain13Stardisks : 0,
		levelMain13FastestTimes : [-1, -1, -1],
		levelMain13EscapeScores : [0, 0, 0],
		levelMain13MarkScores : [0, 0, 0],
		levelMain13TraceScores : [0, 0, 0],
		levelMain13Marks : array_create(_roomSize, 0),
		levelMain13Traces : array_create(_roomSize, 0),
		levelMain14Stars : 0,
		levelMain14Stardisks : 0,
		levelMain14FastestTimes : [-1, -1, -1],
		levelMain14EscapeScores : [0, 0, 0],
		levelMain14MarkScores : [0, 0, 0],
		levelMain14TraceScores : [0, 0, 0],
		levelMain14Marks : array_create(_roomSize, 0),
		levelMain14Traces : array_create(_roomSize, 0),
		levelMain15Stars : 0,
		levelMain15Stardisks : 0,
		levelMain15FastestTimes : [-1, -1, -1],
		levelMain15EscapeScores : [0, 0, 0],
		levelMain15MarkScores : [0, 0, 0],
		levelMain15TraceScores : [0, 0, 0],
		levelMain15Marks : array_create(_roomSize, 0),
		levelMain15Traces : array_create(_roomSize, 0),
		levelMain16Stars : 0,
		levelMain16Stardisks : 0,
		levelMain16FastestTimes : [-1, -1, -1],
		levelMain16EscapeScores : [0, 0, 0],
		levelMain16MarkScores : [0, 0, 0],
		levelMain16TraceScores : [0, 0, 0],
		levelMain16Marks : array_create(_roomSize, 0),
		levelMain16Traces : array_create(_roomSize, 0),
	}
	var _jsonString = json_stringify(_saveData);
	
	// Create a save file
	var _file = file_text_open_write("save-data.txt");
	
	// Save string to file
	file_text_write_string(_file, _jsonString);
	
	// Close file
	file_text_close(_file);
}