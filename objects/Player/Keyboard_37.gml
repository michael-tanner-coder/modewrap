if(image_xscale != -1)
{
	image_xscale = -1;
	x-= sprite_width;
}

sprite_index = _player_jump_stats.run;

if (health < 2 && _player_jump_stats.backup_sprites) {
	sprite_index = _player_jump_stats.backup_sprites.run;
}



