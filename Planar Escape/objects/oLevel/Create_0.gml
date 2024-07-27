// If editing level
if (global.editingLevel)
{
	// Create level editor and destroy self
	instance_create_layer(oSpawnPortal.x, oSpawnPortal.y, "Instances", oLevelEditor);
	instance_destroy();
	exit;
}

// If custom level
if (roomIsCustomLevel(room))
{
	// Get rotation grid
	var _rotationGrid = [];
	array_copy(_rotationGrid, 0, global.customRotationGrid, 0, array_length(global.customRotationGrid));
	
	// Loop through instances
	var _gridWidth = floor(room_width / TILE_SIZE) - 2;
	with (all)
	{
		if (x != 0 || y != 0)
		{
			// Grid position
			var _gridX = floor(x / TILE_SIZE) - 1, _gridY = floor(y / TILE_SIZE) - 1;
			var _rotationValue = _rotationGrid[_gridWidth * _gridY + _gridX];
			if (object_is_ancestor(object_index, oActor)) image_index = floor(_rotationValue / 45);
			else image_angle = _rotationValue;
		}
	}
}

// State
levelComplete = false;
levelFailed = false;
levelTime = 0;
levelName = getLevelName(room);
mode = global.mode;
modeName = getModeName(mode);
entitySpeedName = getEntitySpeedName(global.entitySpeed);
entitySpeedScoreMultiplier = getEntitySpeedScoreMultiplier(global.entitySpeed);

// Score
runScore = 0;
starsCollected = 0;
totalStars = 0;
stardisksCollected = 0;
totalStardisks = 0;
tilesTraced = 0;
fastestTime = global.currentLevelFastestTimes[0];
secondFastestTime = global.currentLevelFastestTimes[1];
thirdFastestTime = global.currentLevelFastestTimes[2];
highestScore = global.currentLevelEscapeScores[0];
secondHighestScore = global.currentLevelEscapeScores[1];
thirdHighestScore = global.currentLevelEscapeScores[2];
if (global.mode == Mode.MARK)
{
	highestScore = global.currentLevelMarkScores[0];
	secondHighestScore = global.currentLevelMarkScores[1];
	thirdHighestScore = global.currentLevelMarkScores[2];
}
else if (global.mode == Mode.TRACE)
{
	highestScore = global.currentLevelTraceScores[0];
	secondHighestScore = global.currentLevelTraceScores[1];
	thirdHighestScore = global.currentLevelTraceScores[2];
}
sprTrace = sTrace;
if (global.mode == Mode.MARK) sprTrace = sMark;

// End menu
levelEndMenus = 0;
levelEndMenuDelay = 60;
maxCompleteLevelMenu = 3;
maxFailedLevelMenu = 1;
nextRoom = room;

// Layers
collisionLayer = layer_get_id("CollisionTiles");
gridLayer = layer_get_id("GridBackground");

// Tilemaps
collisionMap = layer_tilemap_get_id("CollisionTiles");
worldMap = layer_tilemap_get_id("WorldTiles"); 
groundMap = layer_tilemap_get_id("GroundTiles");

// Checkpoint
checkpoint = noone;
respawnDelay = 60;

// Text
worldTextScale = 2/3;

// Entity meter
playerY = room_height;

// GUI
starAnimCounter = 0;
starAnimSpeed = 0.1;

#region Functions

