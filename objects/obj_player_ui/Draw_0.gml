if (player_instance == undefined || player_instance == noone) {
	return;
}


// --- LEFT PILLAR BOX ---
var _pillar_box_width = sprite_get_width(spr_black) * 6; // pillar box is currently scaled by a factor of 6
var _right_pillar_box_center = view_xport[0] + camera_get_view_width(view_camera[0]) - _pillar_box_width/2;
var _left_pillar_box_center = view_xport[0] + _pillar_box_width/2;

var _ui_start_y = 100;
var _ui_start_x = _left_pillar_box_center;

// Lives
var _total_lives_width = lives * sprite_get_width(spr_life);
var _lives_y = 39;
for (var _i = 0; _i < lives; _i++) {
    draw_sprite(
        spr_life,
        0,
        (_left_pillar_box_center - _total_lives_width/2) + (sprite_get_width(spr_life) + 4) * _i,
        _lives_y,
    );
}

// Score Drawing
// -- character-specific coloring
var _character = undefined;
var _character_color = c_white;
with(obj_player) {
	_character = get_character_properties();
	_character_color = _character.color;
}

var _points_accrued = 0;
with (obj_score_system) {
	_points_accrued = points_accrued;
}

if (_character == undefined) {
	return;
}

// -- score header
draw_set_font(Header);
var _score_header = "SCORE";

// ---- white text pass
font_enable_effects(Header, true, {
	enableOutline: true,
	outlineDistance: 4,
	outlineColour: c_white,
});
draw_set_color(c_white);
draw_text(_ui_start_x, _ui_start_y, _score_header);

// ---- color text pass
font_enable_effects(Header, true, {
	enableOutline: false,
	outlineDistance: 0,
});
draw_set_color(_character_color);
draw_text(_ui_start_x, _ui_start_y, _score_header);

// -- score number
draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_set_color(c_white);
draw_text(_ui_start_x, _ui_start_y + font_get_size(Header) * 2, string(_points_accrued));



//  --- RIGHT PILLAR BOX ---
// Current character UI

// -- string
var _character = player_instance.get_character_properties();
var _character_string = string_upper(_character.key);

// -- position
draw_set_halign(fa_center);
var _character_text_x = _right_pillar_box_center;
var _character_text_y = _ui_start_y;

// -- outline
var _outline_size = 4;
draw_set_font(Header);

// ---- white text pass
font_enable_effects(Header, true, {
	enableOutline: true,
	outlineDistance: 4,
	outlineColour: c_white,
});
draw_set_color(c_white);
draw_text(_character_text_x, _character_text_y, _character_string);

// ---- color text pass
font_enable_effects(Header, true, {
	enableOutline: false,
	outlineDistance: 0,
});
draw_set_color(_character.color);
draw_text(_character_text_x, _character_text_y, _character_string);

// Next Character UI
// -- next text
var _next_string = "NEXT";
var _next_text_x = _character_text_x;
var _next_text_y = _character_text_y * 4;
// ---- white text pass
font_enable_effects(Header, true, {
	enableOutline: true,
	outlineDistance: 4,
	outlineColour: c_white,
});
draw_set_color(c_white);
draw_text(
    _next_text_x,
    _next_text_y,
    _next_string
);

// ---- color text pass
font_enable_effects(Header, true, {
	enableOutline: false,
	outlineDistance: 0,
});
draw_set_color(_character.color);
draw_text(
    _next_text_x,
    _next_text_y,
    _next_string
);

// -- character preview image
var _next_mode = player_instance.mode_queue[player_instance.mode_queue_index];
var _next_mode_sprite = global.mode_properties[_next_mode].idle;

var _character_preview_box_x = _right_pillar_box_center - sprite_get_width(spr_block_outline) / 2;
var _character_preview_box_y = _next_text_y + sprite_get_height(spr_block_outline) / 4;

var _character_preview_box_center_x = _character_preview_box_x + sprite_get_width(spr_block_outline) / 2;
var _character_preview_box_center_y = _character_preview_box_y + sprite_get_height(spr_block_outline) / 2;

var _character_sprite_width = sprite_get_width(_next_mode_sprite);
var _character_sprite_height = sprite_get_height(_next_mode_sprite);

draw_sprite(
    spr_block_outline,
    0,
    _character_preview_box_x,
    _character_preview_box_y,
);

draw_sprite(
    _next_mode_sprite,
    0,
    _character_preview_box_center_x - _character_sprite_width / 2,
    _character_preview_box_center_y - _character_sprite_height / 2,
);

// --- VICTORY UI ---
// Score Table on Victory Screen
// -- background underlay
var _victory_ui_x = view_xport[0] + _pillar_box_width;
var _victory_ui_y = 264;
var _block_width = sprite_get_width(spr_black);
var _game_area_width = camera_get_view_width(view_camera[0]) - _pillar_box_width * 2;
var _block_scale_width = _game_area_width / _block_width;
var _block_scale_height = 8;
draw_sprite_ext(spr_black, 0, _victory_ui_x, _victory_ui_y, _block_scale_width, _block_scale_height, image_angle, image_blend, 0.6);


