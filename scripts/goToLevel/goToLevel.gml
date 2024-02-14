function go_to_level(_level = 0){
	global.level_index = _level;
	global.collected_coins = 0;
	
	if (global.level_index > array_length(global.levels) - 1) {
		global.level_index = 0;
	}
}