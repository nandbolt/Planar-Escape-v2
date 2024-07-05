/// @func	GuiButton({id} controller);
function GuiButton(_controller, _name, _x, _y, _onClick=function(){}) : GuiElement(_controller) constructor
{
	// Values
	name = _name;
	x = _x;
	y = _y;
	onClick = _onClick;
	backSprite = sWhiteBlock;
	textColor = c_black;
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
		// Background
		draw_sprite_stretched(backSprite, 0, x, y, width, height);
		
		// Text
		draw_set_color(textColor);
		draw_text_transformed(x + width * 0.5 - string_width(name) * 0.5, y + height * 0.5, name, textScale, textScale, 0);
		draw_set_color(c_white);
	}
}