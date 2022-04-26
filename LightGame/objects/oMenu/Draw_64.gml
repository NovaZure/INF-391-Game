/// @description Draw Menu


draw_set_halign(fa_center);

//Draw Title
draw_set_font(fMenuBig);
var xx = menu_x + 10;
var yy = menu_y - 100;
//Background color
draw_set_color($c94d3a);
draw_text(xx-2.2,yy,"LightBot Adventure");
draw_text(xx+2.2,yy,"LightBot Adventure");
draw_text(xx,yy-2.2,"LightBot Adventure");
draw_text(xx,yy+2.2,"LightBot Adventure");

draw_set_color($ffbb87);
draw_text(xx,yy,"LightBot Adventure");

//Draw Title Underlines
draw_rectangle(428, 347, 660, 352, false);
draw_rectangle(675, 347, 950, 352, false);

draw_set_font(fMenu);

for (var i = 0; i < menu_items; i++)
{
	var offset = 2.2;
	var txt = menu[i];
	if (menu_cursor == i) {
		//Draw foreground color for letters
		var col = c_white;
	}
	else {
		//Foreground color
		var col = $ebb134
	}
	
	var xx = menu_x;
	var yy = menu_y - (menu_itemheight * (i *1.5)) + 75;
	//Background color
	draw_set_color($c94d3a);
	draw_text(xx-offset,yy,txt);
	draw_text(xx+offset,yy,txt);
	draw_text(xx,yy-offset,txt);
	draw_text(xx,yy+offset,txt);
	draw_set_color(col);
	draw_text(xx,yy,txt);
	
}

