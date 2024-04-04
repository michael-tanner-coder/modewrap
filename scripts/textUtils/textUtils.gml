function draw_outlined_text(text_x, text_y, text_string, text_color, font, outline_distance, outline_color) {
	// ---- white text pass
	font_enable_effects(font, true, {
		enableOutline: true,
		outlineDistance: outline_distance,
		outlineColour: outline_color,
	});
	draw_set_color(outline_color);
	draw_text(text_x, text_y, text_string);
	
	// ---- color text pass
	font_enable_effects(font, true, {
		enableOutline: false,
		outlineDistance: 0,
	});
	draw_set_color(text_color);
	draw_text(text_x, text_y, text_string);
}