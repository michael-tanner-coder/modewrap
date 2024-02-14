// Jump Buffer
if (jump_buffer_time > 0) {
	jump_buffer_time -= 1;
}

// Health
if (health <= 0) {
	x = room_width/2;
	y = -50;
	lives -= 1;
	health = 1;
	iframes = 60;
	//instance_create_layer(x, 40, layer, RespawnPlatform);
}

if (lives <= 0) {
	sprite_index = _player_jump_stats.hurt;
	
	if (_player_jump_stats.backup_sprites) {
		sprite_index = _player_jump_stats.backup_sprites.hurt;
	}
}
