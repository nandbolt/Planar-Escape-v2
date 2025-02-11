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
	var _x = display_get_gui_width() * 0.5, _y = 12;
	drawTextWithBorder(_x, _y, "level complete", sBorder3);
	if (levelEndMenus > 0)
	{
		_y = display_get_gui_height() * 0.5 - 16 * 3;
		if (fastestTime <= 0 || levelTime < fastestTime) draw_set_color(c_yellow);
		else if (levelTime < secondFastestTime) draw_set_color(c_ltgray);
		else if (levelTime < thirdFastestTime) draw_set_color(#CD7F32);
		drawTextWithBorder(_x, _y, "time:" + string(levelTime), sBorder3);
		draw_set_color(c_white);
		if (levelEndMenus > 1)
		{
			_y += 16;
			if (mode == Mode.ESCAPE)
			{
				// Stars
				if (starsCollected == totalStars) draw_set_color(c_yellow);
				drawTextWithBorder(_x, _y, "stars:" + string(starsCollected) + "/" + string(totalStars), sBorder3);
				draw_set_color(c_white);
				
				// Stardisks
				_y += 16;
				if (stardisksCollected == totalStardisks) draw_set_color(c_yellow);
				drawTextWithBorder(_x, _y, "stardisks:" + string(stardisksCollected) + "/" + string(totalStardisks), sBorder3);
				draw_set_color(c_white);
			}
			else if (mode == Mode.MARK)
			{
				// Marks
				drawTextWithBorder(_x, _y, "marks:" + string(tilesTraced), sBorder3);
			}
			else if (mode == Mode.TRACE)
			{
				// Traces
				drawTextWithBorder(_x, _y, "traces:" + string(tilesTraced), sBorder3);
			}
			
			// Score
			_y += 16;
			if (runScore > highestScore) draw_set_color(c_yellow);
			else if (runScore > secondHighestScore) draw_set_color(c_ltgray);
			else if (runScore > thirdHighestScore) draw_set_color(#CD7F32);
			drawTextWithBorder(_x, _y, "score:" + string(runScore), sBorder3);
			draw_set_color(c_white);
		}
	}
}
else if (levelFailed)
{
	var _x = display_get_gui_width() * 0.5, _y = display_get_gui_height() * 0.5;
	drawTextWithBorder(_x, _y, "level failed", sBorder3);
}
else
{
	// Mode
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	var _x = 8, _y = 8;
	draw_text(_x, _y, modeName);
	_y += 16;
	draw_text(_x, _y, entitySpeedName);
	_y += 16;
	starAnimCounter += starAnimSpeed;
	var _imageIdx = floor(starAnimCounter) mod 5;
	draw_sprite_stretched(sClock, _imageIdx, _x, _y, 14, 14);
	if (fastestTime <= 0 || levelTime < fastestTime) draw_set_color(c_yellow);
	else if (levelTime < secondFastestTime) draw_set_color(c_ltgray);
	else if (levelTime < thirdFastestTime) draw_set_color(#CD7F32);
	draw_text(_x + 16, _y, "" + string(levelTime));
	draw_set_color(c_white);
	_y += 16;
	if (mode == Mode.ESCAPE)
	{
		draw_sprite_stretched(sStar, _imageIdx, _x, _y, 14, 14);
		if (starsCollected == totalStars) draw_set_color(c_yellow);
		draw_text(_x + 16, _y, string(starsCollected));
		draw_set_color(c_white);
	}
	else if (mode == Mode.MARK || mode == Mode.TRACE)
	{
		draw_sprite_stretched(sprTrace, _imageIdx, _x, _y, 14, 14);
		draw_text(_x + 16, _y, string(tilesTraced));
	}
	
	// Level name
	draw_set_halign(fa_right);
	_y = 8;
	draw_text(display_get_gui_width() - 8, _y, levelName);
	
	// Controls
	draw_set_halign(fa_left);
	draw_set_valign(fa_bottom);
	_y = display_get_gui_height() - 8;
	draw_text_color(_x, _y, "move:AWSD, dash:space, use:J, pause:esc, hide traces:T", c_white, c_white, c_white, c_white, 0.25);
	
	// Entity
	_x = display_get_gui_width() - 8;
	_y = 32;
	var _y2 = display_get_gui_height() - 32;
	var _amount = clamp(room_height - oEntity.y, 0, room_height) / room_height * 100;
	draw_healthbar(_x - 1, _y, _x + 4, _y2, _amount, c_gray, c_black, c_black, 3, true, false);
	var _sprPlayer = sPlayer, _subimage = 0;
	if (instance_exists(oPlayer))
	{
		playerY = oPlayer.y;
		_sprPlayer = sPlayer;
		_subimage = 2;
	}
	else if (levelFailed) _sprPlayer = sNone;
	draw_sprite(_sprPlayer, 2, _x + 2, _y2 - clamp(room_height - playerY, 0, room_height ) / room_height * (_y2 - _y));
}