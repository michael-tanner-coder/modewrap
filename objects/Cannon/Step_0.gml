// Parent step logic
if (grounded) {
	x += move_speed;
}

calculate_gravity();
grounded = check_for_collision();
screenwrap();

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
if (shoot_timer <= 0 && grounded) {
	var _buffer = move_speed < 0 ? shoot_buffer_x * -1 : shoot_buffer_x;
	var _new_bullet = instance_create_layer(x + _buffer,y,layer, projectile);
	_new_bullet.speed = 1;
	_new_bullet.direction = _aim_direction;
	shoot_timer = max_shoot_timer;
}

