/// @func	Gadget();
function Gadget() constructor
{
	owner = other;
	type = GadgetType.NONE;
	
	/// @func	usePressed();
	static usePressed = function(){}
	
	/// @func	useReleased();
	static useReleased = function(){}
	
	/// @func	updateActions();
	static updateActions = function()
	{
		if (keyboard_check_pressed(vk_shift)) usePressed();
		else if (keyboard_check_released(vk_shift)) useReleased();
	}
	
	/// @func	update();
	static update = function()
	{
		updateActions();
	}
	
	/// @func	draw();
	static draw = function(){}
	
	/// @func	cleanup();
	static cleanup = function(){}
}