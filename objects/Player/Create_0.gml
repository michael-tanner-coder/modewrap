health = 1;
score = 0;
image_speed = 1;
lives = 3;
max_lives = 4;
points_to_next_life = 0;

//modes = loadFromJson("enabled_modes.json");
modes = global.levels[global.level_index].characters;
mode_queue = array_shuffle(modes);
mode_queue_index = 1;

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
grounded = false;
bounce_from_block = false;

player_character_index = 0;

player_jump_vars = global.mode_properties;

// Methods
get_jump_stats = function() {
	var matching_jump_stats = array_filter(player_jump_vars, function(element, index) {
		return element.key == mode;
	})
	
	if (is_array(matching_jump_stats)) {
		return matching_jump_stats[0];
	}
	
	return player_jump_vars[0];
}

// Default to normal mode jumping
_player_jump_stats = player_jump_vars[0];
