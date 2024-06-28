// Self
draw_self();
if (mentalState == CitizenState.WANDER) sight.draw();
else if (mentalState == CitizenState.ALERTED) draw_sprite(sAlerted, 0, x, alertY);