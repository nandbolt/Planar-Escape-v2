/// @func	drawTextWithBorder({real} x, {real} y, {string} text, {sprite} border, {real} padding);
function drawTextWithBorder(_x, _y, _text, _border, _padding=2)
{
	var _borderWidth = string_width(_text) + _padding * 2, _borderHeight = 12 + _padding * 2;
	draw_sprite_stretched(_border, 0, _x - _borderWidth * 0.5, _y-_borderHeight * 0.5-_padding, _borderWidth, _borderHeight);
	draw_text(_x, _y, _text);
}