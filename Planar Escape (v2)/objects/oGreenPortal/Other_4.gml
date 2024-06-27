// Set other portal
otherPortal = instance_nearest(x, y, oBluePortal);
if (instance_exists(otherPortal)) otherPortal.otherPortal = self;