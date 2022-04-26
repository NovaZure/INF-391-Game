
var dist = distance_to_object(player);
speed = max(0.75, dist / 50);
direction = point_direction(x, y, player.x, player.y) + 40;
firingdelay--;

if (dist < 40) {
	speed = 0.5;
}

/*
if collision_ellipse(x-48, y-20, x+48, y+20, oEnemy1, 1, 1) {
	touching = instance_nearest(x, y, oEnemy1);
	
	dir = point_direction(x, y, touching.x, touching.y);
	
	//If the close enemy is ahead of the current enemy
	if (abs(direction - dir) < 180) {
		speed -= 0.3;
	}
	else {
		speed += 0.3;
	}
}
*/

//Occasionally shoot projectiles
if (firingdelay <= 0) {
	
	for (var i = 0; i < 8; i++) {
		with (instance_create_layer(x,y, "Instances", oBullet)) {
		x = other.x;
		y = other.y;
		
		//image_index = 
		//var dir = point_direction(other.x, other.y, oPlayer.x, oPlayer.y)
		//image_angle = dir;
		
		direction = 45*i;
		initialSpeed = 1.5;
		}
	}
	
	firingdelay = 180;
}