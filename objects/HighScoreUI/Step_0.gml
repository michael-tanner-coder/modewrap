var inputs = global.input_sys.check();

if (inputs.select.pressed) {
    menuModeTitle();
    menuSetPreset(e_menu_presets.title_screen);
    room = Title;
    room_goto(Title);
}
