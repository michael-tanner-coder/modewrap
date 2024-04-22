global.cutscene_index = 0;

global.cutscenes = [
     {
        key: "controls",
        scene_script: [
            {
                line: "D-PAD: MOVE",
                animation: spr_player_new_run,
            },
            {
                line: "X: JUMP",
                animation: spr_player_new_idle,
            },
            {
                line: "DOWN: FAST FALL",
                animation: spr_player_new_idle,
            },
        ],
        next_level: rm_level_1,
        character_unlock: undefined
    },
    {
        key: "test scene 1",
        scene_script: [
            {
                line: "UNLOCKED SPIKEY",
                animation: spr_player_spikey_new_idle,
            },
            {
                line: "Destroy blocks with your spike",
                animation: spr_player_spikey_new_idle,
            },
        ],
        next_level: rm_level_2,
        character_unlock: CHARACTER.SPIKEY
    },
    {
        key: "test scene 2",
        scene_script: [
             {
                line: "UNLOCKED BOOTS",
                animation: spr_player_spike_boots_new_idle,
            },
            {
                line: "Bounce and break blocks below",
                animation: spr_player_spike_boots_new_idle,
            },
        ],
        next_level: rm_level_3,
        character_unlock: CHARACTER.BOOTS,
    },
    {
        key: "test scene 3",
        scene_script: [
            {
                    line: "UNLOCKED FLOAT",
                    animation: spr_player_stretch_head_new_idle,
            },
            {
                line: "Press 'Up' to raise your head high",
                animation: spr_player_stretch_head_new_idle,
            },
        ],
        next_level: rm_level_4,
        character_unlock: CHARACTER.STRETCH,
    },
    {
        key: "test scene 4",
        scene_script: [
            {
                line: "YOU REACHED THE END!",
                animation: spr_player_stretch_head_new_idle,
            },
            {
                line: "UNLOCKED TWINS",
                animation: spr_player_twin_new_idle,
            },
            {
                line: "Press 'Up' to fling your brother",
                animation: spr_player_twin_new_idle,
            },
            {
                line: "Now play it all again lol",
                animation: spr_player_twin_new_idle,
            },
        ],
        next_level: rm_level_1,
        character_unlock: CHARACTER.TWIN,
    },
];
