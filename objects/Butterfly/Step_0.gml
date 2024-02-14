if (global.paused) {
	return;
}

if (grounded) {
	x += move_speed;
}

if (!grounded) {
	calculate_gravity();
}

check_for_collision();

//screenwrap();

nonlethal_frames--;
if (nonlethal_frames <= 0) {
	nonlethal_frames = 0;
}



