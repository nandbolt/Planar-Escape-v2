// Increment idx
splashIdx++;

// Update text
if (splashIdx == 3) text = "made with GameMaker";

// Go to next room or reset alarm
if (splashIdx > lastSplashIdx) room_goto_next();
else if (splashIdx == 1 || splashIdx == 4) alarm[0] = showTime;
else alarm[0] = fadeTime;