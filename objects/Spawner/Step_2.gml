if (global.paused || global.intro) {
	return;
}

var _dt = delta_time / 1000000;
var _spawn_num = instance_number(Enemy);

global.spawn_countdown -= _dt;

if (global.spawn_countdown <= 0) {
	var _current_level = global.levels[global.level_index];
	spawn_limit = _current_level.spawn_limit;
	
	var _enemy_spawn_type = _current_level.enemies[irandom(array_length(_current_level.enemies) - 1)];
	
	if (_spawn_num < spawn_limit) {
		global.spawn_countdown = _current_level.spawn_interval;
		var _new_enemy = instance_create_layer(x,y, layer, _enemy_spawn_type);
		var _random_num = random(1);
		_new_enemy.move_speed = _random_num > 0.5 ? _new_enemy.move_speed : -1 * _new_enemy.move_speed;
		_new_enemy.xspd = _random_num > 0.5 ? _new_enemy.xspd * _current_level.enemy_speed: (-1 * _current_level.enemy_speed) * _new_enemy.xspd;
		_new_enemy.original_xspd = _new_enemy.xspd;
		audio_play_sound(snd_spawn_enemy, 1, false);
	}
}
