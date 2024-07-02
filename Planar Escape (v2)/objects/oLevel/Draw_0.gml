// If spawn portal exists
if (instance_exists(oSpawnPortal))
{
	// Escape text
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_alpha(clamp(oSpawnPortal.image_alpha * 2, 0, 1));
	draw_text_transformed(oSpawnPortal.x, oSpawnPortal.y - 60, levelName, worldTextScale, worldTextScale, 0);
	draw_set_alpha(1);
}