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






