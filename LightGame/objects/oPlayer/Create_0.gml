/// @description Insert description here
// You can write your code in this editor

spd = 3;
xSpeed = 0;
ySpeed = 0;
canDoubleJump = true;
playerScore = 0;
iFrames = 0;
charge = 100;
maxCharge = 100;
chargeRate = -0.05;

// --- GUI Elements ---
gui_width = display_get_gui_width();
gui_height = display_get_gui_height();
menu_x = gui_width/2;
menu_y = gui_width/3.5;

menu_itemheight = font_get_size(fMenu);
