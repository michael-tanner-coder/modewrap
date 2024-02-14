// continue cutscene
if (keyboard_check_pressed(vk_space)) {
	progress_cutscene();
}

// skip cutscene
if (keyboard_check_pressed(vk_enter)) {
	room_goto(global.cutscenes[global.cutscene_index].next_level);
}