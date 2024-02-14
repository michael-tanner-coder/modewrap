sprite_anim_index++;

if (sprite_anim_index >= sprite_anim_frames) {
	sprite_anim_index = 0;
}

alarm_set(0, sprite_anim_speed);
