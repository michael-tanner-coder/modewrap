/// @description Insert description here
var _pillar_box_width = sprite_get_width(spr_black) * 6;
var _left_pillar_box_center = view_xport[0] + _pillar_box_width / 2;

var _start_y = 100;
var _start_x = _left_pillar_box_center;

draw_set_font(Header);
draw_set_color(c_white);
draw_text(_start_x, _start_y, "SCORE");

draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_text(_start_x, _start_y + font_get_size(Header) * 2, string(points_accrued));






