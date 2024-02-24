var _room_delta = (1 / room_speed) * 1000000;
var _dt = delta_time / _room_delta;

if (global.paused || lives <= 0) return;

// get inputs
var _right_key = keyboard_check(vk_right);
var _left_key = keyboard_check(vk_left);
var _jump_key_pressed = keyboard_check_pressed(vk_space);
var _jump_key_hold = keyboard_check(vk_space);
var _up_key_pressed = keyboard_check_pressed(vk_up);

// speed
xspd = (_right_key - _left_key) * _player_jump_stats.move_spd;

// gravity
yspd += _player_jump_stats.grav;

// block destruction
can_destroy_blocks_below = _player_jump_stats.can_destroy_blocks_below;

// jumping
// reset jump count
if (place_meeting(x, y + 1, Ground)) {
    jump_count = 0;

    if (!grounded) {
        var _max_yspd = 100;
        var _yspd_factor = yspd / _max_yspd; // could use this to determine squash when falling faster
        xscale = 1.1;
        yscale = 0.9;

        // reset fall speed when hitting the ground
        fall_speed = 1;

        grounded = true;

        spawn_dust_particles();

        audio_play_sound(_player_jump_stats.landing_sound, 1, false);

        if (_player_jump_stats.heavy) {
            screenshake(5, 1, 0.4);
            destroy_enemies();

            var _shockwave_right = instance_create_layer(
                x + sprite_width / 2,
                y + 4,
                layer,
                Shockwave
            );
            _shockwave_right.hspeed = 2;

            var _shockwave_left = instance_create_layer(
                x + sprite_width / 2,
                y + 4,
                layer,
                Shockwave
            );
            _shockwave_left.hspeed = -2;
            _shockwave_left.image_xscale = -1;
        }
    }
} else {
    grounded = false;
    // take away first jump if player is in air
    if (jump_count == 0) {
        jump_count = 1;
    }
}

// jump buffer
if (_jump_key_pressed) {
    jump_buffer_time = max_jump_buffer_time;
}

// init jump
if (jump_buffer_time > 0 && jump_count < _player_jump_stats.jump_max) {
    jump_count++;

    jump_timer = _player_jump_stats.jump_hold_frames;

    spawn_dust_particles();

    audio_play_sound(snd_jump_normal, 1, false);

    xscale = 0.8;
    yscale = 1.2;
}

// end jump early by stopping timer
if (!_jump_key_hold) {
    jump_timer = 0;
}

// jump based on timer
if (jump_timer > 0 || bounce_from_block) {
    yspd = _player_jump_stats.jump_spd;

    if (bounce_from_block) {
        yspd *= 2;
        xscale = 0.8;
        yscale = 1.2;
    }

    jump_timer--;

    bounce_from_block = false;
}

// lerp scale back to 1 to revert any squash and stretch
xscale = lerp(xscale, 1, 0.05);
yscale = lerp(yscale, 1, 0.05);

// collision
if (place_meeting(x + xspd, y, Ground)) {
    var _pixel_check = sign(xspd);
    while (!place_meeting(x + _pixel_check, y, Ground)) {
        x += _pixel_check;
    }

    xspd = 0;
}

if (place_meeting(x + xspd, y + yspd, Ground)) {
    var _pixel_check = sign(yspd);
    while (!place_meeting(x + xspd, y + _pixel_check, Ground)) {
        y += _pixel_check;
    }

    yspd = 0;
}

// movement
yspd *= fall_speed; // slow down fall speed
x += xspd;
y += yspd;

// animation
script_execute(states_array[state].active_behavior);

// arrow key commands
if (_up_key_pressed && _player_jump_stats.backup_sprites && health > 1) {
    instance_create_layer(x, y - sprite_height, layer, Twin);
    health -= 1;
}

if (_up_key_pressed && _player_jump_stats.can_stretch) {
    is_stretching = !is_stretching;
}

//stretch_height = stretch_height == 0 ? -75 : 0;
if (is_stretching) {
    stretch_height = lerp(stretch_height, -75, 0.1);
} else {
    stretch_height = lerp(stretch_height, 0, 0.1);
}

// Screnwrapping
var _screenwrapped = screenwrap();

if (_screenwrapped) {
    iframes = screenwrap_iframes;

    var _prev_mode = mode;

    while (mode == _prev_mode) {
        // pick random new mode
        mode = mode_queue[mode_queue_index];

        // get index of current mode
        for (var _i = 0; _i <= array_length(modes) - 1; _i++) {
            if (modes[_i] == mode) {
                mode_index = _i;
            }
        }

        mode_queue_index++;
    }

    // increase mode_queue_index
    if (mode_queue_index >= array_length(mode_queue)) {
        mode_queue_index = 0;
    }

    _player_jump_stats = get_character_properties();

    instance_destroy(Player_Head);
    if (mode == character_modes.stretch) {
        instance_create_layer(x, y, layer, Player_Head);
        is_stretching = false;
    }

    change_mode();

    health = _player_jump_stats.base_health;

    audio_play_sound(snd_modewrap, 3, false);

    if (grounded) {
        y -= sprite_height;
    }

    // slow fall when screenwrapping from bottom to top
    if (!grounded) {
        fall_speed = min_fall_speed;
    }
}

// I-Frames
iframes--;
if (iframes <= 0) {
    iframes = 0;
}
