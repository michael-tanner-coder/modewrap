// change x and y speed based on where the ground is touching the character
xspd = place_meeting(x,y+(1*SIZE_FACTOR), obj_ground) ? 1 * SIZE_FACTOR : (place_meeting(x,y-(1*SIZE_FACTOR),obj_ground) ? -1 * SIZE_FACTOR : 0);
yspd = place_meeting(x-(1*SIZE_FACTOR), y, obj_ground) ? 1  * SIZE_FACTOR : (place_meeting(x+(1*SIZE_FACTOR), y, obj_ground) ? -1  * SIZE_FACTOR : 0);

// if we hit a corner and aren't touching any ground blocks
if (xspd == 0 && yspd == 0) 
{
	xspd = prev_yspd > 0 ? -1 * SIZE_FACTOR : (prev_yspd < 0 ? 1 * SIZE_FACTOR : 0);
	yspd = prev_xspd > 0 ? 1 * SIZE_FACTOR : (prev_xspd < 0 ? -1 * SIZE_FACTOR : 0);
}

// if no ground blocks are nearby, destroy self
if (distance_to_object(obj_ground) > 5 * SIZE_FACTOR) {
	instance_destroy(self);
}

// update x,y positions based on speed
x+=xspd;
y+=yspd;

// track previous x and y speeds for when we need to switch directions
prev_xspd = xspd;
prev_yspd = yspd;

