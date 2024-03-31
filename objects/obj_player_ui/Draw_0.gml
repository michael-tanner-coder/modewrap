if (player_instance == undefined || player_instance == noone) {
	return;
}

var _ui_start_y = 100;
var _pillar_box_width = sprite_get_width(spr_black) * 6; // pillar box is currently scaled by a factor of 6
var _right_pillar_box_center = view_xport[0] + camera_get_view_width(view_camera[0]) - _pillar_box_width/2;
var _left_pillar_box_center = view_xport[0] + _pillar_box_width/2;

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

// // -- colored text
draw_set_color(_character.color);
draw_text(_character_text_x, _character_text_y, _character_string);

// Next Character UI
// -- next text
var _next_string = "NEXT";
var _next_text_x = _character_text_x;
var _next_text_y = _character_text_y * 4;
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