draw_set_font(Retro);

if (global.intro) {
	draw_self();
	
	var _text_x = camera_get_view_width(view_camera[0])/2 - sprite_get_width(spr_game_over)/2 - 8;
	var _text_y = camera_get_view_height(view_camera[0])/2 - sprite_get_height(spr_game_over) - 16;
	
	draw_sprite_ext(spr_title, 0, _text_x, _text_y - 2, 2,2,image_angle,image_blend,image_alpha);
	
	draw_set_halign(fa_center);
	draw_set_color(c_white);
	var _level_key = global.levels[global.level_index].key;
	var _level_number = string_split(_level_key, "-")[0];
	draw_text(_text_x + 16, _text_y + 22, "LEVEL: " + string(_level_number));
	return;
}

if (global.game_over) {
	draw_self();
	
	var _text_x = camera_get_view_width(view_camera[0])/2 - sprite_get_width(spr_game_over)/2;
	var _text_y = camera_get_view_height(view_camera[0])/2 - sprite_get_height(spr_game_over) - 16;
	
	draw_sprite_ext(spr_game_over, 0, _text_x - 16, _text_y - 2, 2,2,image_angle,image_blend,image_alpha);
	
	draw_sprite_ext(spr_score_text, 0, _text_x - 64, _text_y + 24, 2,2,image_angle,image_blend,image_alpha);
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_color(c_white);
	draw_text(_text_x + 48, _text_y + 32, string(score));
}

if (global.victory) {
	draw_self();
	
	var _text_x = camera_get_view_width(view_camera[0])/2 - sprite_get_width(spr_victory_text)/2;
	var _text_y = camera_get_view_height(view_camera[0])/2 - sprite_get_height(spr_victory_text) - 16;
	
	draw_sprite_ext(spr_victory_text, 0, _text_x - 16, _text_y - 2, 2,2,image_angle,image_blend,image_alpha);
	
	draw_sprite_ext(spr_score_text, 0, _text_x - 64, _text_y + 24, 2,2,image_angle,image_blend,image_alpha);
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_color(c_white);
	draw_text(_text_x + 48, _text_y + 32, string(score));
}


