function go_to_next_level() {
    global.level_index += 1;
    global.collected_coins = 0;

    // If the player has reached the last level, loop back to the beginning, unless it is their first time
    if (
        global.level_index > array_length(global.levels) - 1 &&
        global.settings.endless_mode_enabled
    ) {
        global.level_index = 0;
    }

    // If we have reached the final level and endless mode is disabled, go to the final cutscene
    if (
        global.level_index > array_length(global.levels) - 1 &&
        !global.settings.endless_mode_enabled
    ) {
        show_debug_message("Reached final cutscene");
        global.level_index = 0;
        global.cutscene_index = array_length(global.cutscenes) - 1;
        room_goto(rm_cutscene);
        return;
    }

    // If there is a defined cutscene for the next level, go to that cutscene first before moving to the next level
    if (global.levels[global.level_index].cutscene != undefined) {
        global.cutscene_index = global.levels[global.level_index].cutscene;
        room_goto(rm_cutscene);
        return;
    }

    // If the map in the next level is different then the current map, load that level's room
    if (global.levels[global.level_index].map != global.current_map) {
        global.current_map = global.levels[global.level_index].map;
        room_goto(global.current_map);
    }
}
