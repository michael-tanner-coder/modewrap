if (keyboard_check_pressed(vk_enter)) {
	menuModeTitle(); 
	menuSetPreset(e_menu_presets.title_screen);
	room = Title;
	room_goto(Title);
}




