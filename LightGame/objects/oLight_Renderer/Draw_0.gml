/// @description Insert description here
// You can write your code in this editor

if (!surface_exists(lighting_surface)) {
	//Consider optimizing this, could cause issues in large rooms
	//Perhaps use camera width/height instead
	lighting_surface = surface_create(room_width, room_height);
}

surface_set_target(lighting_surface);

//Draw the darkness over the level. Higher levels = darker, between [0-1]
draw_clear_alpha(c_black, 0.95);


with(oPlayer) {
	var playerWobble = 0.01
	var wobble_amount = random_range(-playerWobble, playerWobble);
	
	//Cut out a hole, then add in a new color and intensity defined by the lighting cutout obj
	gpu_set_blendmode(bm_subtract);
	draw_sprite_ext(sLightCutout, 0, x, y, image_xscale + wobble_amount, image_yscale + wobble_amount, 0, c_white, 1);
	
	gpu_set_blendmode(bm_add)
	draw_sprite_ext(sLightCutout, 0, x, y, image_xscale + wobble_amount, image_yscale + wobble_amount, 0, c_white, 0.1);
	
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