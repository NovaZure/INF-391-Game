/// @description Insert description here
// You can write your code in this editor

var xDirection = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var jump = keyboard_check_pressed(vk_space); //True on the frame that space has been pressed, false otherwise
var onTheGround = place_meeting(x, y + 1, oWall) || place_meeting(x, y + 1, oPlatformMoving);


if (xDirection != 0) image_xscale = xDirection;

xSpeed = xDirection * spd;
ySpeed += 0.5;

if (onTheGround) {

	//if (xDirection != 0) { sprite_index = sPlayerRun_strip7; } 
	//else { sprite_index = sPlayerIdle_strip4; }

	if (jump) {
		ySpeed = -8;
	}

} else {
	//sprite_index = sPlayerJump;
}


//Moving Platform Collisions -----
var _movingPlatform = instance_place(x, y + max(1,ySpeed), oPlatformMoving);
//If there is a platform below the player, and the bottom of the player's hitbox is above the platform:
if (_movingPlatform && bbox_bottom <= _movingPlatform.bbox_top) {
	if (ySpeed > 0) {
		while (!place_meeting(x, y + sign(ySpeed), oPlatformMoving)) {
			y += sign(ySpeed);
		}
		
		ySpeed = 0;
	}
	
	x += _movingPlatform.moveX;
	y += _movingPlatform.moveY;
}

//Wall Collisions -----
//If the player is about to run into a wall
if (place_meeting(x + xSpeed, y, oWall)) { 
	while (!place_meeting(x + sign(xSpeed), y, oWall)) {
		x += sign(xSpeed);
	}
	xSpeed = 0; 
}



//While the player is about to fall onto a wall
if (place_meeting(x, y + ySpeed, oWall)) {
	//Pixel perfect collision
	while (!place_meeting(x, y + sign(ySpeed), oWall)) {
		y += sign(ySpeed);
	}
	ySpeed = 0; 
}

x += xSpeed;
y += ySpeed;