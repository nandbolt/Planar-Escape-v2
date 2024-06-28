// Gadget
if (!is_undefined(gadget)) gadget.draw();

// Self
draw_self();
if (mentalState == CopState.PATROL)
{
	sight1.draw();
	sight2.draw();
}
else if (mentalState == CopState.ALERTED) draw_sprite(sAlerted, 0, x, alertY);