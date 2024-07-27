// Inherit the parent event
event_inherited();

// Movement
moveSpeed = 2000;

// Sightline
sight = new Sightline([oPlayer, oCop, oCitizen, oRobot], 108, 0);

#region Functions

/// @func	onRotate();
onRotate = function(){ sight.currentMaxViewDistance = 0; }

#endregion