var _spawn_num = instance_number(coin);

if (_spawn_num < spawn_limit) {
	var _spawn_x = 0;
	var _spawn_y = 0;
	var _spawn_index = 0;
	
	
	// Never pick the same spawn point twice in a row
	do 
	{
		_spawn_index = irandom(array_length(spawn_points) - 1);
		
		var _spawn_point = spawn_points[_spawn_index];
		
		_spawn_x = _spawn_point[0];
		_spawn_y = _spawn_point[1];
	} until (_spawn_index != prev_spawn_index)
	
	prev_spawn_index = _spawn_index;

	// spawn the coin at the chosen point
	instance_create_layer(_spawn_x,_spawn_y,layer, coin);
}

