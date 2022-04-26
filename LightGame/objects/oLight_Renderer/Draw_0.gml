/// @description Insert description here
// You can write your code in this editor

if (!surface_exists(lighting_surface)) {
	//Consider optimizing this, could cause issues in large rooms
	//Perhaps use camera width/height instead
	lighting_surface = surface_create(room_width, room_height);
}

surface_set_target(lighting_surface);

//Draw the darkness over the level. Higher levels = darker, between [0-1]
draw_clear_alpha(c_black, 0.98);

//Draw the player's light
with(oPlayer) {
	var playerWobble = 0.03
	var wobble_amount = random_range(-playerWobble, playerWobble);
	playerCharge = max(0, (oPlayer.charge/oPlayer.maxCharge)*3);
	
	//Cut out a hole, then add in a new color and intensity defined by the lighting cutout obj
	gpu_set_blendmode(bm_subtract);
	draw_sprite_ext(sLightCutout, 0, x, y, image_xscale*playerCharge + wobble_amount, image_yscale*playerCharge + wobble_amount, 0, c_white, 1);
	
	gpu_set_blendmode(bm_add)
	draw_sprite_ext(sLightCutout, 0, x, y, image_xscale*playerCharge + wobble_amount, image_yscale*playerCharge + wobble_amount, 0, c_white, 0.1);
	
	gpu_set_blendmode(bm_normal);
}

//Draw Battery glow
for (var i = 0; i < instance_number(oBattery); ++i;)
{
    batt = instance_find(oBattery,i)
	
	var battWobble = 0.03
	var wobble_amount = random_range(-battWobble, battWobble);
	var col = $c94d3a;
	
	//Cut out a hole, then add in a new color and intensity defined by the lighting cutout obj
	gpu_set_blendmode(bm_subtract);
	draw_sprite_ext(sLightCutout, 0, batt.x, batt.y, image_xscale + wobble_amount, image_yscale + wobble_amount, 0, col, 1);
	
	gpu_set_blendmode(bm_add)
	draw_sprite_ext(sLightCutout, 0, batt.x, batt.y, image_xscale + wobble_amount, image_yscale + wobble_amount, 0, col, 0.5);
	
	gpu_set_blendmode(bm_normal);
}

//Draw Enemy glow
for (var i = 0; i < instance_number(oEnemy1); ++i;)
{
    var enemy = instance_find(oEnemy1,i)
	
	var battWobble = 0.03
	var wobble_amount = random_range(-battWobble, battWobble);
	var col = $0b0b99;
	
	//Cut out a hole, then add in a new color and intensity defined by the lighting cutout obj
	gpu_set_blendmode(bm_subtract);
	draw_sprite_ext(sLightCutout, 0, enemy.x, enemy.y, image_xscale*1.1 + wobble_amount, image_yscale*0.9 + wobble_amount, 0, col, 1);
	
	gpu_set_blendmode(bm_add)
	draw_sprite_ext(sLightCutout, 0, enemy.x, enemy.y, image_xscale*1.1 + wobble_amount, image_yscale*0.9 + wobble_amount, 0, col, 0.5);
	
	gpu_set_blendmode(bm_normal);
}

//Draw Bullet glow
for (var i = 0; i < instance_number(oBullet); ++i;)
{
    var enemy = instance_find(oBullet,i)
	
	var battWobble = 0.03
	var wobble_amount = random_range(-battWobble, battWobble);
	var col = $0b0b99;
	
	//Cut out a hole, then add in a new color and intensity defined by the lighting cutout obj
	gpu_set_blendmode(bm_subtract);
	draw_sprite_ext(sLightCutout, 0, enemy.x, enemy.y, image_xscale*0.3 + wobble_amount, image_yscale*0.3 + wobble_amount, 0, col, 1);
	
	gpu_set_blendmode(bm_add)
	draw_sprite_ext(sLightCutout, 0, enemy.x, enemy.y, image_xscale*0.3 + wobble_amount, image_yscale*0.3 + wobble_amount, 0, col, 0.75);
	
	gpu_set_blendmode(bm_normal);
}



//Cut out sections of darkness at each lighting cutout
with(oLightingCutout) {
	
	var wobble_amount = random_range(-wobble, wobble);
	
	//Cut out a hole, then add in a new color and intensity defined by the lighting cutout obj
	gpu_set_blendmode(bm_subtract);
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale + wobble_amount, image_yscale + wobble_amount, 0, c_white, 1);
	
	gpu_set_blendmode(bm_add)
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale + wobble_amount, image_yscale + wobble_amount, 0, color, intensity);
	
	gpu_set_blendmode(bm_normal);
}


surface_reset_target();

//Actually draws the surface over the view. 0,0 is the top left of the level
draw_surface(lighting_surface, 0, 0);