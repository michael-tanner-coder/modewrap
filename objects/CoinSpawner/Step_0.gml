var _spawn_num = instance_number(coin);

if (_spawn_num < spawn_limit) {
	var _spawn_point = spawn_points[irandom(array_length(spawn_points) - 1)];
	var _spawn_x = _spawn_point[0];
	var _spawn_y = _spawn_point[1];
	instance_create_layer(_spawn_x,_spawn_y,layer, coin);
}

