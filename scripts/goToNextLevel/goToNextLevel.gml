function go_to_next_level(){
	global.level_index += 1;
	global.collected_coins = 0;
	
	// If the player has reached the last level, loop back to the beginning, unless it is their first time
	if (global.level_index > array_length(global.levels) - 1) {
		global.level_index = 0;
	}
	
	if (global.levels[global.level_index].cutscene != undefined) {
		global.cutscene_index = global.levels[global.level_index].cutscene;
		room_goto(Cutscene);
		return;
	}
	
	if (global.levels[global.level_index].map != global.current_map) {
		global.current_map = global.levels[global.level_index].map;
		room_goto(global.current_map);
	}
}