if (grounded) {
	x += move_speed;
}

// --left
if (move_speed < 0) {
	image_xscale = 1;
	
}
//-- right
if (move_speed > 0) {
	image_xscale = -1;
}

calculate_gravity();
check_for_collision();
screenwrap();