/// @func	completeLevel();
completeLevel = function()
{
	// If level is not yet complete
	if (!levelComplete)
	{
		var _newHighscore = false;
		
		#region Fastest Times
		
		if (fastestTime <= 0 || levelTime < fastestTime)
		{
			// New gold
			global.currentLevelFastestTimes[2] = global.currentLevelFastestTimes[1];
			global.currentLevelFastestTimes[1] = global.currentLevelFastestTimes[0];
			global.currentLevelFastestTimes[0] = levelTime;
			_newHighscore = true;
		}
		else if (secondFastestTime <= 0 || levelTime < secondFastestTime)
		{
			// New silver
			global.currentLevelFastestTimes[2] = global.currentLevelFastestTimes[1];
			global.currentLevelFastestTimes[1] = levelTime;
			_newHighscore = true;
		}
		else if (thirdFastestTime <= 0 || levelTime < thirdFastestTime)
		{
			// New bronze
			global.currentLevelFastestTimes[2] = levelTime;
			_newHighscore = true;
		}
		
		#endregion
		
		switch (global.mode)
		{
			case Mode.ESCAPE:
				#region Escape Scores
				
				// Calculate escape score
				runScore = floor((starsCollected / totalStars * 500 + stardisksCollected / totalStardisks * 500 + 30 / levelTime * 1000) * entitySpeedScoreMultiplier);
				
				if (runScore > highestScore)
				{
					// New gold
					global.currentLevelEscapeScores[2] = global.currentLevelEscapeScores[1];
					global.currentLevelEscapeScores[1] = global.currentLevelEscapeScores[0];
					global.currentLevelEscapeScores[0] = runScore;
					_newHighscore = true;
				}
				else if (runScore > secondHighestScore)
				{
					// New silver
					global.currentLevelEscapeScores[2] = global.currentLevelEscapeScores[1];
					global.currentLevelEscapeScores[1] = runScore;
					_newHighscore = true;
				}
				else if (runScore > thirdHighestScore)
				{
					// New bronze
					global.currentLevelEscapeScores[2] = runScore;
					_newHighscore = true;
				}
				
				// Stars
				if (starsCollected > global.currentLevelStarsCollected) global.currentLevelStarsCollected = starsCollected;
				if (stardisksCollected > global.currentLevelStardisksCollected) global.currentLevelStardisksCollected = stardisksCollected;
		
				#endregion
				break;
			case Mode.MARK:
				#region Mark Scores
				
				// Calculate mark score
				runScore = floor(tilesTraced * entitySpeedScoreMultiplier);
				
				if (runScore > highestScore)
				{
					// New gold
					global.currentLevelMarkScores[2] = global.currentLevelMarkScores[1];
					global.currentLevelMarkScores[1] = global.currentLevelMarkScores[0];
					global.currentLevelMarkScores[0] = runScore;
					_newHighscore = true;
					
					// Set ground tiles
					for (var _y = TILE_SIZE; _y < room_height - TILE_SIZE; _y += TILE_SIZE)
					{
						for (var _x = TILE_SIZE; _x < room_width - TILE_SIZE; _x += TILE_SIZE)
						{
							// Set collision tile
							var _gridX = floor(_x / TILE_SIZE) - 1, _gridY = floor(_y / TILE_SIZE) - 1;
							var _gridIdx = GRID_WIDTH * _gridY + _gridX;
							global.currentLevelMarks[_gridIdx] = tilemap_get_at_pixel(groundMap, _x, _y);
						}
					}
				}
				else if (runScore > secondHighestScore)
				{
					// New silver
					global.currentLevelMarkScores[2] = global.currentLevelMarkScores[1];
					global.currentLevelMarkScores[1] = runScore;
					_newHighscore = true;
				}
				else if (runScore > thirdHighestScore)
				{
					// New bronze
					global.currentLevelMarkScores[2] = runScore;
					_newHighscore = true;
				}
		
				#endregion
				break;
			case Mode.TRACE:
				#region Trace Scores
				
				// Calculate trace score
				runScore = floor(((GRID_WIDTH * GRID_HEIGHT) / tilesTraced) * entitySpeedScoreMultiplier);
				
				if (runScore > highestScore)
				{
					// New gold
					global.currentLevelTraceScores[2] = global.currentLevelTraceScores[1];
					global.currentLevelTraceScores[1] = global.currentLevelTraceScores[0];
					global.currentLevelTraceScores[0] = runScore;
					_newHighscore = true;
					
					// Set ground tiles
					for (var _y = TILE_SIZE; _y < room_height - TILE_SIZE; _y += TILE_SIZE)
					{
						for (var _x = TILE_SIZE; _x < room_width - TILE_SIZE; _x += TILE_SIZE)
						{
							// Set collision tile
							var _gridX = floor(_x / TILE_SIZE) - 1, _gridY = floor(_y / TILE_SIZE) - 1;
							var _gridIdx = GRID_WIDTH * _gridY + _gridX;
							global.currentLevelTraces[_gridIdx] = tilemap_get_at_pixel(groundMap, _x, _y);
						}
					}
				}
				else if (runScore > secondHighestScore)
				{
					// New silver
					global.currentLevelTraceScores[2] = global.currentLevelTraceScores[1];
					global.currentLevelTraceScores[1] = runScore;
					_newHighscore = true;
				}
				else if (runScore > thirdHighestScore)
				{
					// New bronze
					global.currentLevelTraceScores[2] = runScore;
					_newHighscore = true;
				}
		
				#endregion
				break;
		}
		
		// If new high score
		if (_newHighscore)
		{
			// Load save data
			var _saveData = undefined, _customLevel = roomIsCustomLevel(room);
			if (!_customLevel)
			{
				// Open save
				var _file = file_text_open_read("save-data.txt");
	
				// Parse save file
				var _jsonString = file_text_read_string(_file);
				_saveData = json_parse(_jsonString);
	
				// Close save
				file_text_close(_file);
			}
			else
			{
				// Open save
				var _levelName = global.customLevelNames[global.customLevelIdx];
				var _fileName = working_directory + "/custom-levels/" + _levelName + ".txt";
				var _file = file_text_open_read(_fileName);
	
				// Parse save file
				var _jsonString = file_text_read_string(_file);
				_saveData = json_parse(_jsonString);
	
				// Close save
				file_text_close(_file);
			}
			
			// Edit scores
			if (!_customLevel)
			{
				switch (room)
				{
					case rLevelMain01:
						_saveData.levelMain01Stars = global.currentLevelStarsCollected;
						_saveData.levelMain01Stardisks = global.currentLevelStardisksCollected;
						_saveData.levelMain01FastestTimes = global.currentLevelFastestTimes;
						_saveData.levelMain01EscapeScores = global.currentLevelEscapeScores;
						_saveData.levelMain01MarkScores = global.currentLevelMarkScores;
						_saveData.levelMain01TraceScores = global.currentLevelTraceScores;
						_saveData.levelMain01Marks = global.currentLevelMarks;
						_saveData.levelMain01Traces = global.currentLevelTraces;
						break;
					case rLevelMain02:
						_saveData.levelMain02Stars = global.currentLevelStarsCollected;
						_saveData.levelMain02Stardisks = global.currentLevelStardisksCollected;
						_saveData.levelMain02FastestTimes = global.currentLevelFastestTimes;
						_saveData.levelMain02EscapeScores = global.currentLevelEscapeScores;
						_saveData.levelMain02MarkScores = global.currentLevelMarkScores;
						_saveData.levelMain02TraceScores = global.currentLevelTraceScores;
						_saveData.levelMain02Marks = global.currentLevelMarks;
						_saveData.levelMain02Traces = global.currentLevelTraces;
						break;
					case rLevelMain03:
						_saveData.levelMain03Stars = global.currentLevelStarsCollected;
						_saveData.levelMain03Stardisks = global.currentLevelStardisksCollected;
						_saveData.levelMain03FastestTimes = global.currentLevelFastestTimes;
						_saveData.levelMain03EscapeScores = global.currentLevelEscapeScores;
						_saveData.levelMain03MarkScores = global.currentLevelMarkScores;
						_saveData.levelMain03TraceScores = global.currentLevelTraceScores;
						_saveData.levelMain03Marks = global.currentLevelMarks;
						_saveData.levelMain03Traces = global.currentLevelTraces;
						break;
					case rLevelMain04:
						_saveData.levelMain04Stars = global.currentLevelStarsCollected;
						_saveData.levelMain04Stardisks = global.currentLevelStardisksCollected;
						_saveData.levelMain04FastestTimes = global.currentLevelFastestTimes;
						_saveData.levelMain04EscapeScores = global.currentLevelEscapeScores;
						_saveData.levelMain04MarkScores = global.currentLevelMarkScores;
						_saveData.levelMain04TraceScores = global.currentLevelTraceScores;
						_saveData.levelMain04Marks = global.currentLevelMarks;
						_saveData.levelMain04Traces = global.currentLevelTraces;
						break;
					case rLevelMain05:
						_saveData.levelMain05Stars = global.currentLevelStarsCollected;
						_saveData.levelMain05Stardisks = global.currentLevelStardisksCollected;
						_saveData.levelMain05FastestTimes = global.currentLevelFastestTimes;
						_saveData.levelMain05EscapeScores = global.currentLevelEscapeScores;
						_saveData.levelMain05MarkScores = global.currentLevelMarkScores;
						_saveData.levelMain05TraceScores = global.currentLevelTraceScores;
						_saveData.levelMain05Marks = global.currentLevelMarks;
						_saveData.levelMain05Traces = global.currentLevelTraces;
						break;
					case rLevelMain06:
						_saveData.levelMain06Stars = global.currentLevelStarsCollected;
						_saveData.levelMain06Stardisks = global.currentLevelStardisksCollected;
						_saveData.levelMain06FastestTimes = global.currentLevelFastestTimes;
						_saveData.levelMain06EscapeScores = global.currentLevelEscapeScores;
						_saveData.levelMain06MarkScores = global.currentLevelMarkScores;
						_saveData.levelMain06TraceScores = global.currentLevelTraceScores;
						_saveData.levelMain06Marks = global.currentLevelMarks;
						_saveData.levelMain06Traces = global.currentLevelTraces;
						break;
					case rLevelMain07:
						_saveData.levelMain07Stars = global.currentLevelStarsCollected;
						_saveData.levelMain07Stardisks = global.currentLevelStardisksCollected;
						_saveData.levelMain07FastestTimes = global.currentLevelFastestTimes;
						_saveData.levelMain07EscapeScores = global.currentLevelEscapeScores;
						_saveData.levelMain07MarkScores = global.currentLevelMarkScores;
						_saveData.levelMain07TraceScores = global.currentLevelTraceScores;
						_saveData.levelMain07Marks = global.currentLevelMarks;
						_saveData.levelMain07Traces = global.currentLevelTraces;
						break;
					case rLevelMain08:
						_saveData.levelMain08Stars = global.currentLevelStarsCollected;
						_saveData.levelMain08Stardisks = global.currentLevelStardisksCollected;
						_saveData.levelMain08FastestTimes = global.currentLevelFastestTimes;
						_saveData.levelMain08EscapeScores = global.currentLevelEscapeScores;
						_saveData.levelMain08MarkScores = global.currentLevelMarkScores;
						_saveData.levelMain08TraceScores = global.currentLevelTraceScores;
						_saveData.levelMain08Marks = global.currentLevelMarks;
						_saveData.levelMain08Traces = global.currentLevelTraces;
						break;
					case rLevelMain09:
						_saveData.levelMain09Stars = global.currentLevelStarsCollected;
						_saveData.levelMain09Stardisks = global.currentLevelStardisksCollected;
						_saveData.levelMain09FastestTimes = global.currentLevelFastestTimes;
						_saveData.levelMain09EscapeScores = global.currentLevelEscapeScores;
						_saveData.levelMain09MarkScores = global.currentLevelMarkScores;
						_saveData.levelMain09TraceScores = global.currentLevelTraceScores;
						_saveData.levelMain09Marks = global.currentLevelMarks;
						_saveData.levelMain09Traces = global.currentLevelTraces;
						break;
					case rLevelMain10:
						_saveData.levelMain10Stars = global.currentLevelStarsCollected;
						_saveData.levelMain10Stardisks = global.currentLevelStardisksCollected;
						_saveData.levelMain10FastestTimes = global.currentLevelFastestTimes;
						_saveData.levelMain10EscapeScores = global.currentLevelEscapeScores;
						_saveData.levelMain10MarkScores = global.currentLevelMarkScores;
						_saveData.levelMain10TraceScores = global.currentLevelTraceScores;
						_saveData.levelMain10Marks = global.currentLevelMarks;
						_saveData.levelMain10Traces = global.currentLevelTraces;
						break;
					case rLevelMain11:
						_saveData.levelMain11Stars = global.currentLevelStarsCollected;
						_saveData.levelMain11Stardisks = global.currentLevelStardisksCollected;
						_saveData.levelMain11FastestTimes = global.currentLevelFastestTimes;
						_saveData.levelMain11EscapeScores = global.currentLevelEscapeScores;
						_saveData.levelMain11MarkScores = global.currentLevelMarkScores;
						_saveData.levelMain11TraceScores = global.currentLevelTraceScores;
						_saveData.levelMain11Marks = global.currentLevelMarks;
						_saveData.levelMain11Traces = global.currentLevelTraces;
						break;
					case rLevelMain12:
						_saveData.levelMain12Stars = global.currentLevelStarsCollected;
						_saveData.levelMain12Stardisks = global.currentLevelStardisksCollected;
						_saveData.levelMain12FastestTimes = global.currentLevelFastestTimes;
						_saveData.levelMain12EscapeScores = global.currentLevelEscapeScores;
						_saveData.levelMain12MarkScores = global.currentLevelMarkScores;
						_saveData.levelMain12TraceScores = global.currentLevelTraceScores;
						_saveData.levelMain12Marks = global.currentLevelMarks;
						_saveData.levelMain12Traces = global.currentLevelTraces;
						break;
					case rLevelMain13:
						_saveData.levelMain13Stars = global.currentLevelStarsCollected;
						_saveData.levelMain13Stardisks = global.currentLevelStardisksCollected;
						_saveData.levelMain13FastestTimes = global.currentLevelFastestTimes;
						_saveData.levelMain13EscapeScores = global.currentLevelEscapeScores;
						_saveData.levelMain13MarkScores = global.currentLevelMarkScores;
						_saveData.levelMain13TraceScores = global.currentLevelTraceScores;
						_saveData.levelMain13Marks = global.currentLevelMarks;
						_saveData.levelMain13Traces = global.currentLevelTraces;
						break;
					case rLevelMain14:
						_saveData.levelMain14Stars = global.currentLevelStarsCollected;
						_saveData.levelMain14Stardisks = global.currentLevelStardisksCollected;
						_saveData.levelMain14FastestTimes = global.currentLevelFastestTimes;
						_saveData.levelMain14EscapeScores = global.currentLevelEscapeScores;
						_saveData.levelMain14MarkScores = global.currentLevelMarkScores;
						_saveData.levelMain14TraceScores = global.currentLevelTraceScores;
						_saveData.levelMain14Marks = global.currentLevelMarks;
						_saveData.levelMain14Traces = global.currentLevelTraces;
						break;
					case rLevelMain15:
						_saveData.levelMain15Stars = global.currentLevelStarsCollected;
						_saveData.levelMain15Stardisks = global.currentLevelStardisksCollected;
						_saveData.levelMain15FastestTimes = global.currentLevelFastestTimes;
						_saveData.levelMain15EscapeScores = global.currentLevelEscapeScores;
						_saveData.levelMain15MarkScores = global.currentLevelMarkScores;
						_saveData.levelMain15TraceScores = global.currentLevelTraceScores;
						_saveData.levelMain15Marks = global.currentLevelMarks;
						_saveData.levelMain15Traces = global.currentLevelTraces;
						break;
					case rLevelMain16:
						_saveData.levelMain16Stars = global.currentLevelStarsCollected;
						_saveData.levelMain16Stardisks = global.currentLevelStardisksCollected;
						_saveData.levelMain16FastestTimes = global.currentLevelFastestTimes;
						_saveData.levelMain16EscapeScores = global.currentLevelEscapeScores;
						_saveData.levelMain16MarkScores = global.currentLevelMarkScores;
						_saveData.levelMain16TraceScores = global.currentLevelTraceScores;
						_saveData.levelMain16Marks = global.currentLevelMarks;
						_saveData.levelMain16Traces = global.currentLevelTraces;
						break;
				}
			}
			else
			{
				_saveData.stars = global.currentLevelStarsCollected;
				_saveData.stardisks = global.currentLevelStardisksCollected;
				_saveData.fastestTimes = global.currentLevelFastestTimes;
				_saveData.escapeScores = global.currentLevelEscapeScores;
				_saveData.markScores = global.currentLevelMarkScores;
				_saveData.traceScores = global.currentLevelTraceScores;
				_saveData.marks = global.currentLevelMarks;
				_saveData.traces = global.currentLevelTraces;
			}
			
			// Save new scores to file
			if (!_customLevel)
			{
				// Open save
				var _file = file_text_open_write("save-data.txt");
	
				// Save string to file
				var _jsonString = json_stringify(_saveData);
				file_text_write_string(_file, _jsonString);
	
				// Close save
				file_text_close(_file);
			}
			else
			{
				// Open save
				var _levelName = global.customLevelNames[global.customLevelIdx];
				var _fileName = working_directory + "/custom-levels/" + _levelName + ".txt";
				var _file = file_text_open_read(_fileName);
				
				// Save string to file
				var _jsonString = json_stringify(_saveData);
				file_text_write_string(_file, _jsonString);
	
				// Close save
				file_text_close(_file);
			}
		}
	}
	
	// Complete level
	levelComplete = true;
	alarm[0] = levelEndMenuDelay;
}

