// Pause
if (keyboard_check_pressed(vk_escape) || gamepad_button_check_pressed(0, gp_start))
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
if (keyboard_check_pressed(ord("D")) || gamepad_button_check_pressed(0, gp_padr))
{
	moveInput.x = 1;
	alarm[0] = moveHoldDelay;
}
else if (keyboard_check_pressed(ord("A")) || gamepad_button_check_pressed(0, gp_padl))
{
	moveInput.x = -1;
	alarm[0] = moveHoldDelay;
}
else if (keyboard_check_pressed(ord("S")) || gamepad_button_check_pressed(0, gp_padd))
{
	moveInput.y = 1;
	alarm[0] = moveHoldDelay;
}
else if (keyboard_check_pressed(ord("W")) || gamepad_button_check_pressed(0, gp_padu))
{
	moveInput.y = -1;
	alarm[0] = moveHoldDelay;
}
else if (alarm[0] == -1)
{
	moveInput.x = (keyboard_check(ord("D")) || gamepad_button_check(0, gp_padr)) - (keyboard_check(ord("A")) || gamepad_button_check(0, gp_padl));
	moveInput.y = (keyboard_check(ord("S")) || gamepad_button_check(0, gp_padd)) - (keyboard_check(ord("W")) || gamepad_button_check(0, gp_padu));
}
else
{
	moveInput.x = 0;
	moveInput.y = 0;
}

// Move level editor
moveCursor(moveInput.x * TILE_SIZE, moveInput.y * TILE_SIZE);

// Update cursor
if (keyboard_check_pressed(ord("Q")) || gamepad_button_check_pressed(0, gp_shoulderl)) changeCursor(cursorIdx-1);
else if (keyboard_check_pressed(ord("E")) || gamepad_button_check_pressed(0, gp_shoulderr)) changeCursor(cursorIdx+1);
else if (keyboard_check_pressed(ord("R")) || gamepad_button_check_pressed(0, gp_face4)) cursorRotation = (cursorRotation + 45) mod 360;
else if (keyboard_check_pressed(ord("1"))) changeCursor(LevelObject.NONE);
else if (keyboard_check_pressed(ord("2"))) changeCursor(LevelObject.WIRE);
else if (keyboard_check_pressed(ord("3"))) changeCursor(LevelObject.SOLID_WALL);
else if (keyboard_check_pressed(ord("4"))) changeCursor(LevelObject.WHITE_BLOCK);
else if (keyboard_check_pressed(ord("5"))) changeCursor(LevelObject.STAR);
else if (keyboard_check_pressed(ord("6"))) changeCursor(LevelObject.POWER_BLOCK);
else if (keyboard_check_pressed(ord("7"))) changeCursor(LevelObject.RED_LASER_BLOCK);
else if (keyboard_check_pressed(ord("8"))) changeCursor(LevelObject.WHITE_DOOR);
else if (keyboard_check_pressed(ord("9"))) changeCursor(LevelObject.GADGET_MACHINE_GRAPPLE);
else if (keyboard_check_pressed(ord("0"))) changeCursor(LevelObject.ROBOT);

// Place object
if (cursorIdx != LevelObject.WIRE)
{
	if (keyboard_check(vk_space) || gamepad_button_check(0, gp_face1)) placeCursorObject();
}
else if (keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(0, gp_face1)) placeCursorObject();

// Hide tiles
if (keyboard_check_pressed(ord("L"))) layer_set_visible(worldLayer, !layer_get_visible(worldLayer));