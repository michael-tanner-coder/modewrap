var inputs = global.input_sys.check();

// continue cutscene
if (inputs.progress.pressed) {
    progress_cutscene();
}

// skip cutscene
if (inputs.skip.pressed) {
    room_goto(global.cutscenes[global.cutscene_index].next_level);
}
