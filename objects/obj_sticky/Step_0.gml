// change x and y speed based on where the ground is touching the character
xspd = place_meeting(x,y+1, obj_ground) ? 1 : (place_meeting(x,y-1,obj_ground) ? -1 : 0);
yspd = place_meeting(x-1, y, obj_ground) ? 1 : (place_meeting(x+1, y, obj_ground) ? -1 : 0);


// if we hit a corner and aren't touching any ground blocks
if (xspd == 0 && yspd == 0) 
{
	xspd = prev_yspd > 0 ? -1 : (prev_yspd < 0 ? 1 : 0);
	yspd = prev_xspd > 0 ? 1 : (prev_xspd < 0 ? -1 : 0);
}


// update x,y positions based on speed
x+=xspd;
y+=yspd;

// track previous x and y speeds for when we need to switch directions
prev_xspd = xspd;
prev_yspd = yspd;

