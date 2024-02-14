function check_for_game_over(){
	var _player_jump_stats = player_jump_vars[mode_index];

	if (iframes <= 0 && other.nonlethal_frames <= 0) {
		if (health > 0) {
			audio_play_sound(snd_game_over, 6, false);
		}

		health -= 1;
	
		instance_destroy(other.id);
	}
}

function go_to_game_over() {

}

function restart_level() {
	global.paused = false;
	room_restart();
}