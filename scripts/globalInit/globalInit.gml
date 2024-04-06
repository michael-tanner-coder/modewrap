// Global game state
global.paused = false;
global.intro = false;
global.settings = load_from_json("menu_save.json");

// Game object dimensions
#macro UNIT_SIZE 64
#macro SIZE_FACTOR 4

// Code snippets 

/*
Example usage:
    var _my_list = [1,2,3];
    FOREACH _my_list ELEMENT
        show_debug_message(string(_elem));
    END
*/
#macro FOREACH var _get_list = 
#macro ELEMENT ; for(var _i = 0; _i < array_length(_get_list); _i++) { \
    var _elem = _get_list[_i];
#macro END }