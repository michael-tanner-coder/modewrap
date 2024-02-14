var _start_y = 48;
var _start_x = 10;

// GUI Font
draw_set_font(Retro);
draw_set_color(c_white);

// Score
draw_sprite_ext(spr_score_text, 0, _start_x, _start_y, 2,2,image_angle,image_blend,image_alpha);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_text(_start_x + 5, _start_y + 11, string(score));

// Timer
draw_sprite_ext(spr_time_text, 0, _start_x, _start_y + 40, 2,2,image_angle,image_blend,image_alpha);
draw_set_color(c_white);
draw_text(_start_x + 5, _start_y + 50, string(round(global.level_timer/60)));

// Coins
var _coins_rendered = 1;
for (var _i = 0; _i < coin_rows; _i++) {
	
	if (_coins_rendered >= goal_coin_count) {
		break;
	}
	
	for (var _j = 0; _j < coin_columns; _j++) {
		var _x =  _start_x + sprite_get_width(spr_coin_outline) * _j;
		var _y = _start_y + 79 + sprite_get_height(spr_coin_outline) * _i;
		
		if (global.collected_coins >= _coins_rendered) {
			draw_sprite_ext(spr_coin, 0,_x, _y, 1,1,image_angle,image_blend,image_alpha);
		}
		else {
			draw_sprite_ext(spr_coin_outline, 0,_x, _y, 1,1,image_angle,image_blend,image_alpha);
		}
		
		_coins_rendered++;
	}
}

// Current Level
var _text_padding = 5;
var _level_key = global.levels[global.level_index].key
if (_level_key == "BONUS") {
	draw_set_color(c_yellow);
	_level_key = "B";
}
draw_text(_start_x + _text_padding, _start_y + 136, _level_key);