/// @description Control Menu

if (menu_control) {
	
	if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"))) {
		menu_cursor++;
		if (menu_cursor >= menu_items) menu_cursor = 0;
	}
	if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"))) {
		menu_cursor--;
		if (menu_cursor >= menu_items) menu_cursor = menu_items - 1;
	}
	
	if (keyboard_check_pressed(vk_enter)) {
		menu_committed = menu_cursor;
		menu_control = false;
	}
	
}

if (menu_committed != -1) {
	delay--;
	if (delay < 0) {
		switch (menu_committed) {
			//New Game
			case 2:
				room_goto_next();
				break;
			//Options
			case 1:
				menu_control = true;
				delay = 20;
				menu_committed = -1;
				break;
			//Quit
			case 0:
				game_end();
				break;
			
		}
		
	}
	
}