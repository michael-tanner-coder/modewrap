// Base properties
health = 1;
score = 0;
image_speed = 1;
lives = 3;
max_lives = 4;
points_to_next_life = 0;
mode = character_modes.normal;

// States
enum states {
    idle = 0, 
    running = 1,
    hurt = 2,
    respawn = 3,
    game_over = 4,
    screenwrapping = 5,
}

state = states.idle;

idle_behavior = function() {
    // animation
    sprite_index = get_character_properties().idle;

    if (xspd == 0 && health < 2 && _player_jump_stats.backup_sprites) {
        sprite_index = _player_jump_stats.backup_sprites.idle;
    }

    // transitions
    if (xspd != 0) {
        change_state(states.running);
    }
}

running_behavior = function() {
    // animation
    sprite_index = get_character_properties().run;

    if (health < 2 && _player_jump_stats.backup_sprites) {
        sprite_index = _player_jump_stats.backup_sprites.run;
    }
    
    // transitions
    if (xspd == 0) {
        change_state(states.idle);
    }
}

hurt_behavior = function() {
    // animation 
    sprite_index = get_character_properties().hurt;
	
	if (_player_jump_stats.backup_sprites) {
		sprite_index = _player_jump_stats.backup_sprites.hurt;
	}


}

respawn_behavior = function() {}

game_over_behavior = function() {
    // animation 
    sprite_index = get_character_properties().hurt;

    if (_player_jump_stats.backup_sprites) {
        sprite_index = _player_jump_stats.backup_sprites.hurt;
    }
}

// State Behaviors
states_array[states.idle] = {
    entrance_behavior: function() {
        // show_debug_message("enter idle state");
    },
    active_behavior: idle_behavior,
    exit_behavior: function() {
        // show_debug_message("exit idle state");
    },
};
states_array[states.running] = {
    entrance_behavior: function() {
        // show_debug_message("enter running state");
    },
    active_behavior: running_behavior,
    exit_behavior: function() {
        // show_debug_message("exit running state");
    },
};
states_array[states.hurt] = {
    entrance_behavior: function() {},
    active_behavior: hurt_behavior,
    exit_behavior: function() {},
};
states_array[states.respawn] = {
    entrance_behavior: function() {},
    active_behavior: respawn_behavior,
    exit_behavior: function() {},
};
states_array[states.game_over] = {
    entrance_behavior: function() {
        show_debug_message("enter game over state");
    },
    active_behavior: game_over_behavior,
    exit_behavior: function() {
        show_debug_message("exit game over state");
    },
};

// State transition
change_state = function(next_state) {
    if (state != next_state) {
        script_execute(states_array[state].exit_behavior);
        script_execute(states_array[next_state].entrance_behavior);
        state = next_state;
    }
}

// Modes
modes = global.levels[global.level_index].characters;
mode_queue = [character_modes.normal, character_modes.small, character_modes.tall, character_modes.big, character_modes.boots, character_modes.spikey, character_modes.stretch];
mode_queue_index = 1;

// movement vars
xspd = 0;
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
get_character_properties = function () {
    return global.mode_properties[mode];
};

// Default to normal mode jumping
_player_jump_stats = player_jump_vars[0];
