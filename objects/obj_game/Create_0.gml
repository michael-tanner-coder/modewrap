// Playtesting Notes:
// -- unclear what the difference is between small and regular characters
// -- unclear what the tall character does when hitting a block
// -- some block movement looks glitchy
// -- unclear when you have iframes
// -- players can still get stuck in blocks when they return
// -- show tutorials for starter characters

// Graphics setup
window_set_fullscreen(false);
gpu_set_texfilter(false);

// Game State
global.paused = false;
global.title = true;
global.intro = true;
global.game_over = false;
global.victory = false;

// Intro Timer
alarm_set(0, 120);

// Level timer
max_level_time = 60 * 30;
global.level_timer = 60 * global.levels[global.level_index].time_limit;

// Goal coins
goal_coin_count = global.levels[global.level_index].goal_coins;
global.collected_coins = 0;

// Current Map
global.current_map = global.levels[global.level_index].map;

//Lives
lives = 3;

// Coin UI Properties
coin_columns = 3;
coin_rows = 4;

// Unlockables
mode_unlocks = [
    {
        points: 500,
        mode: CHARACTER.BIG,
    },

    {
        points: 700,
        mode: CHARACTER.SPIKEY,
    },

    {
        points: 2000,
        mode: CHARACTER.STRETCH,
    },

    {
        points: 2500,
        mode: CHARACTER.TWIN,
    },

    {
        points: 3000,
        mode: CHARACTER.BOOTS,
    },
];

// Mode Unlock Functions
load_default_modes = function () {
    var _modes = load_from_json("unlocked_modes.json");

    if (!is_array(_modes)) {
        var _default_modes = [CHARACTER.NORMAL, CHARACTER.SMALL, CHARACTER.TALL];
        save_to_json(_default_modes, "unlocked_modes.json");
    }
};

unlock_mode = function () {
    var _modes = load_from_json("unlocked_modes.json");

    for (var i = 0; i < array_length(mode_unlocks); i++) {
        var _current_mode = mode_unlocks[i].mode;
        var _points_to_unlock_mode = mode_unlocks[i].points;

        if (array_contains(_modes, _current_mode)) {
            continue;
        }

        if (score >= _points_to_unlock_mode) {
            array_push(_modes, _current_mode);
            save_to_json(_modes, "unlocked_modes.json");
        }
    }
};

// Default save data
load_default_modes();

// Events
pubsub_subscribe("coin_collected", function () {
    global.collected_coins += 1;
});