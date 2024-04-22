// Base properties
health = 1;
image_speed = 1;
lives = 3;
max_lives = 4;
points_to_next_life = 0;
mode = CHARACTER.NORMAL;
mode_index = 0;

font_enable_effects(Header, true, {
	outlineEnable: true,
    outlineDistance: 4,
    outlineColour: c_white
})


// Jump properties
jump_buffer_time = 0;
max_jump_buffer_time = 24;

// Physics properties
fall_speed = 1;
max_fall_speed = 1;
min_fall_speed = 0.875;

// Damage properties
iframes = 0;
screenwrap_iframes = 24;

// Interaction properties
can_destroy_blocks_below = false;
is_stretching = false;
stretch_height = 0;
is_screenwrapping = false;

// scale for squash and stretch
xscale = 1;
yscale = 1;

// States
enum STATES {
    IDLE = 0, 
    RUNNING = 1,
    HURT = 2,
    RESPAWN = 3,
    GAME_OVER = 4,
}

state = STATES.IDLE;

idle_behavior = function() {
    // animation
    sprite_index = get_character_properties().idle;

    if (xspd == 0 && health < 2 && _player_jump_stats.backup_sprites) {
        sprite_index = _player_jump_stats.backup_sprites.idle;
    }

    // transitions
    if (xspd != 0) {
        change_state(STATES.RUNNING);
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
        change_state(STATES.IDLE);
    }
}

hurt_behavior = function() {
    // animation 
    sprite_index = get_character_properties().hurt;
	
	if (_player_jump_stats.backup_sprites) {
		sprite_index = _player_jump_stats.backup_sprites.hurt;
	}
	
	// invincibility during this state
	iframes = 60;
}

respawn_behavior = function() {}

game_over_behavior = function() {
    hurt_behavior();
}

// State Behaviors
states_array[STATES.IDLE] = {
    entrance_behavior: function() {
        // show_debug_message("enter idle state");
    },
    active_behavior: idle_behavior,
    exit_behavior: function() {
        // show_debug_message("exit idle state");
    },
};
states_array[STATES.RUNNING] = {
    entrance_behavior: function() {
        // show_debug_message("enter running state");
    },
    active_behavior: running_behavior,
    exit_behavior: function() {
        // show_debug_message("exit running state");
    },
};
states_array[STATES.HURT] = {
    entrance_behavior: function() {
		alarm_set(0, 50);
	},
    active_behavior: hurt_behavior,
    exit_behavior: function() {},
};
states_array[STATES.RESPAWN] = {
    entrance_behavior: function() {},
    active_behavior: respawn_behavior,
    exit_behavior: function() {},
};
states_array[STATES.GAME_OVER] = {
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
// save_to_json([CHARACTER.NORMAL, CHARACTER.STRETCH, CHARACTER.BIG, CHARACTER.SMALL, CHARACTER.TALL], "unlocked_modes.json");
mode_queue = load_from_json("unlocked_modes.json");
mode_queue = array_shuffle(mode_queue, 1);
mode_queue_index = 1;

change_character = function(next_mode) {
	mode = next_mode;
	
	// get stats pertaining to new character
    _player_jump_stats = get_character_properties();

	// reset and spawn floating head instance for float character
    instance_destroy(obj_player_head);
    if (mode == CHARACTER.STRETCH) {
        instance_create_layer(x, y, layer, obj_player_head);
        is_stretching = false;
    }

    health = _player_jump_stats.base_health;

    audio_play_sound(snd_modewrap, 3, false);

    if (grounded) {
        y -= sprite_get_height(_player_jump_stats.idle);
    }

    // slow fall when screenwrapping from bottom to top
    if (!grounded) {
        fall_speed = min_fall_speed;
    }
}

// movement vars
xspd = 0;
yspd = 0;
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
