// Jump Buffer
if (jump_buffer_time > 0) {
	jump_buffer_time -= 1;
}

// Jumping
/*
if (jump_buffer_time > 0 && grounded) {	
	var _initial_jump_force = 4 * sqrt(2 * max_jump_force);
	y_velocity -= _initial_jump_force;
	grounded = false;
	jump_buffer_time = 0;
	fall_speed = 0;
}*/

// Health
if (health <= 0) {
	instance_destroy(id);
	room_goto(GameOver);
}
