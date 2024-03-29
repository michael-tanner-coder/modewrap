
enum CHARACTER {
    NORMAL = 0,
    SMALL = 1,
    TALL = 2,
    BIG = 3,
    BOOTS = 4,
    STRETCH = 5,
    TWIN = 6,
    SPIKEY = 7,
}

// Sprites for Mode Text in UI
global.mode_text_sprites[CHARACTER.NORMAL] = {
	key: "normal",
	index: 2,
	text_image: spr_mode_normal,
	sprite: spr_player_idle
};
global.mode_text_sprites[CHARACTER.SMALL] = {
	key: "small",
	index: 2,
	text_image: spr_mode_small,
	sprite: spr_player_short_idle
};
global.mode_text_sprites[CHARACTER.TALL] = {
	key: "tall",
	index: 3,
	text_image: spr_mode_tall,
	sprite: spr_player_tall_idle
};
global.mode_text_sprites[CHARACTER.BIG] = {
	key: "big",
	index: 6,
	text_image: spr_mode_big,
	sprite: spr_player_big_idle
};
global.mode_text_sprites[CHARACTER.BOOTS] = {
	key: "boots",
	index: 1,
	text_image: spr_mode_boots,
	sprite: spr_player_spike_boots_idle
};
global.mode_text_sprites[CHARACTER.SPIKEY] = {
	key: "spikey",
	index: 5,
	text_image: spr_mode_spikey,
	sprite: spr_player_spikey_idle
};
global.mode_text_sprites[CHARACTER.STRETCH] = {
	key: "stretch",
	index: 4,
	text_image: spr_mode_float,
	sprite: spr_player_stretch_feet_idle
};
global.mode_text_sprites[CHARACTER.TWIN] = {
	key: "twin",
	index: 7,
	text_image: spr_mode_twin,
	sprite: spr_player_twin_idle
};

// Properties for playing as specific character modes
global.mode_properties[CHARACTER.NORMAL] = {
	key: "normal",
	jump_spd: -2.5 * SIZE_FACTOR,
	jump_max: 1,
	jump_hold_frames: 15,
	grav: 0.25 * SIZE_FACTOR,
	move_spd: SIZE_FACTOR,
	run: spr_player_new_run,
	idle: spr_player_new_idle,
	hurt: spr_player_new_hurt,
	heavy: false,
	landing_sound: snd_land,
	can_destroy_blocks_above: false,
	can_destroy_blocks_below: false,
	base_health: 1,
	backup_sprites: undefined,
	can_stretch: false,
	description: "Just a normal guy who likes to jump.",
};

global.mode_properties[CHARACTER.BOOTS] = {
	key: "boots", 
	jump_spd: -2.5 * SIZE_FACTOR,
	jump_max: 1,
	jump_hold_frames: 15,
	grav: 0.25 * SIZE_FACTOR,
	move_spd: SIZE_FACTOR,
	run: spr_player_spike_boots_run,
	idle: spr_player_spike_boots_idle,
	hurt: spr_player_spike_boots_hurt,
	heavy: false,
	landing_sound: snd_land,
	can_destroy_blocks_above: false,
	can_destroy_blocks_below: true,
	base_health: 1,
	backup_sprites: undefined,
	can_stretch: false,
	description: "Can destroy blocks below",
};

global.mode_properties[CHARACTER.SMALL] = {
	key: "small",
	jump_spd: -2.5 * SIZE_FACTOR,
	jump_max: 1,
	jump_hold_frames: 15,
	grav: 0.25 * SIZE_FACTOR,
	move_spd: 2 * SIZE_FACTOR,
	run: spr_player_small_new_run,
	idle: spr_player_small_new_idle,
	hurt: spr_player_small_new_hurt,
	heavy: false,
	landing_sound: snd_land,
	can_destroy_blocks_above: false,
	can_destroy_blocks_below: false,
	base_health: 1,
	backup_sprites: undefined,
	can_stretch: false,
	description: "Light, fast, great jumper",
};

