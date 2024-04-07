/// @description Insert description here

// Level Reset
if (keyboard_check_pressed(vk_backspace)) {
	room_restart();
}

// Level Quick Select
var _is_number = string_digits(keyboard_lastchar);

if (string_length(_is_number)) { 
	show_debug_message(_is_number);
	var _selected_number = real(_is_number) - 1;
	
	if (_selected_number <= array_length(debug_levels) - 1) {
	    selected_level_key = debug_levels[_selected_number];
	    var _f = function(_element) {
	        return _element.key == selected_level_key;
	    }
	    
	    var _selected_level_index = array_find_index(global.levels, _f);
	    
	    if (_selected_level_index == -1) {
            return;	        
	    }
	    
	    var _selected_level = global.levels[_selected_level_index];
	    
	    room_goto(_selected_level.map);
	    global.level_index = _selected_level_index;
	}
	
	keyboard_lastchar = "";
}

// Character Quick Select
if (keyboard_check_pressed(ord("E")) || keyboard_check_pressed(ord("Q"))) {
    debug_character_queue_index += keyboard_check_pressed(ord("E")) ? 1 : -1;
    var _character_count = array_length(global.mode_properties);
    
    if (debug_character_queue_index > _character_count - 1) {
        debug_character_queue_index = 0;
    }
    
    if (debug_character_queue_index < 0) {
        debug_character_queue_index = _character_count - 1;
    }
    
    var _next_character =  debug_character_queue_index;
    with (obj_player) {
        change_character(_next_character);
    }
}

