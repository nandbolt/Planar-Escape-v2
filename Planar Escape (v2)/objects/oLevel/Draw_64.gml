// Fade
if (alarm[1] != -1)
{
	var _alpha = alarm[1] / 60;
	if (levelComplete || levelFailed) _alpha = 1 - _alpha;
	draw_set_alpha(_alpha);
	draw_set_color(c_black);
	draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
	draw_set_alpha(1);
	draw_set_color(c_white);
}

// Level messages
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
if (levelComplete)
{
	var _x = display_get_gui_width() * 0.5, _y = display_get_gui_height() * 0.5;
	draw_text(_x, _y, "level complete");
	if (levelEndMenus > 0)
	{
		_y += 32;
		if (fastestTime <= 0 || levelTime < fastestTime) draw_set_color(c_yellow);
		draw_text(_x, _y, "time: " + string(levelTime));
		draw_set_color(c_white);
		if (levelEndMenus > 1)
		{
			_y += 16;
			if (starsCollected == totalStars) draw_set_color(c_yellow);
			draw_text(_x, _y, "stars: " + string(starsCollected) + "/" + string(totalStars));
			draw_set_color(c_white);
			if (levelEndMenus > 2)
			{
				_y += 32;
				draw_text(_x, _y, "next level (space), retry (r)");
			}
		}
	}
}
else if (levelFailed)
{
	var _x = display_get_gui_width() * 0.5, _y = display_get_gui_height() * 0.5;
	draw_text(_x, _y, "level failed");
	if (levelEndMenus > 0)
	{
		_y += 32;
		draw_text(_x, _y, "retry (r)");
	}
}
else
{
	// Time + stars
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	var _x = 8, _y = 8;
	draw_text(_x, _y, "time: " + string(levelTime));
	_y += 16;
	if (starsCollected == totalStars) draw_set_color(c_yellow);
	draw_text(_x, _y, "stars: " + string(starsCollected));
	draw_set_color(c_white);
}