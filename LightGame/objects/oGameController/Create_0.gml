/// @description Insert description here
// You can write your code in this editor

player = instance_find(oPlayer, 0);

enemySpawnInterval = 1000;

//Keeps track of all of the possible spawn locations for items in a stage
itemSpawns = []
for (var i = 0; i < instance_number(oItemSpawn); ++i;) {
    itemSpawns[i] = instance_find(oItemSpawn,i)
}
