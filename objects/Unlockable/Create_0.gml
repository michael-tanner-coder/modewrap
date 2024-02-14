mode = "normal";
sprite_anim_index = 0;
sprite_anim_frames = 3;
sprite_anim_speed = 10;
sprite_animation = spr_player_idle;
highlighted = false;
description = "";
activated = true;

alarm_set(0, sprite_anim_speed);

set_data = function(_mode) {
	var _mode_properties = get_mode_properties(_mode);
	
	if (!_mode_properties) return;
	
	mode = _mode;
	
	sprite_animation = _mode_properties.idle;
	
	sprite_anim_frames = sprite_get_number(sprite_animation);
	
	description = _mode_properties.description;
}

toggle_unlock = function() {
	var _mode_properties = get_mode_properties(mode);
	
	activated = !activated;
	
	if (activated) {
		sprite_animation = _mode_properties.idle;
		sprite_anim_frames = sprite_get_number(sprite_animation);
	}else {
		sprite_animation = _mode_properties.hurt;
		sprite_anim_frames = 1;
	}
}




