// Escape text
if (instance_exists(oSpawnPortal))
{
	draw_set_alpha(clamp(oSpawnPortal.image_alpha * 2, 0, 1));
	draw_text(oSpawnPortal.x, oSpawnPortal.y - 32, "escape");
	draw_set_alpha(1);
}