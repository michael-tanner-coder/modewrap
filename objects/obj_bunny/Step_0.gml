if (global.paused) {
	return;
}

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
}

// movement
x += xspd;
y += yspd;

var _bottom_edge = view_yport[0] + camera_get_view_height(view_camera[0]);
if (y >= _bottom_edge) {
	instance_destroy(self);
}

nonlethal_frames--;
if (nonlethal_frames <= 0) {
	nonlethal_frames = 0;
}