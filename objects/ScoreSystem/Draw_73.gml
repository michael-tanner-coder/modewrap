/// @description Insert description here
var _start_y = 48;
var _start_x = 6;

draw_set_font(Header);
draw_set_color(c_white);

draw_sprite_ext(
    spr_score_text,
    0,
    _start_x,
    _start_y,
    2,
    2,
    image_angle,
    image_blend,
    image_alpha
);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_text(_start_x, _start_y + 11, string(points_accrued));






