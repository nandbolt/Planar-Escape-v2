/// @func	GuiElement({Struct.GuiController} controller);
function GuiElement(_controller) constructor
{
	// Controller
	controller = _controller;
	
	// Value
	value = undefined;
	name = undefined;
	
	// Dimensions
	static width = 150;
	static height = 32;
	static padding = 16;
	
	// Add to controller's list of gui elements
	controller.addElement(self);
	
	/// @func	cleanup();
	static cleanup = function(){}
	
	/// @func	hasFocus();
	static hasFocus = function(){ return controller.elementInFocus == self; }
	
	/// @func	setFocus();
	static setFocus = function()
	{
		controller.elementInFocus = self;
		controller.clickedAnyElement = true;
	}
	
	/// @func	removeFocus();
	static removeFocus = function(){ controller.elementInFocus = undefined; }
	
	/// @func	get();
	static get = function(){ return value; }
	
	/// @func	set({real} value);
	static set = function(_value){ value = _value; }
	
	/// @func	update();
	static update = function()
	{
		// Check click + not already clicking something + clicked this element
		if (mouse_check_button_pressed(mb_left) && controller.canClick &&
			point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), x, y, x + width, y + height))
		{
			// Click element
			controller.canClick = false;
			click();
		}
		
		// Listen for input if element has focus
		if (hasFocus()) listen();
	}
	
	/// @func	click();
	static click = function(){}
	
	/// @func	listen();
	static listen = function(){}
	
	/// @func	draw();
	static draw = function(){}
}