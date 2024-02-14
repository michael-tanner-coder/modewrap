spawn_points = [];
prev_spawn_x = 0;
prev_spawn_y = 0;
prev_spawn_index = 0;

for (var _i = 0; _i < instance_number(Coin); ++_i;) {
	var _instance = instance_find(Coin, _i);
	array_push(spawn_points, [_instance.x, _instance.y]);
}

instance_destroy(Coin);

