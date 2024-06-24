// Inherit the parent event
event_inherited();

// States
activated = false;

// Explosion
maxExplosionForce = 500000;
explosionRadius = 48;
explosionRadius = 128;
maxExplosionForceRadius = 12;
explosionParticleDensityFactor = 1/32;

// Detection hitbox
detectionBox = instance_create_layer(x, y, "Instances", oHitbox);
with (detectionBox)
{
	image_xscale = (other.bbox_right - other.bbox_left + 2) * 0.5;
	image_yscale = (other.bbox_bottom - other.bbox_top + 2) * 0.5;
}