/// @func	failLevel();
failLevel = function()
{
	levelFailed = true;
	alarm[0] = levelEndMenuDelay;
}

#endregion

// Camera
instance_create_layer(0, 0, "Instances", oCamera);

#region Box Engine

// Create box engine
boxEngine = instance_create_layer(0, 0, "Instances", be_oBoxEngine);

// Add box collision generator
cgBoxes = new BEBoxContactGen();
cgTiles = new BETileContactGen(layer_tilemap_get_id("CollisionTiles"), TILE_SIZE);
with (boxEngine)
{
	array_push(contactGens, other.cgBoxes);
	array_push(contactGens, other.cgTiles);
}

#endregion

// Hide debug layer
layer_set_visible(collisionLayer, false);
layer_set_visible(gridLayer, false);

// Entity
instance_create_layer(room_width * 0.5, room_height, "Instances", oEntity);

// Start fade
alarm[1] = 60;

// Set world tiles
for (var _y = HALF_TILE_SIZE; _y < room_height; _y += TILE_SIZE)
{
	for (var _x = HALF_TILE_SIZE; _x < room_width; _x += TILE_SIZE)
	{
		// Set collision tile
		tilemap_set_at_pixel(collisionMap, tilemap_get_at_pixel(worldMap, _x, _y), _x, _y);
	}
}

// Set ground tiles
if (mode == Mode.ESCAPE)
{
	for (var _y = TILE_SIZE; _y < room_height - TILE_SIZE; _y += TILE_SIZE)
	{
		for (var _x = TILE_SIZE; _x < room_width - TILE_SIZE; _x += TILE_SIZE)
		{
			// Set collision tile
			var _gridX = floor(_x / TILE_SIZE) - 1, _gridY = floor(_y / TILE_SIZE) - 1;
			var _gridIdx = GRID_WIDTH * _gridY + _gridX;
			var _mark = global.currentLevelMarks[_gridIdx], _trace = global.currentLevelTraces[_gridIdx];
			if (_trace > 0) tilemap_set_at_pixel(groundMap, 2, _x, _y);
			else if (_mark > 0) tilemap_set_at_pixel(groundMap, 1, _x, _y);
		}
	}
	layer_set_visible(layer_get_id("GroundTiles"), global.showTrace);
}

// Update music
updateMusic();

// Hide cursor
window_set_cursor(cr_none);