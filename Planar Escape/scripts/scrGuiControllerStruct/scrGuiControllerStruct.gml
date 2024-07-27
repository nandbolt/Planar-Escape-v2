/// @func	GuiController();
function GuiController() constructor
{
	// Elements
	elements = [];
	
	// Focus
	elementInFocus = undefined;
	canClick = true;
	clickedAnyElement = false;
	
	/// @func	cleanup();
	static cleanup = function()
	{
		// Loop through elements (reverse)
		for (var _i = array_length(elements) - 1; _i >= 0; _i--)
		{
			// Cleanup element
			if (is_struct(elements[_i]))
			{
				elements[_i].cleanup();
				delete elements[_i];
			}
		}
		elements = -1;
	}
	
	/// @func	addElement({Struct.GuiElement} element);
	static addElement = function(_element){ array_push(elements, _element); }
	
	/// @func	update();
	static update = function()
	{
		// Reset click
		clickedAnyElement = false;
		canClick = true;
		
		// Loop through elements
		for (var _i = 0; _i < array_length(elements); _i++)
		{
			// Update element
			elements[_i].update();
		}
		
		// Remove focus if no click
		if (!clickedAnyElement && !canClick) elementInFocus = undefined;
	}
	
	/// @func	draw();
	static draw = function()
	{
		// Set params
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		
		// Loop through elements (reverse)
		for (var _i = array_length(elements) - 1; _i >= 0; _i--)
		{
			// Draw element
			elements[_i].draw();
		}
	}
}