/// @desc Event
var _dt = delta_time / 1000000;
if (_dt < 0.1) runPhysics(clamp(_dt, 0, 0.02175));