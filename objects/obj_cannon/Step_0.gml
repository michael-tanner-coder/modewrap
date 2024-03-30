if (global.paused) {
	return;
}

// Parent step logic
// --left
if (move_speed < 0) {
	image_xscale = 1;
}
//-- right
if (move_speed > 0) {
	image_xscale = -1;
}

// gravity
yspd += my_gravity;

// check for ground
if (place_meeting(x,y+1, obj_ground))
{
	if (!grounded) {
		grounded = true;
	}
} 
else 
{
	grounded = false;
}

if (xspd == 0) {
	xspd = original_xspd;
}

// collision
if (place_meeting(x + xspd, y, obj_ground)) 
{
	var _pixel_check = sign(xspd);
	while(!place_meeting(x + _pixel_check, y, obj_ground))
	{
		x += _pixel_check;
	}
	
	xspd = 0;
}


if (place_meeting(x + xspd, y + yspd, obj_ground)) 
{
	var _pixel_check = sign(yspd);
	while(!place_meeting(x + xspd, y + _pixel_check, obj_ground)) 
	{
		y += _pixel_check;
	}
	
	grounded = true;
	
	yspd = 0;
}

// movement
if (grounded) {
	x += xspd;
}

y+=yspd;

var _bottom_edge = view_yport[0] + camera_get_view_height(view_camera[0]);
if (y >= _bottom_edge) {
	instance_destroy(self);
}

nonlethal_frames--;
if (nonlethal_frames <= 0) {
	nonlethal_frames = 0;
}

var _dt = delta_time / 1000000;

// get aim direction based on direction of movement
var _aim_direction = 180;

//-- left
if (move_speed < 0) {
	_aim_direction = 180;
	image_xscale = 1;
}

//-- right
if (move_speed > 0) {
	_aim_direction = 0;
	image_xscale = -1;
}
	
// shoot projectile when timer hits zero
shoot_timer -= _dt;
if (shoot_timer <= 0 && grounded && nonlethal_frames <= 0) {
	var _buffer = move_speed < 0 ? shoot_buffer_x * -1 : shoot_buffer_x;
	var _new_bullet = instance_create_layer(x + sprite_width/2,y+sprite_height/4,layer, projectile);
	_new_bullet.speed = 1.5 * SIZE_FACTOR;
	_new_bullet.direction = _aim_direction;
	shoot_timer = max_shoot_timer;
	audio_play_sound(snd_shoot, 1, false);
}



