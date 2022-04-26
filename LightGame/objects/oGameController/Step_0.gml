/// @description Insert description here
// You can write your code in this editor

//If there are no batteries on the stage
if (instance_number(oBattery) == 0) {
	var rand = irandom_range(1, array_length(itemSpawns)-1);
	var spawn = itemSpawns[rand];
	
	instance_create_layer(spawn.x, spawn.y, "Instances", oBattery);
}

if (player.playerScore % enemySpawnInterval == 0) {
	var rand = irandom_range(1, array_length(itemSpawns)-1);
	var spawn = itemSpawns[rand];
	
	instance_create_layer(spawn.x, spawn.y, "Instances", oEnemy1);
}