// If can teleport
if (other.alarm[11] == -1) teleport(other);
// Else prevent from teleporting unless it stops colliding
else other.alarm[11] = 2;