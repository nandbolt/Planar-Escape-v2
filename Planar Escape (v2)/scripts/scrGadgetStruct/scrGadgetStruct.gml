/// @func	Gadget();
function Gadget() constructor
{
	owner = other;
	type = GadgetType.NONE;
	
	// Inputs
	useHeld = false;
	
	/// @func	use();
	static use = function(){}
	
	/// @func	usePressed();
	static usePressed = function(){}
	
	/// @func	useReleased();
	static useReleased = function(){}
	
	/// @func	actionUse();
	static actionUse = function(){ return keyboard_check(vk_shift); }
	
	/// @func	updateActions();
	static updateActions = function()
	{
		if (actionUse())
		{
			if (!useHeld) usePressed();
			use();
			useHeld = true;
		}
		else
		{
			if (useHeld) useReleased();
			useHeld = false;
		}
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