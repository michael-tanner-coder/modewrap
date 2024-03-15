var inputs = global.input_sys.check(global.current_device);

if (inputs.select.pressed) {
    menuModeTitle();
    menuSetPreset(e_menu_presets.title_screen);
    room = Title;
    room_goto(Title);
}
