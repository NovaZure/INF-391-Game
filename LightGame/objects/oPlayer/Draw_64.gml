//Draw the charge remaining bar
draw_healthbar(15, 20, 380, 60, 
	(charge/maxCharge)*100, c_black, c_dkgray, $c94d3a, 0, false, false);

draw_set_font(fScore)
draw_text(display_get_gui_width()/2, 20, string(playerScore))

//If Game is over
if (charge <= 0) {
	draw_set_font(fMenu);
	draw_set_halign(fa_center);
	draw_set_halign(fa_center);
	
	var offset = 2;
	var xx = menu_x;
	var yy = menu_y/2;
	var txt = "Game Over"
	draw_set_color(c_orange);
	draw_text(xx-offset,yy,txt);
	draw_text(xx+offset,yy,txt);
	draw_text(xx,yy-offset,txt);
	draw_text(xx,yy+offset,txt);
	draw_set_color(c_red);
	draw_text(xx,yy,txt);
	
	draw_text(xx, yy + menu_itemheight * 2, "R to Restart");
	
}
else {
	playerScore += 1;
}
