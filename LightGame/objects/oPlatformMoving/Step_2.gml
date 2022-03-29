/// @description Insert description here
// You can write your code in this editor

x += moveX;
y += moveY;

if (goingToStart && point_distance(x, y, startX, startY) < currentSpeed) {
	goingToStart = false;
	currentSpeed = 0;
	alarm[0] = waitTime;
}
if (!goingToStart && point_distance(x, y, endX, endY) < currentSpeed) {
	goingToStart = true;
	currentSpeed = 0;
	alarm[0] = waitTime;
}
