/// @description Insert description here
score_table_x = -1000;
score_table_y = 264;
border_x = 0;

_points_gained = {
	label: "POINTS GAINED",
	tally: undefined,
	points: 100,
	current_points: 0,
	current_x: -1000, 
};

_no_lives_lost = {
	label: "NO LIVES LOST",
	tally: undefined,
	points: 1000,
	current_points: 0,
	current_x: -1000, 
};

_time_bonus = {
	label: "TIME BONUS",
	tally: "10 s",
	points: 1000,
	current_points: 0,
	current_x: -1000, 
};

_monsters_bonus = {
	label: "MONSTERS DEFEATED",
	tally: 5,
	points: 1000,
	current_points: 0,
	current_x: -1000, 
};

_total = {
	label: "TOTAL SCORE",
	tally: undefined,
	points: 2125,
	current_points: 0,
	current_x: -1000, 
};

_final_score = {
	label: "FINAL SCORE", 
	tally: undefined,
	current_points: 0,
	points: 100,
	current_x: -1000, 
};

render_level_end_scores = function(header, scores, row_margin) {
    // Score Table on Victory Screen
    // -- background underlay
    var _pillar_box_width = sprite_get_width(spr_black) * 6; // pillar box is currently scaled by a factor of 6
    var _target_score_table_x = view_xport[0] + _pillar_box_width;
    var _block_width = sprite_get_width(spr_black);
    var _game_area_width = camera_get_view_width(view_camera[0]) - _pillar_box_width * 2;
    var _block_scale_width = _game_area_width / _block_width;
    var _block_scale_height = 8;
    var _underlay_height = _block_scale_height * sprite_get_height(spr_black);
    var _outline_size = 4;
    var _character_color = c_white;
    draw_sprite_ext(spr_black, 0, score_table_x, score_table_y, _block_scale_width, _block_scale_height, image_angle, image_blend, 0.6);
    
    with(obj_player) {
        _character_color = get_character_properties().color;
    }

    score_table_x = lerp(score_table_x, _target_score_table_x, 0.2);
	
	// -- borders
	var _rect_width = 172;
	var _rect_height = 10;
	var _rect_count = _game_area_width / _rect_width;
	var _total_border_width = _rect_width * _rect_count;
	
	for(var _i = 0; _i <= _rect_count * 2; _i++) {
		
		if (_i % 2 == 0) {
			draw_set_color(_character_color);
		} else {
			draw_set_color(c_white);
		}
		
		var _rect_x = (border_x + score_table_x + _rect_width * _i) - (_rect_width * 2);
		var _rect_y = score_table_y;
		
		draw_rectangle(_rect_x, _rect_y, _rect_x + _rect_width, _rect_y + _rect_height, false);
		draw_rectangle(_rect_x, _rect_y + _underlay_height, _rect_x + _rect_width, _rect_y + _underlay_height + _rect_height, false);
	}
	
	border_x += 1;
	if (border_x >= _rect_width * 2) {
		border_x = 0;
	}
	
	// -- victory header
	var _score_table_header = header;
	var _score_table_text_x = score_table_x + (_block_scale_width * _block_width) / 2;
	var _score_table_text_y = score_table_y + 40;
	draw_set_halign(fa_center);
	draw_outlined_text(_score_table_text_x, _score_table_text_y, _score_table_header, _character_color, Header, _outline_size, c_white);

	// -- base points
	var _text_x_padding = 30;
	var _text_y_padding = 120;
	var _text_y_margin = row_margin;
	var _text_size = font_get_size(Paragraph);
	
	var _labels_column_start_x = score_table_x + 20;
	var _labels_column_start_y = score_table_y + _text_y_padding;
	
	var _points_column_start_x = score_table_x + (_block_scale_width * _block_width) - _text_x_padding;
	var _points_column_start_y = _labels_column_start_y;
	
	var _tally_column_start_x = score_table_x + 660;
	var _tally_column_start_y = _labels_column_start_y;
	
	var score_structs = scores;
	var _score_font = Paragraph;
	
	draw_set_font(_score_font);
	for(var _i = 0; _i < array_length(score_structs); _i++) {
		var _current_score = score_structs[_i];
		var _current_score_y = _labels_column_start_y + ((_text_size + _text_y_margin) * _i);
		_current_score.current_x = lerp(_current_score.current_x, 0, 0.4);
		_current_score.current_points = lerp(_current_score.current_points, _current_score.points, 0.3);
		var _rounded_score = round(_current_score.current_points);
		
		// label
		draw_set_halign(fa_left);
		draw_set_color(_character_color);
		draw_outlined_text(_labels_column_start_x + _current_score.current_x, _current_score_y, _current_score.label, _character_color, _score_font, 4, c_white);
		
		// tally
		if (_current_score.tally != undefined) {
			draw_set_halign(fa_center);
			draw_set_color(c_white);
			draw_text(_tally_column_start_x + _current_score.current_x, _current_score_y, string(_current_score.tally));
		}
	
		// points
		draw_set_halign(fa_right);
		draw_set_color(c_white);
		draw_text(_points_column_start_x + _current_score.current_x, _current_score_y, _rounded_score);
		
		if (_current_score.current_x != 0 || _current_score.current_points != _current_score.points) {
			break;
		}
	}
}
