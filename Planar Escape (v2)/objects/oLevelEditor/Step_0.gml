// Pause
if (keyboard_check_pressed(vk_escape))
{
	// Destroy any previous level parameter menus if they exist
	if (instance_exists(oLevelParamMenu))
	{
		instance_destroy(oLevelParamMenu);
		updateMusic();
	}
	
	// Toggle pause
	paused = !paused;
	
	// Create a new level param menu if paused
	if (paused) instance_create_layer(0, 0, "Instances", oLevelParamMenu);
}

// Exit if paused
if (paused) exit;

// Update move input
if (keyboard_check_pressed(ord("D")))
{
	moveInput.x = 1;
	alarm[0] = moveHoldDelay;
}
else if (keyboard_check_pressed(ord("A")))
{
	moveInput.x = -1;
	alarm[0] = moveHoldDelay;
}
else if (keyboard_check_pressed(ord("S")))
{
	moveInput.y = 1;
	alarm[0] = moveHoldDelay;
}
else if (keyboard_check_pressed(ord("W")))
{
	moveInput.y = -1;
	alarm[0] = moveHoldDelay;
}
else if (alarm[0] == -1)
{
	moveInput.x = keyboard_check(ord("D")) - keyboard_check(ord("A"));
	moveInput.y = keyboard_check(ord("S")) - keyboard_check(ord("W"));
}
else
{
	moveInput.x = 0;
	moveInput.y = 0;
}

// Move level editor
moveCursor(moveInput.x * TILE_SIZE, moveInput.y * TILE_SIZE);

// Update cursor
if (keyboard_check_pressed(ord("Q"))) changeCursor(cursorIdx-1);
else if (keyboard_check_pressed(ord("E"))) changeCursor(cursorIdx+1);
else if (keyboard_check_pressed(ord("R"))) cursorRotation = (cursorRotation + 45) mod 360;

// Place object
if (keyboard_check_pressed(vk_space)) placeCursorObject();