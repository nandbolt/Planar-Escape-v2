/// @func	GuiTextfield({id} controller, {string} name, {real} x, {real} y, {string} value, {string} placeholder, {func} onEnter);
function GuiTextfield(_controller, _name, _x, _y, _value, _placeholder, _onEnter=function(){}) : GuiElement(_controller) constructor
{
	// Values
	name = _name;
	x = _x;
	y = _y;
	onEnter = _onEnter;
	backSprite = sBorder2;
	backHoverSprite = sBorder1;
	textColor = c_black;
	textHoverColor = c_white;
	textScale = 1;
	placeholder = _placeholder;
	drawValue = "";
	
	/// @func	set({string} text);
	static set = function(_text)
	{
		// Return if value hasn't changed
		if (value == _text) return;
		
		// Set value
		value = _text;
		
		// Keep deleting the first letter of the string until it fits in the textfield box
		draw_set_font(fDefault);
		drawValue = value;
		while (string_width(drawValue) > width - 2 * padding)
		{
			drawValue = string_delete(drawValue, 1, 1);
		}
	}
	
	/// @func	click();
	static click = function()
	{
		setFocus();
		audio_play_sound(sfxGuiButtonPressed, 10, false);
		keyboard_string = get();
	}
	
	/// @func	listen();
	static listen = function()
	{
		// Set value to whatever is typed
		set(keyboard_string);
		
		// Remove focus on enter or mouse clicked outside of element
		if (keyboard_check_pressed(vk_enter))
		{
			onEnter();
			audio_play_sound(sfxGuiButtonPressed, 10, false);
			removeFocus();
		}
		else if (mouse_check_button_pressed(mb_left) && !point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), x, y, x + width, y + height))
		{
			onEnter();
			removeFocus();
		}
	}
	
	/// @func	draw();
	static draw = function()
	{
		// Focus
		var _inFocus = hasFocus();
		
		// Set hover
		var _sprBack = backSprite, _textColor = textColor, _scale = textScale + hoverCounter / maxHoverCounter * 0.1;
		if (hovering)
		{
			_sprBack = backHoverSprite;
			_textColor = textHoverColor;
		}
		
		// Alpha
		var _alpha = 1;
		if (!_inFocus) _alpha = 0.5;
		draw_set_alpha(_alpha);
		
		// Background
		draw_sprite_stretched(_sprBack, 0, x, y, width * _scale, height * _scale);
		
		// Flashing
		var _ticker = (_inFocus && floor((current_time * 0.002) mod 2) == 0) ? "|" : "";
		
		// Text
		draw_set_color(_textColor);
		if (string_length(get()) < 1)
		{
			// Placeholder text
			draw_set_alpha(0.5);
			draw_text_transformed(x + padding, y + height * 0.5, placeholder, _scale, _scale, 0);
		}
		draw_text_transformed(x + padding, y + height * 0.5, drawValue + _ticker, _scale, _scale, 0);
		draw_set_color(c_white);
		draw_set_alpha(1);
	}
	
	// Set value
	set(_value);
}