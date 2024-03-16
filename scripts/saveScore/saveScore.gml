function save_score(){
	var _highscores = load_from_json("score_data.json");
	var _max_score_record_count = 5;
		
	// check if our current score is large enough to be considered a high score
	var _new_high_score = false;
	for (var i = 0; i < array_length(_highscores); i++) {
		if (score > _highscores[i]) {
			_new_high_score = true;
		}
	}
	
	// if our score is too low, end the function
	if (!_new_high_score) {
		return;
	}
		
	// add the new high score to the scores array, sort highest to lowest
	array_push(_highscores, score);
	array_sort(_highscores, function(_elm1, _elm2) { return _elm2 - _elm1; });
			
	// if we exceed the max score record count, remove the lowest score
	if (array_length(_highscores) > _max_score_record_count) {
		array_delete(_highscores, -1, -1);
	}
		
	// replace the score file's old score array
	saveToJson(_highscores, "score_data.json");
}