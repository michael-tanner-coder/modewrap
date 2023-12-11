var _dt = delta_time / 1000000;
var _spawn_num = instance_number(Enemy);

spawn_countdown -= _dt;

if (score >= 500 && score < 1000)
{
	spawn_index = 1;
}

if (score >= 1000 && score < 1500) 
{
	spawn_index = 2;
}



if (spawn_countdown <= 0 && _spawn_num < spawn_limit) {
	if (score >= 1500)
	{
		spawn_index +=1;	
	}
	
	if (spawn_index > array_length(spawn_options) - 1) {
		spawn_index = 0;
	}
	
	spawn_countdown = max_spawn_interval;
	var _new_enemy = instance_create_layer(x,y, layer, spawn_options[spawn_index]);
	var _random_num = random(1);
	_new_enemy.move_speed = _random_num > 0.5 ? _new_enemy.move_speed : -1 * _new_enemy.move_speed;
}