global.mode_properties[CHARACTER.TALL] = {
	key: "tall",
	jump_spd: -3 * SIZE_FACTOR,
	jump_max: 1,
	jump_hold_frames: 10,
	grav: 0.25 * SIZE_FACTOR,
	move_spd: SIZE_FACTOR,
	run: spr_player_tall_new_run,
	idle: spr_player_tall_new_idle,
	hurt: spr_player_tall_new_hurt,
	heavy: false,
	landing_sound: snd_land,
	can_destroy_blocks_above: false,
	can_destroy_blocks_below: false,
	base_health: 1,
	backup_sprites: undefined,
	can_stretch: false,
	description: "Can hit platforms with his tall head",
};

global.mode_properties[CHARACTER.STRETCH] = 	{
	key: "stretch",
	jump_spd: -3 * SIZE_FACTOR,
	jump_max: 1,
	jump_hold_frames: 10,
	grav: 0.25 * SIZE_FACTOR,
	move_spd: 1 * SIZE_FACTOR,
	run: spr_player_stretch_feet_run,
	idle: spr_player_stretch_feet_idle,
	hurt: spr_player_stretch_feet_hurt,
	heavy: false,
	landing_sound: snd_land,
	can_destroy_blocks_above: false,
	can_destroy_blocks_below: false,
	base_health: 1,
	backup_sprites: undefined,
	can_stretch: true,
	description: "Can float upward to reach higher coins",
};

global.mode_properties[CHARACTER.SPIKEY] = {
	key: "spikey",
	jump_spd: -3 * SIZE_FACTOR,
	jump_max: 1,
	jump_hold_frames: 10,
	grav: 0.25 * SIZE_FACTOR,
	move_spd: SIZE_FACTOR,
	run: spr_player_spikey_run,
	idle: spr_player_spikey_idle,
	hurt: spr_player_spikey_hurt,
	heavy: false,
	landing_sound: snd_land,
	can_destroy_blocks_above: true,
	can_destroy_blocks_below: false,
	base_health: 1,
	backup_sprites: undefined,
	can_stretch: false,
	description: "Can destroy blocks above",
};

global.mode_properties[CHARACTER.BIG] = {
	key: "big",
	jump_spd: -1.5 * SIZE_FACTOR,
	jump_max: 1,
	jump_hold_frames: 15,
	grav: SIZE_FACTOR,
	move_spd: SIZE_FACTOR,
	run: spr_player_big_new_run,
	idle: spr_player_big_new_idle,
	hurt: spr_player_big_new_hurt,
	heavy: true,
	landing_sound: snd_stomp,
	can_destroy_blocks_above: false,
	can_destroy_blocks_below: false,
	base_health: 1,
	backup_sprites: undefined,
	can_stretch: false,
	description: "Stomp to destroy all ground monsters",
};

global.mode_properties[CHARACTER.TWIN] = {
	key: "twin",
	jump_spd: -2.5 * SIZE_FACTOR,
	jump_max: 1,
	jump_hold_frames: 15,
	grav: 0.25 * SIZE_FACTOR,
	move_spd: 2 * SIZE_FACTOR,
	run: spr_player_twin_run,
	idle: spr_player_twin_idle,
	hurt: spr_player_twin_hurt,
	heavy: false,
	landing_sound: snd_land,
	can_destroy_blocks_above: false,
	can_destroy_blocks_below: false,
	base_health: 2,
	backup_sprites: {
		run: spr_player_twin_red_run,
		idle: spr_player_twin_red_idle,
		hurt: spr_player_twin_red_hurt,
	},
	can_stretch: false,
	description: "Can take two hits; can separate to reach higher coins",
};

function get_mode_properties(_mode) {
	passed_mode = _mode;
	
	var _filter = function(_element, _index) {
		return _element.key == passed_mode;
	}
	
	var _matching_mode = array_filter(global.mode_properties, _filter)
	
	if (is_array(_matching_mode)) {
		return _matching_mode[0];
	}
	
	return global.mode_properties[0];
}