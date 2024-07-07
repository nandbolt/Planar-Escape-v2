// Particle systems
partSystem = part_system_create();
partSystemLow = part_system_create();

#region Functions

/// @func	pauseParticles();
pauseParticles = function()
{
	part_system_automatic_update(partSystem, false);
	part_system_automatic_update(partSystemLow, false);
}

/// @func	resumeParticles();
resumeParticles = function()
{
	part_system_automatic_update(partSystem, true);
	part_system_automatic_update(partSystemLow, true);
}

#endregion

// Dust
partTypeDust = part_type_create();
part_type_sprite(partTypeDust, sSquareCenter, false, false, false);
part_type_speed(partTypeDust, 0.2, 0.2, -0.005, 0);
part_type_direction(partTypeDust, 0, 359, 0, 0);
part_type_alpha2(partTypeDust, 1, 0);
part_type_life(partTypeDust, 45, 45);

// Pulse
partTypePulse = part_type_create();
part_type_sprite(partTypePulse, sCircleCenter, false, false, false);
part_type_alpha2(partTypePulse, 1, 0);
part_type_size(partTypePulse, 0, 0, 1/30, 0);
part_type_life(partTypePulse, 60, 60);

// Afterimage
partTypeAfterImage = part_type_create();
part_type_sprite(partTypeAfterImage, sActorShape, false, false, false);
part_type_alpha2(partTypeAfterImage, 1, 0);
part_type_life(partTypeAfterImage, 20, 20);

// Star dust
partTypeStardustN = part_type_create();
partTypeStardustSW = part_type_create();
partTypeStardustSE = part_type_create();
part_type_sprite(partTypeStardustN, sStardust, true, true, false);
part_type_sprite(partTypeStardustSW, sStardust, true, true, false);
part_type_sprite(partTypeStardustSE, sStardust, true, true, false);
part_type_speed(partTypeStardustN, 0.4, 0.4, 0, 0);
part_type_speed(partTypeStardustSW, 0.4, 0.4, 0, 0);
part_type_speed(partTypeStardustSE, 0.4, 0.4, 0, 0);
part_type_direction(partTypeStardustN, 90, 90, 5, 0);
part_type_direction(partTypeStardustSW, 210, 210, 5, 0);
part_type_direction(partTypeStardustSE, 330, 330, 5, 0);
part_type_alpha2(partTypeStardustN, 1, 0);
part_type_alpha2(partTypeStardustSW, 1, 0);
part_type_alpha2(partTypeStardustSE, 1, 0);
part_type_life(partTypeStardustN, 30, 30);
part_type_life(partTypeStardustSW, 30, 30);
part_type_life(partTypeStardustSE, 30, 30);