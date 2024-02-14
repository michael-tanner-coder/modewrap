scene_script = global.cutscenes[global.cutscene_index].scene_script;

script_index = 0;

typewriter = instance_create_layer(x,y,layer,Typewriter);
animation = instance_create_layer(x,y+50,layer,Animation);

depth = -10;
typewriter.depth = depth;
animation.depth = depth;

typewriter.content_text = scene_script[script_index].line;
animation.sprite_index = scene_script[script_index].animation;

var _player_data = loadFromJson("player_data.json");

progress_cutscene = function() {
	if (!typewriter.line_complete) {
		typewriter.autocomplete_text();
		return;
	}
	

	
	if (typewriter.line_complete && script_index >= array_length(scene_script) - 1) {
		if (global.cutscene_index == array_length(global.cutscenes) - 1) {
			room_goto(Scores);
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
}






