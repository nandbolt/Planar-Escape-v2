// Self + laser
draw_self();
var _x = x + lengthdir_x(5, image_angle), _y = y + lengthdir_y(5, image_angle);
draw_sprite_ext(sprLaser, 0, laserStart.x, laserStart.y, laserLength, 1, image_angle, c_white, 0.9);