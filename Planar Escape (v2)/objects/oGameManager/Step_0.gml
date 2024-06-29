// Debugger
if (keyboard_check_pressed(vk_f9))
{
	if (instance_exists(oDebugger)) instance_destroy(oDebugger);
	else instance_create_layer(0, 0, "Instances", oDebugger);
}