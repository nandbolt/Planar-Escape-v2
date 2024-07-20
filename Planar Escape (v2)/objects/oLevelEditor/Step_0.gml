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
x = clamp(x + moveInput.x * TILE_SIZE, TILE_SIZE + HALF_TILE_SIZE, room_width - TILE_SIZE - HALF_TILE_SIZE);
y = clamp(y + moveInput.y * TILE_SIZE, TILE_SIZE + HALF_TILE_SIZE, room_height - TILE_SIZE - HALF_TILE_SIZE);