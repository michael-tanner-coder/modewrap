global.cutscene_index = 0;

global.cutscenes = [
	{
		key: "test scene 1",
		scene_script: 
		[
			{
				line: "testing",
				animation: spr_player_idle
			},
			{
				line: "testing 2",
				animation: spr_player_run
			},
			{
				line: "testing 3 (end)",
				animation: spr_player_hurt
			},
		],
		next_level: Level_1,
	},
	{
		key: "test scene 2",
		scene_script: 
		[
			{
				line: "testing",
				animation: spr_player_big_idle
			},
			{
				line: "testing 2",
				animation: spr_player_big_run
			},
			{
				line: "testing 3 (end)",
				animation: spr_player_big_hurt
			},
		],
		next_level: Level_2,
	},
	{
		key: "test scene 3",
		scene_script: 
		[
			{
				line: "testing",
				animation: spr_player_tall_idle
			},
			{
				line: "testing 2",
				animation: spr_player_tall_run
			},
			{
				line: "testing 3 (end)",
				animation: spr_player_tall_hurt
			},
		],
		next_level: Level_3,
	},
	{
		key: "test scene 4",
		scene_script: 
		[
			{
				line: "testing",
				animation: spr_player_short_idle
			},
			{
				line: "testing 2",
				animation: spr_player_short_run
			},
			{
				line: "testing 3 (end)",
				animation: spr_player_short_hurt
			},
		],
		next_level: Level_4,
	},
	{
		key: "test scene 4",
		scene_script: 
		[
			{
				line: "testing",
				animation: spr_player_twin_idle
			},
			{
				line: "testing 2",
				animation: spr_player_twin_run
			},
			{
				line: "testing 3 (end)",
				animation: spr_player_twin_hurt
			},
		],
		next_level: Title,
	},
];