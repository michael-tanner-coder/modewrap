var _room_delta = (1/room_speed)*1000000;
var _dt = delta_time / _room_delta;
var _player_jump_stats = player_jump_vars[mode_index];

// Handle falling
// calculate_gravity(_dt);

check_for_collision(1);

// get inputs
var _right_key = keyboard_check(vk_right);
var _left_key = keyboard_check(vk_left);
var _jump_key_pressed = keyboard_check_pressed(vk_space);
var _jump_key_hold = keyboard_check(vk_space);

// speed
xspd = (_right_key - _left_key) * _player_jump_stats.move_spd;

// gravity
yspd += _player_jump_stats.grav;

// jumping
// reset jump count
if (place_meeting(x,y+1, Ground))
{
	jump_count = 0;
} 
else 
{
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
}

// end jump early by stopping timer
if (!_jump_key_hold) {
	jump_timer = 0;
}

// jump based on timer
if (jump_timer > 0) {
	yspd = _player_jump_stats.jump_spd;
	
	jump_timer--;
}

//if (_jump_key_pressed && place_meeting(x, y+1, Ground)) {
//	yspd = jump_spd;
//}

// collision
if (place_meeting(x + xspd, y, Ground)) 
{
	var _pixel_check = sign(xspd);
	while(!place_meeting(x + _pixel_check, y, Ground))
	{
		x += _pixel_check;
	}
	
	xspd = 0;
}


if (place_meeting(x + xspd, y + yspd, Ground)) 
{
	var _pixel_check = sign(yspd);
	while(!place_meeting(x + xspd, y + _pixel_check, Ground)) 
	{
		y += _pixel_check;
	}
	
	yspd = 0;
}

// movement
x += xspd;
y+=yspd;

// animation
if (xspd == 0) {
	sprite_index = _player_jump_stats.idle;
}

// Screnwrapping
var _screenwrapped = screenwrap();

if (_screenwrapped) {
	var _prev_mode = mode;
	
	while (mode == _prev_mode)
	{
		// pick random new mode
		mode = modes[irandom(array_length(modes) - 1)];
		
		// get index of current mode
		for (var _i = 0; _i <= array_length(modes) - 1; _i++) 
		{
			if (modes[_i] = mode) {
				mode_index = _i;
			}
		}
	}
	
	change_mode();
}

