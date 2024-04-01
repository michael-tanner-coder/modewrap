/// @description Insert description here
// Score Drawing
// -- positioning
var _pillar_box_width = sprite_get_width(spr_black) * 6;
var _left_pillar_box_center = view_xport[0] + _pillar_box_width / 2;
var _start_y = 100;
var _start_x = _left_pillar_box_center;

// -- character-specific coloring
var _character = undefined;
var _character_color = c_white;
with(obj_player) {
	_character = get_character_properties();
	_character_color = _character.color;
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
draw_text(_start_x, _start_y, _score_header);

// ---- color text pass
font_enable_effects(Header, true, {
	enableOutline: false,
	outlineDistance: 0,
});
draw_set_color(_character_color);
draw_text(_start_x, _start_y, _score_header);

// -- score number
draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_set_color(c_white);
draw_text(_start_x, _start_y + font_get_size(Header) * 2, string(points_accrued));


// Score Table on Victory Screen
// if (!global.victory) {
// 	return;
// }
// -- background underlay
var _victory_ui_x = view_xport[0] + _pillar_box_width;
var _victory_ui_y = 264;
var _block_width = sprite_get_width(spr_black);
var _game_area_width = camera_get_view_width(view_camera[0]) - _pillar_box_width * 2;
var _block_scale_width = _game_area_width / _block_width;
var _block_scale_height = 8;
draw_sprite_ext(spr_black, 0, _victory_ui_x, _victory_ui_y, _block_scale_width, _block_scale_height, image_angle, image_blend, 0.6);

// -- victory header
var _victory_header = "VICTORY!";
var _victory_text_x = _victory_ui_x + (_block_scale_width * _block_width) / 2;
var _victory_text_y = _victory_ui_y + 40;
draw_set_halign(fa_center);

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

draw_set_font(Paragraph);
for(var _i = 0; _i < array_length(score_structs); _i++) {
	var _current_score = score_structs[_i];
	var _current_score_y = _labels_column_start_y + ((_text_size + _text_y_margin) * _i);
	
	// label
	draw_set_halign(fa_left);
	
	// -- white text pass
	font_enable_effects(Paragraph, true, {
		enableOutline: true,
		outlineDistance: 4,
		outlineColour: c_white,
	});
	draw_set_color(c_white);
	draw_text(_labels_column_start_x, _current_score_y, _current_score.label);
	
	// -- color text pass
	font_enable_effects(Paragraph, true, {
		enableOutline: false,
		outlineDistance: 0,
	});
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


// -- bonuses

// -- total score










