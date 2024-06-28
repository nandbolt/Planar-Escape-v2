// If not pressed
if (image_index == 0)
{
	// Press button if touching a solid
	if (place_meeting(x, y, oSolid)) pressButton();
}
else
{
	// Release button if not touching a solid
	if (!place_meeting(x, y, oSolid)) releaseButton();
}