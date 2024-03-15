
var _start_x = 130;
var _center_x = 160;
var _start_y = 80;
var _text_margin_y = 25;
draw_set_colour(c_white);
draw_set_halign(fa_center);
draw_text(_center_x, _start_y - _text_margin_y, "HIGHSCORES");
draw_set_halign(fa_left);
for(var i = 0; i < array_length(_highscores); i++) {
	draw_text(_start_x, _start_y + (_text_margin_y * i), string(i+1) + ". " + string(_highscores[i]));
}

