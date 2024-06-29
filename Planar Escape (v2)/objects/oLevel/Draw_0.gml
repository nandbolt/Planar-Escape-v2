// Escape text
if (instance_exists(oSpawnPortal))
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_alpha(clamp(oSpawnPortal.image_alpha * 2, 0, 1));
	draw_text_transformed(oSpawnPortal.x, oSpawnPortal.y - 60, "escape", worldTextScale, worldTextScale, 0);
	draw_set_alpha(1);
}