// Update time
if (!levelComplete && !levelFailed) levelTime = (current_time - startTime) * 0.001;

// Restart
if (keyboard_check_pressed(ord("R"))) room_restart();