if (global.victory) {
	// -- victory header
	var _victory_header = "VICTORY!";
	var _victory_text_x = _victory_ui_x + (_block_scale_width * _block_width) / 2;
	var _victory_text_y = _victory_ui_y + 40;
	draw_set_halign(fa_center);
	// 
	// ---- white text pass
	font_enable_effects(Header, true, {
		enableOutline: true,
		outlineDistance: 4,
		outlineColour: c_white,
	});
	draw_set_color(c_white);
	draw_text(_victory_text_x, _victory_text_y, _victory_header);
	
	// ---- color text pass
	font_enable_effects(Header, true, {
		enableOutline: false,
		outlineDistance: 0,
	});
	draw_set_color(_character_color);
	draw_text(_victory_text_x, _victory_text_y, _victory_header);
	
	// -- base points
	var _text_x_padding = 30;
	var _text_y_margin = 30;
	var _text_size = font_get_size(Paragraph);
	
	var _labels_column_start_x = _victory_ui_x + 20;
	var _labels_column_start_y = _victory_ui_x + _text_x_padding;
	
	var _points_column_start_x = _victory_ui_x + (_block_scale_width * _block_width) - _text_x_padding;
	var _points_column_start_y = _labels_column_start_y;
	
	var _tally_column_start_x = _victory_ui_x + 660;
	var _tally_column_start_y = _labels_column_start_y;
	
	var _points_gained = {
		label: "POINTS GAINED",
		tally: undefined,
		points: 100,
	};
	
	var _no_lives_lost = {
		label: "NO LIVES LOST",
		tally: undefined,
		points: 1000,
	};
	
	var _time_bonus = {
		label: "TIME BONUS",
		tally: "10 s",
		points: 1000,
	};
	
	var _monsters_bonus = {
		label: "MONSTERS DEFEATED",
		tally: 5,
		points: 1000,
	};
	
	var _total = {
		label: "TOTAL SCORE",
		tally: undefined,
		points: 2125,
	};
	
	var score_structs = [_points_gained, _no_lives_lost, _time_bonus, _monsters_bonus, _total];
	var _score_font = Paragraph;
	draw_set_font(_score_font);
	for(var _i = 0; _i < array_length(score_structs); _i++) {
		var _current_score = score_structs[_i];
		var _current_score_y = _labels_column_start_y + ((_text_size + _text_y_margin) * _i);
		
		// label
		draw_set_halign(fa_left);
		
		// -- white text pass
		// font_enable_effects(_score_font, true, {
		// 	enableOutline: true,
		// 	outlineDistance: 4,
		// 	outlineColour: c_white,
		// });
		// draw_set_color(c_white);
		// draw_text(_labels_column_start_x, _current_score_y, _current_score.label);
		
		// -- color text pass
		// font_enable_effects(_score_font, true, {
		// 	enableOutline: false,
		// 	outlineDistance: 0,
		// });
		draw_set_color(_character_color);
		draw_text(_labels_column_start_x, _current_score_y, _current_score.label);
		
		// tally
		if (_current_score.tally != undefined) {
			draw_set_halign(fa_center);
			draw_set_color(c_white);
			draw_text(_tally_column_start_x, _current_score_y, string(_current_score.tally));
		}
	
		// points
		draw_set_halign(fa_right);
		draw_set_color(c_white);
		draw_text(_points_column_start_x, _current_score_y, _current_score.points);
	}
}

// GAME OVER UI
if (global.game_over) {
	// -- victory header
	var _game_over_header = "GAME OVER!";
	var _game_over_text_x = _victory_ui_x + (_block_scale_width * _block_width) / 2;
	var _game_over_text_y = _victory_ui_y + 40;
	draw_set_halign(fa_center);
	
	// ---- white text pass
	font_enable_effects(Header, true, {
		enableOutline: true,
		outlineDistance: 4,
		outlineColour: c_white,
	});
	draw_set_color(c_white);
	draw_text(_game_over_text_x, _game_over_text_y, _game_over_header);
	
	// ---- color text pass
	font_enable_effects(Header, true, {
		enableOutline: false,
		outlineDistance: 0,
	});
	draw_set_color(_character_color);
	draw_text(_game_over_text_x, _game_over_text_y, _game_over_header);
	
		// -- base points
	var _text_x_padding = 30;
	var _text_y_margin = 240;
	var _text_size = font_get_size(Paragraph);
	
	var _labels_column_start_x = _victory_ui_x + 20;
	var _labels_column_start_y = _victory_ui_x + _text_x_padding;
	
	var _points_column_start_x = _victory_ui_x + (_block_scale_width * _block_width) - _text_x_padding;
	var _points_column_start_y = _labels_column_start_y;
	
	var _tally_column_start_x = _victory_ui_x + 660;
	var _tally_column_start_y = _labels_column_start_y;
	
	var _points_gained = {
		label: "POINTS GAINED",
		tally: undefined,
		points: 100,
	};
	
	var _final_score = {
		label: "FINAL SCORE",
		tally: undefined,
		points: 100,
	};
	
	var score_structs = [_points_gained, _final_score];
	var _score_font = Paragraph;
	draw_set_font(_score_font);
	for(var _i = 0; _i < array_length(score_structs); _i++) {
		var _current_score = score_structs[_i];
		var _current_score_y = _labels_column_start_y + ((_text_size + _text_y_margin) * _i);
		
		// label
		draw_set_halign(fa_left);
		
		// -- white text pass
		// font_enable_effects(_score_font, true, {
		// 	enableOutline: true,
		// 	outlineDistance: 4,
		// 	outlineColour: c_white,
		// });
		// draw_set_color(c_white);
		// draw_text(_labels_column_start_x, _current_score_y, _current_score.label);
		
		// -- color text pass
		// font_enable_effects(_score_font, true, {
		// 	enableOutline: false,
		// 	outlineDistance: 0,
		// });
		draw_set_color(_character_color);
		draw_text(_labels_column_start_x, _current_score_y, _current_score.label);
		
		// tally
		if (_current_score.tally != undefined) {
			draw_set_halign(fa_center);
			draw_set_color(c_white);
			draw_text(_tally_column_start_x, _current_score_y, string(_current_score.tally));
		}
	
		// points
		draw_set_halign(fa_right);
		draw_set_color(c_white);
		draw_text(_points_column_start_x, _current_score_y, _current_score.points);
	}
}
