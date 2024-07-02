// Box engine
if (instance_exists(be_oBoxEngine))
{
	boxCount = array_length(be_oBoxEngine.boxes);
	contacts = be_oBoxEngine.resolver.getIterationsUsed();
	maxContacts = max(maxContacts, contacts);
	dt = delta_time / 1000000;
	maxDt = max(maxDt, dt);
	dtClamped = clamp(dt, 0, 0.02175);
}

// Player
if (instance_exists(oPlayer))
{
	currSpeed = oPlayer.box.velocity.magnitude();
	maxSpeed = max(maxSpeed, currSpeed);
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);
var _x = 8, _y = 8 + 16 * 2;
draw_set_color(c_lime);
draw_text_transformed(_x, _y, "instances: " + string(instance_count), 0.5, 0.5, 0);
_y += 8;
draw_text_transformed(_x, _y, "boxes: " + string(boxCount), 0.5, 0.5, 0);
_y += 8;
draw_text_transformed(_x, _y, "contacts: " + string(maxContacts), 0.5, 0.5, 0);
_y += 8;
draw_text_transformed(_x, _y, "contacts: " + string(contacts), 0.5, 0.5, 0);
_y += 8;
draw_text_transformed(_x, _y, "max speed: " + string(maxSpeed), 0.5, 0.5, 0);
_y += 8;
draw_text_transformed(_x, _y, "speed: " + string(currSpeed), 0.5, 0.5, 0);
_y += 8;
draw_text_transformed(_x, _y, "maxdt: " + string(maxDt), 0.5, 0.5, 0);
_y += 8;
draw_text_transformed(_x, _y, "dt: " + string(dt), 0.5, 0.5, 0);
_y += 8;
draw_text_transformed(_x, _y, "dt (clamped): " + string(dtClamped), 0.5, 0.5, 0);
draw_set_color(c_white);