function take_damage_from_enemy(){
	if (health > 0) {
		audio_play_sound(snd_game_over, 6, false);
	}

	health -= 1;
	
	instance_destroy(other.id);
}