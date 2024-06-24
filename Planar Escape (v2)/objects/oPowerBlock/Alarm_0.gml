/// @desc Power Timer
powered = false;
image_index = 0;

// Wires
var _tile = tilemap_get_at_pixel(wireMap, x, y);
if (_tile > 0 && _tile < 18) tilemap_set_at_pixel(wireMap, _tile + 18, x, y);