// Check power
var _tile = tilemap_get_at_pixel(wireMap, x, y);
if (_tile > 17 && _tile < 36) updateRod(Power.RED);
else if (_tile > 35) updateRod(Power.GREEN);
else updateRod(Power.OFF);