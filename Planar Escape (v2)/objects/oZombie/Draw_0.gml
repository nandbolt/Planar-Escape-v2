// Self + sight
draw_self();
if (mentalState == ZombieState.WANDER) sight.draw();
else if (mentalState == ZombieState.ALERTED) draw_sprite(sAlerted, 0, x, alertY);