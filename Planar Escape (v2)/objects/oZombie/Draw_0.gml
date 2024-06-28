// Self + sight
draw_self();
if (mentalState == ZombieState.WANDER) draw_sprite_ext(sZombieView, viewDashImgIdx, x, y, viewDistance * 0.125, 1, facingAngle, c_white, 0.5);
else if (mentalState == ZombieState.ALERTED) draw_sprite(sAlerted, 0, x, alertY);