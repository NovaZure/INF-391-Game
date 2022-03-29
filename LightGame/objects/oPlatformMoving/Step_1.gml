/// @description Insert description here
// You can write your code in this editor

//The target is set to the end point or beginning point.
var _targetX = endX, _targetY = endY;
if (goingToStart) {
	_targetX = startX;
	_targetY = startY;
}

//Move the platform towards the target at speed
moveX = sign(_targetX - x) * currentSpeed;
moveY = sign(_targetY - y) * currentSpeed;