function draw_outlined_text(text_x, text_y, text_string, text_color, font, outline_distance, outline_color) {
	// ---- white text pass
	font_enable_effects(font, true, {
		enableOutline: true,
		outlineDistance: outline_distance,
		outlineColour: outline_color,
	});
	draw_set_color(outline_color);
	draw_text(text_x, text_y, text_string);
	
	// // ---- color text pass
	font_enable_effects(font, true, {
		enableOutline: false,
		outlineDistance: 0,
	});
	draw_set_color(text_color);
	draw_set_font(font);
	draw_text(text_x, text_y, text_string);
	
	// var _scribble_obj = scribble(text_string);
	// _scribble_obj.starting_format("Header", text_color);
	// _scribble_obj.sdf_border(c_white, 4);
	// _scribble_obj.draw(text_x, text_y);
}