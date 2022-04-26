/// @description GUI/Menu setup
//window_set_fullscreen(true)
gui_width = display_get_gui_width();
gui_height = display_get_gui_height();
gui_margin = 32;

menu_x = gui_width/2;
menu_y = gui_width/3.5;

menu_font = fMenu
menu_itemheight = font_get_size(fMenu);
menu_committed = -1;
menu_control = true;

menu[2] = "Start Game";
menu[1] = "Options";
menu[0] = "Quit";

menu_items = array_length(menu);

menu_cursor = 2;

delay = 20;