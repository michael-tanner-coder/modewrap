content_text = "test text ... test text";
rendered_text = "";
text_index = 1;
typing_speed = 10;
line_width = 80;
line_spacing = 15;
line_complete = false;

update_text = function() {
	if (text_index > string_length(content_text) || line_complete) {
		line_complete = true;
		return;
	}
	
	var _next_char = string_char_at(content_text, text_index);
	
	rendered_text = string_concat(rendered_text, _next_char);
	
	text_index += 1;
}

reset_text = function() {
	rendered_text = "";
	text_index = 1;
	line_complete = false;
}

autocomplete_text = function() {
	rendered_text = content_text;
	line_complete = true;
}

alarm_set(0, typing_speed);


