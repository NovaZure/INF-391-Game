/// @description Generic Mob Object
player = instance_nearest(x, y, oPlayer);
//Move speed
spd = 1;
xSpeed = 0; //Current speed in X direction
ySpeed = 0; //Current speed in Y direction
facing = 1; //The direction the mob is facing. 1 = Right, -1 = Left
firingdelay = 0;
maxhp = 50;
hp = 50;
