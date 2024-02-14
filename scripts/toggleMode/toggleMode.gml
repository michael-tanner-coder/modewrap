function toggle_mode(_mode){
	var _enabled_modes = loadFromJson("enabled_modes.json");
	toggled_mode = _mode;
	
	if (!is_array(_enabled_modes)) {
		_enabled_modes = ["normal", "big"];
	}
	
	if (array_contains(_enabled_modes, _mode)) {
		var _index = array_find_index(_enabled_modes, function(_element) {return _element == toggled_mode;});
		array_delete(_enabled_modes, _index, 1);
	}
	else {
		array_push(_enabled_modes, _mode);	
	}
	
	saveToJson(_enabled_modes, "enabled_modes.json");
	
	delete toggled_mode;
}