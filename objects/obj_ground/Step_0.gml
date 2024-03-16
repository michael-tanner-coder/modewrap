if(place_meeting(x, y+1, obj_player)) {
	if(!pushed) 
	{
		audio_play_sound(snd_move_platform, 2, false);
	}
	
	if (obj_player.mode == CHARACTER.TALL) {
		y -= obj_player.sprite_height;
		pushed = true;
	}
	
	if (obj_player._player_jump_stats.can_destroy_blocks_above) {
		spawn_dust_particles();
		x = -1000;
		inactive = true;
		alarm_set(0, 750);
	}
}

if(place_meeting(x, y-1, obj_player) && obj_player.can_destroy_blocks_below) {
	spawn_dust_particles();
	x = -1000;
	inactive = true;
	alarm_set(0, 750);
	obj_player.bounce_from_block = true;
	// Player.can_destroy_blocks_below = false;
}

if (!inactive) {
	x = lerp(x, original_x, 0.08);
	y = lerp(y, original_y, 0.08);
}

if (abs(y - original_y) <= push_buffer) {
	pushed = false;
}
