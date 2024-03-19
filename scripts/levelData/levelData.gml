var _enabled_character_modes = load_from_json("enabled_modes.json");

global.level_index = 0;

global.levels = [
    // 1
    {
        key: "1-1",
        enemies: [obj_crawlie],
        goal_coins: 3,
        time_limit: 100,
        spawn_interval: 6,
        enemy_speed: 1,
        spawn_limit: 1,
        map: rm_level_1,
        cutscene: undefined,
        characters: _enabled_character_modes,
    },
    {
        key: "1-2",
        enemies: [obj_crawlie],
        goal_coins: 6,
        time_limit: 100,
        spawn_interval: 6,
        enemy_speed: 1,
        spawn_limit: 2,
        map: rm_level_1,
        cutscene: undefined,
        characters: _enabled_character_modes,
    },
    {
        key: "1-3",
        enemies: [obj_crawlie],
        goal_coins: 9,
        time_limit: 100,
        spawn_interval: 6,
        enemy_speed: 1,
        spawn_limit: 3,
        map: rm_level_1,
        cutscene: undefined,
        characters: _enabled_character_modes,
    },
    {
        key: "1-4",
        enemies: [obj_crawlie],
        goal_coins: 9,
        time_limit: 100,
        spawn_interval: 6,
        enemy_speed: 1,
        spawn_limit: 3,
        map: rm_level_1,
        cutscene: undefined,
        characters: _enabled_character_modes,
    },

    // 2
    {
        key: "2-1",
        enemies: [obj_bunny],
        goal_coins: 3,
        time_limit: 100,
        spawn_interval: 6,
        enemy_speed: 1,
        spawn_limit: 1,
        map: rm_level_2,
        cutscene: 0,
        characters: _enabled_character_modes,
    },
    {
        key: "2-2",
        enemies: [obj_bunny],
        goal_coins: 6,
        time_limit: 100,
        spawn_interval: 6,
        enemy_speed: 1,
        spawn_limit: 1,
        map: rm_level_2,
        cutscene: undefined,
        characters: _enabled_character_modes,
    },
    {
        key: "2-3",
        enemies: [obj_bunny],
        goal_coins: 9,
        time_limit: 100,
        spawn_interval: 6,
        enemy_speed: 1,
        spawn_limit: 2,
        map: rm_level_2,
        cutscene: undefined,
        characters: _enabled_character_modes,
    },
    {
        key: "2-4",
        enemies: [obj_bunny],
        goal_coins: 9,
        time_limit: 100,
        spawn_interval: 6,
        enemy_speed: 1,
        spawn_limit: 2,
        map: rm_level_2,
        cutscene: undefined,
        characters: _enabled_character_modes,
    },

    // 3
    {
        key: "3-1",
        enemies: [obj_cannon],
        goal_coins: 3,
        time_limit: 100,
        spawn_interval: 6,
        enemy_speed: 1,
        spawn_limit: 1,
        map: rm_level_3,
        cutscene: 1,
        characters: _enabled_character_modes,
    },
    {
        key: "3-2",
        enemies: [obj_cannon],
        goal_coins: 6,
        time_limit: 100,
        spawn_interval: 6,
        enemy_speed: 1,
        spawn_limit: 2,
        map: rm_level_3,
        cutscene: undefined,
        characters: _enabled_character_modes,
    },
    {
        key: "3-3",
        enemies: [obj_cannon],
        goal_coins: 9,
        time_limit: 100,
        spawn_interval: 6,
        enemy_speed: 1,
        spawn_limit: 3,
        map: rm_level_3,
        cutscene: undefined,
        characters: _enabled_character_modes,
    },
    {
        key: "3-4",
        enemies: [obj_cannon],
        goal_coins: 9,
        time_limit: 100,
        spawn_interval: 6,
        enemy_speed: 1,
        spawn_limit: 3,
        map: rm_level_3,
        cutscene: undefined,
        characters: _enabled_character_modes,
    },

    // 4
    {
        key: "4-1",
        enemies: [obj_butterfly],
        goal_coins: 3,
        time_limit: 100,
        spawn_interval: 6,
        enemy_speed: 1,
        spawn_limit: 1,
        map: rm_level_4,
        cutscene: 2,
        characters: _enabled_character_modes,
    },
    {
        key: "4-2",
        enemies: [obj_butterfly],
        goal_coins: 6,
        time_limit: 100,
        spawn_interval: 6,
        enemy_speed: 1,
        spawn_limit: 2,
        map: rm_level_4,
        cutscene: undefined,
        characters: _enabled_character_modes,
    },
    {
        key: "4-3",
        enemies: [obj_butterfly],
        goal_coins: 9,
        time_limit: 100,
        spawn_interval: 6,
        enemy_speed: 1,
        spawn_limit: 3,
        map: rm_level_4,
        cutscene: undefined,
        characters: _enabled_character_modes,
    },
    {
        key: "4-4",
        enemies: [obj_butterfly],
        goal_coins: 9,
        time_limit: 100,
        spawn_interval: 6,
        enemy_speed: 1,
        spawn_limit: 3,
        map: rm_level_4,
        cutscene: undefined,
        characters: _enabled_character_modes,
    },
];

global.bonus_levels = [];
