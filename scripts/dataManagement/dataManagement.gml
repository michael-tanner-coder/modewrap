function reset_character_data() {
    var _default_modes = [CHARACTER.NORMAL, CHARACTER.BIG, CHARACTER.SMALL, CHARACTER.TALL];
    save_to_json(_default_modes, "unlocked_modes.json");
}
