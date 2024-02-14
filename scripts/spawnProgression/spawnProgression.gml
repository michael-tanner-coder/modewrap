function spawn_progression() {
	
	// scores needed to pass each "level" to progress through enemy types
	var _level1 = 1000;
	var _level2 = 2000;
	var _level3 = 3000;
	var _current_level = _level1;
	
	// spawn types
	if (score < _level3) {
		spawn_index = 2;
	}
		
	if (score < _level2) {
		spawn_index = 1;
		_current_level = _level2;
	}
	
	if (score < _level1) {
		spawn_index = 0;
		_current_level = _level1;
	}
	
	// destroy all enemies after reaching level benchmarks
	if (score >= _level1 && !reached_level_2)  {
		instance_destroy(Enemy);
		reached_level_2 = true;
	}
	
	if (score >= _level2 && !reached_level_3)  {
		instance_destroy(Enemy);
		reached_level_3 = true;
	}

	// spawn limits
	if (score % 1000 < 900) {
		spawn_limit = 3;
	}
	
	if (score % 1000 < 600) {
		spawn_limit = 2;
	}
	
	if (score % 1000 < 300) {
		spawn_limit = 1;
	}

	// random spawn type after finishing last level
	if (score > _level3) {
		var _spawn_indices = [0,1,2];
		spawn_index = _spawn_indices[irandom(array_length(_spawn_indices) - 1)];
	}
}