health = 1;
score = 0;
image_speed = 1;

xspd  =0;
yspd = 0;

move_spd = 2;
grav = 0.25;

// jumping vars
jump_spd = -2.5;
jump_max = 1;
jump_count = 0;
jump_hold_frames = 15;
jump_timer = 0;

player_character_index = 0;
player_jump_vars = [
// Normal mode
{
	jump_spd: -2.5,
	jump_max: 1,
	jump_hold_frames: 15,
	grav: 0.25,
	move_spd: 1,
	run: spr_player_run,
	idle: spr_player_idle,
	hurt: spr_player_hurt,
},

// Short mode
{
	jump_spd: -2.5,
	jump_max: 1,
	jump_hold_frames: 15,
	grav: 0.25,
	move_spd: 2,
	run: spr_player_short_run,
	idle: spr_player_short_idle,
	hurt: spr_player_short_hurt,
},

// Tall mode
{
	jump_spd: -3,
	jump_max: 1,
	jump_hold_frames: 10,
	grav: 0.25,
	move_spd: 1,
	run: spr_player_tall_run,
	idle: spr_player_tall_idle,
	hurt: spr_player_tall_hurt,
},

// Big mode
{
	jump_spd: -1.5,
	jump_max: 1,
	jump_hold_frames: 15,
	grav: 1,
	move_spd: 1,
	run: spr_player_big_run,
	idle: spr_player_big_idle,
	hurt: spr_player_big_hurt,
}
];
