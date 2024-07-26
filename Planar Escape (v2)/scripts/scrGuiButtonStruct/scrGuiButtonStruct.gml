/// @func	GuiButton({id} controller);
function GuiButton(_controller, _name, _x, _y, _onClick=function(){}) : GuiElement(_controller) constructor
{
	// Values
	name = _name;
	x = _x;
	y = _y;
	onClick = _onClick;
	backSprite = sBorder2;
	backHoverSprite = sBorder1;
	textColor = c_black;
	textHoverColor = c_white;
	textScale = 1;
	hoverText = "";
	
	/// @func	click();
	static click = function()
	{
		setFocus();
		audio_play_sound(sfxGuiButtonPressed, 10, false);
		onClick();
	}
	
	/// @func	draw();
	static draw = function()
	{
		// Set hover
		var _sprBack = backSprite, _textColor = textColor, _scale = textScale + hoverCounter / maxHoverCounter * 0.1;
		if (hovering)
		{
			_sprBack = backHoverSprite;
			_textColor = textHoverColor;
		}
		
		// Set lock
		var _alpha = 1;
		if (locked) _alpha = 0.5;
		
		// Alpha
		draw_set_alpha(_alpha);
		
		// Background
		draw_sprite_stretched(_sprBack, 0, x, y, width * _scale, height * _scale);
		
		// Text
		draw_set_color(_textColor);
		draw_text_transformed(x + width * 0.5 - string_width(name) * 0.5, y + height * 0.5, name, _scale, _scale, 0);
		if (hovering && hoverText != "")
		{
			// Hover background + text
			draw_set_alpha(1);
			if (locked) draw_set_color(c_lime);
			else draw_set_color(c_yellow);
			_scale *= 0.5;
			draw_sprite_stretched(backHoverSprite, 0, x, y + 28, string_width(hoverText) * _scale + 8, height * _scale);
			draw_text_transformed(x + 4, y + height * 0.5 + 24, hoverText, _scale, _scale, 0);
		}
		draw_set_color(c_white);
		draw_set_alpha(1);
	}
}