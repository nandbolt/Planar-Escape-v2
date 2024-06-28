// Inherit the parent event
event_inherited();

// Movement
moveSpeed = 4000;

// Think
thinkFreq = 45;

// View
scanPhase = 0;
scanSpeed = 0.05;
scanRange = 10;
sight = new Sightline([oPlayer, oZombie, oCop, oCitizen, oRobot], 144, 0);

#region Functions

/// @func	onRotate();
onRotate = function(){ sight.currentMaxViewDistance = 0; }

#endregion

// Set think alarm
alarm[0] = thinkFreq;