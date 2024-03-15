if (!activated) {
	draw_set_alpha(0.5);
}
else {
	draw_set_alpha(1);
}

draw_self();
var _sprite_animation_width = sprite_get_width(sprite_animation);
var _sprite_animation_height = sprite_get_height(sprite_animation);
var _center_x = x + sprite_width/2;
var _center_y = y+sprite_height/2;

draw_sprite(sprite_animation, sprite_anim_index,_center_x - _sprite_animation_width/2,_center_y-_sprite_animation_height/2);

draw_set_alpha(1);

if (highlighted) {
	draw_set_color(c_red);
	draw_rectangle(x,y,x+sprite_width-1, y+sprite_height-1, true);
	draw_set_color(c_white);
	draw_set_valign(fa_top);
	draw_text_ext(160, 150, description, 15, 190);
}

