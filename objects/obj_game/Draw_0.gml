var _ui_start_y = 100;
var _ui_start_x = 6;
var _pillar_box_width = sprite_get_width(spr_black) * 6;
var _left_pillar_box_center = view_xport[0] + _pillar_box_width / 2;

var _character = undefined;
var _character_color = c_white;
with(obj_player) {
	_character = get_character_properties();
	_character_color = _character.color;
}

if (_character == undefined) {
	return;
}

// GUI Font
draw_set_font(Header);

// Timer
// -- text
draw_set_halign(fa_center);
var _timer_header = "TIME";
var _timer_text_y = _ui_start_y * 4;
var _timer_text_x = _left_pillar_box_center;

// ---- white text pass
font_enable_effects(Header, true, {
	enableOutline: true,
	outlineDistance: 4,
	outlineColour: c_white,
});
draw_set_color(c_white);
draw_text(_left_pillar_box_center, _timer_text_y, _timer_header);

// ---- color text pass
font_enable_effects(Header, true, {
	enableOutline: false,
	outlineDistance: 0,
});
draw_set_color(_character_color);
draw_text(_left_pillar_box_center, _timer_text_y, _timer_header);

// -- time
draw_set_color(c_white);
var _timer_x = _left_pillar_box_center;
var _timer_y = _timer_text_y + font_get_size(Header) * 2;
draw_text(_timer_x, _timer_y, string(round(global.level_timer / 60)));

// Keys
var _keys_rendered = 1;
var _key_grid_y = 650;
for (var _i = 0; _i < key_rows; _i++) {
    if (_keys_rendered >= goal_coin_count) {
        break;
    }

    for (var _j = 0; _j < key_columns; _j++) {
    	var _total_columns_width = sprite_get_width(spr_key_outline) * key_columns;
        var _x = (_left_pillar_box_center - _total_columns_width / 2) + sprite_get_width(spr_key_outline) * _j;
        var _y = _key_grid_y + sprite_get_height(spr_key_outline) * _i;

        if (global.collected_coins >= _keys_rendered) {
            draw_sprite(spr_key, 0, _x, _y);
        } else {
            draw_sprite(spr_key_outline, 0, _x, _y);
        }

        _keys_rendered++;
    }
}

// Current Level
var _text_padding = 5;
var _level_key = global.levels[global.level_index].key;
if (_level_key == "BONUS") {
    draw_set_color(c_yellow);
    _level_key = "B";
}
draw_text(_left_pillar_box_center, _key_grid_y + key_rows * sprite_get_height(spr_key), _level_key);
