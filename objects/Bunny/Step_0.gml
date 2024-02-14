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
if (place_meeting(x,y+1, Ground))
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
	
	grounded = true;

}

// movement
x += xspd;
y+=yspd;

if (y >= 240) {
	instance_destroy(self);
}

nonlethal_frames--;
if (nonlethal_frames <= 0) {
	nonlethal_frames = 0;
}