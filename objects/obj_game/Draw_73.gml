var _ui_start_y = 100;
var _ui_start_x = 6;
var _pillar_box_width = sprite_get_width(spr_black) * 6;
var _left_pillar_box_center = view_xport[0] + _pillar_box_width / 2;

// GUI Font
draw_set_font(Header);
draw_set_color(c_white);

// Timer
// -- text
var _timer_text_y = _ui_start_y * 4;
var _timer_text_x = _left_pillar_box_center;
draw_text(_left_pillar_box_center, _timer_text_y, "TIME");

// -- time
var _timer_x = _left_pillar_box_center;
var _timer_y = _timer_text_y + font_get_size(Header) * 2;
draw_set_color(c_white);
draw_text(_timer_x, _timer_y, string(round(global.level_timer / 60)));

// Coins
var _coins_rendered = 1;
for (var _i = 0; _i < coin_rows; _i++) {
    if (_coins_rendered >= goal_coin_count) {
        break;
    }

    for (var _j = 0; _j < coin_columns; _j++) {
        var _x = _ui_start_x + sprite_get_width(spr_coin_outline) * _j;
        var _y = _ui_start_y + 79 + sprite_get_height(spr_coin_outline) * _i;

        if (global.collected_coins >= _coins_rendered) {
            draw_sprite_ext(
                spr_coin,
                0,
                _x,
                _y,
                1,
                1,
                image_angle,
                image_blend,
                image_alpha
            );
        } else {
            draw_sprite_ext(
                spr_coin_outline,
                0,
                _x,
                _y,
                1,
                1,
                image_angle,
                image_blend,
                image_alpha
            );
        }

        _coins_rendered++;
    }
}

// Current Level
var _text_padding = 5;
var _level_key = global.levels[global.level_index].key;
if (_level_key == "BONUS") {
    draw_set_color(c_yellow);
    _level_key = "B";
}
draw_text(_ui_start_x + _text_padding, _ui_start_y + 136, _level_key);
