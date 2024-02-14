if (highlighted && keyboard_check_pressed(vk_space)) {
	
	var _enabled_modes = loadFromJson("enabled_modes.json");
	if (activated && array_length(_enabled_modes) <= 3) {
		return;
	}
	
	toggle_unlock();
	
	toggle_mode(mode);
}



