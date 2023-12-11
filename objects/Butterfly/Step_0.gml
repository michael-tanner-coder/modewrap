if (grounded) {
	x += move_speed;
}

if (!grounded) {
	calculate_gravity();
}

check_for_collision();

//screenwrap();



