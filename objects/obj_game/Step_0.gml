// Inputs
var inputs = global.input_sys.check(global.current_device);

// Speed settings
if (lives > 0) {
    room_speed = 60 * global.settings.game_speed;
}

// Audio settings
audio_group_set_gain(
    music_group,
    global.settings.audio_master * global.settings.audio_music,
    0
);
audio_group_set_gain(
    sound_group,
    global.settings.audio_master * global.settings.audio_sounds,
    0
);

// Intro transition
if (global.intro) {
    return;
}

if (global.settings.window_mode == 1) {
    if (os_browser != browser_not_a_browser && !instance_exists(obj_HTML_FS)) {
        instance_create_depth(x, y, depth, obj_HTML_FS);
    }
    window_set_fullscreen(true);
} else {
    if (os_browser != browser_not_a_browser && !instance_exists(obj_HTML_FS)) {
        instance_create_depth(x, y, depth, obj_HTML_FS);
    }
    window_set_fullscreen(false);
}

// when the room is paused after game over, press Enter to restart
if (global.paused && global.game_over) {
    if (inputs.select.down) {
        room_speed = 60;

        // Update save data
        save_score();
        unlock_mode();

        // Reset game state
        global.level_index = 0;
        global.cutscene_index = 0;
        global.current_map = global.levels[global.level_index].map;
        global.game_over = false;

        // Go to score menu to rank the player' score
        room_goto(rm_scores);
        menuModePause();
        menuSetPreset(e_menu_presets.pause_menu);
        room = rm_scores;
    }

    return;
}

if (global.paused && global.victory) {
    // Manually move to the next level if we are in the victory state, reset goal and time limit
    if (inputs.select.down) {
        go_to_next_level();
        global.victory = false;
        global.level_timer = 60 * global.levels[global.level_index].time_limit;
        goal_coin_count = global.levels[global.level_index].goal_coins;
    }

    return;
}

if (lives <= 0) {
    room_speed = lerp(room_speed, 0, 0.01);

    if (room_speed <= 30) {
        global.paused = true;
        global.game_over = true;
    }

    return;
}

if (global.collected_coins >= goal_coin_count) {
    instance_destroy(obj_enemy);

    // If we are at the end of a sequence of levels on the same map, paused the game to show the Victory UI
    if (
        global.level_index + 1 <= array_length(global.levels) - 1 &&
        global.levels[global.level_index + 1].map != global.current_map
    ) {
        if (!global.victory) {
        	pubsub_publish("level_over", 0);
        }
        
        global.paused = true;
        global.victory = true;
        
        return;
    }

    // Otherwise, move to next phase in the sequence and reset goal coins and timer
    go_to_next_level();
    global.level_timer = 60 * global.levels[global.level_index].time_limit;
    goal_coin_count = global.levels[global.level_index].goal_coins;
}

if (!global.paused && !global.game_over) {
    global.level_timer--;
}

if (global.level_timer <= 0) {
    global.level_index = 0;
    global.game_over = true;
    global.level_timer = global.levels[global.level_index].time_limit;
    health = 0;
    lives = 0;
}
