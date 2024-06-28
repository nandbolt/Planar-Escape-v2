// Fade
if (!spawned) image_alpha = 1 - clamp(alarm[0] / fadeInSpeed, 0, 1);
else image_alpha = clamp(alarm[0] / fadeOutSpeed, 0, 1);