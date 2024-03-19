global.cutscene_index = 0;

global.cutscenes = [
    {
        key: "test scene 1",
        scene_script: [
            {
                line: "UNLOCKED TALL",
                animation: spr_player_tall_run,
            },
            {
                line: "Push blocks with your head",
                animation: spr_player_tall_idle,
            },
        ],
        next_level: rm_level_2,
        character_unlock: CHARACTER.TALL
    },
    {
        key: "test scene 2",
        scene_script: [
            {
                line: "UNLOCKED SPIKEY",
                animation: spr_player_spikey_idle,
            },
            {
                line: "Destroy blocks with your spike",
                animation: spr_player_spikey_idle,
            },
        ],
        next_level: rm_level_3,
        character_unlock: CHARACTER.SPIKEY,
    },
    {
        key: "test scene 3",
        scene_script: [
            {
                line: "UNLOCKED BOOTS",
                animation: spr_player_spike_boots_idle,
            },
            {
                line: "Bounce and break blocks below",
                animation: spr_player_spike_boots_idle,
            },
        ],
        next_level: rm_level_4,
        character_unlock: CHARACTER.BOOTS,
    },
    {
        key: "test scene 4",
        scene_script: [
            {
                line: "YOU REACHED THE END!",
                animation: spr_player_stretch_head_idle,
            },
            {
                line: "UNLOCKED FLOAT",
                animation: spr_player_stretch_head_idle,
            },
            {
                line: "Press 'Up' to raise your head high",
                animation: spr_player_stretch_head_idle,
            },
            {
                line: "Now play it all again lol",
                animation: spr_player_stretch_head_idle,
            },
        ],
        next_level: rm_credits,
        character_unlock: CHARACTER.TWIN,
    },
];
