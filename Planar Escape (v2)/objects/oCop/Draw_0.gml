// Gadget
if (!is_undefined(gadget)) gadget.draw();

// Self
draw_self();
if (mentalState == CopState.PATROL) draw_sprite_ext(sSightline, viewDashImgIdx, x, y, viewDistance * 0.125, 1, facingAngle, c_white, 0.5);
else if (mentalState == CopState.ALERTED) draw_sprite(sAlerted, 0, x, alertY);