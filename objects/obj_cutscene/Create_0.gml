scene_script = global.cutscenes[global.cutscene_index].scene_script;

script_index = 0;

typewriter = instance_create_layer(x, y - 40, layer, obj_typewriter);
animation = instance_create_layer(x + 120, y + 50, layer, obj_animation);

depth = -10;
typewriter.depth = depth;
animation.depth = depth;

typewriter.content_text = scene_script[script_index].line;
animation.sprite_index = scene_script[script_index].animation;

// Unlock a new character if they are available for this cutscene
var _current_modes = load_from_json("unlocked_modes.json");
var _new_character = global.cutscenes[global.cutscene_index].character_unlock;

if (is_array(_current_modes) && _new_character != undefined && !array_contains(_current_modes, _new_character)) {
    array_push(_current_modes, _new_character);
    save_to_json(_current_modes, "unlocked_modes.json");
}

var _player_data = load_from_json("player_data.json");

progress_cutscene = function () {
    if (!typewriter.line_complete) {
        typewriter.autocomplete_text();
        return;
    }

    if (
        typewriter.line_complete &&
        script_index >= array_length(scene_script) - 1
    ) {
        if (global.cutscene_index == array_length(global.cutscenes) - 1) {
            room_goto(rm_scores);
            return;
        }

        room_goto(global.cutscenes[global.cutscene_index].next_level);
        return;
    }

    if (typewriter.line_complete) {
        script_index++;
        typewriter.content_text = scene_script[script_index].line;
        typewriter.reset_text();
        animation.sprite_index = scene_script[script_index].animation;
    }
};
