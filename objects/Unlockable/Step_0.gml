var inputs = global.input_sys.check(global.current_device);
if (highlighted && inputs.select.pressed) {
    var _enabled_modes = loadFromJson("enabled_modes.json");
    if (activated && array_length(_enabled_modes) <= 3) {
        return;
    }

    toggle_unlock();

    toggle_mode(mode);
}
