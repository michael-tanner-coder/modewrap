var _start_y = 48;
var _start_x = 264;

// Lives
for (var _i = 0; _i < lives; _i++) {
    draw_sprite_ext(
        spr_life,
        0,
        10 + (sprite_get_width(spr_life) + 4) * _i,
        24,
        1,
        1,
        image_angle,
        image_blend,
        image_alpha
    );
}

// Current mode
var _character = get_character_properties();
draw_set_font(Header);
draw_set_color(_character.color);
var _character_string = string_upper(_character.key);
draw_text(view_xport[0] + camera_get_view_width(view_camera[0]) - string_width(_character_string), _start_y, _character_string);

// Next mode
var _next_mode = mode_queue[mode_queue_index];
var _next_mode_sprite = global.mode_text_sprites[_next_mode].sprite;

draw_sprite_ext(
    spr_next_mode_text,
    0,
    _start_x,
    _start_y + 36,
    2,
    2,
    image_angle,
    image_blend,
    image_alpha
);

var _outline_x = _start_x;
var _outline_y = _start_y + 68;
var _sprite_character_width = sprite_get_width(_next_mode_sprite);
var _sprite_character_height = sprite_get_height(_next_mode_sprite);
var _center_x = _outline_x + sprite_get_width(spr_block_outline) / 2;
var _center_y = _outline_y + sprite_get_height(spr_block_outline) / 2;

draw_sprite_ext(
    spr_block_outline,
    0,
    _outline_x,
    _outline_y,
    1,
    1,
    image_angle,
    image_blend,
    image_alpha
);
draw_sprite_ext(
    _next_mode_sprite,
    0,
    _center_x - _sprite_character_width / 2,
    _center_y - _sprite_character_height / 2,
    1,
    1,
    image_angle,
    image_blend,
    image_alpha
);
