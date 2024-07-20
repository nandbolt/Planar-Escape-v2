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
	
	/// @func	click();
	static click = function()
	{
		setFocus();
		audio_play_sound(sfxButtonReleased, 10, false);
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
		
		// Background
		draw_sprite_stretched(_sprBack, 0, x, y, width * _scale, height * _scale);
		
		// Text
		draw_set_color(_textColor);
		draw_text_transformed(x + width * 0.5 - string_width(name) * 0.5, y + height * 0.5, name, _scale, _scale, 0);
		draw_set_color(c_white);
	}
}