/// @func	GuiElement({Struct.GuiController} controller);
function GuiElement(_controller) constructor
{
	// Controller
	controller = _controller;
	
	// Value
	value = undefined;
	name = undefined;
	locked = false;
	
	// Dimensions
	static width = 150;
	static height = 32;
	static padding = 16;
	
	// Hover
	hovering = false;
	hoverCounter = 0;
	static maxHoverCounter = 10;
	
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
		// If not already clicking something
		if (controller.canClick)
		{
			// If hovering over element
			if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), x, y, x + width, y + height))
			{
				// Set hover
				if (!hovering) audio_play_sound(sfxGuiButtonHover, 10, false);
				hovering = true;
				hoverCounter = clamp(hoverCounter + 1, 0, maxHoverCounter);
				
				// If clicked
				if (mouse_check_button_pressed(mb_left))
				{
					// If not locked
					if (!locked)
					{
						// Click element
						controller.canClick = false;
						click();
					}
					else audio_play_sound(sfxGuiButtonLockedPressed, 10, false);
				}
			}
			else
			{
				// Set hover
				hovering = false;
				hoverCounter = clamp(hoverCounter - 1, 0, maxHoverCounter);
			}
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