/// @func load_from_json(filename)

/// @desc Loads json file and turns it into struct and array nested data structure

/// @param {string} filename	The file to load

/// @return {struct/array}

/// @example load_from_json("save.json");

function load_from_json(filename) {
	var str = loadStringFromFile(filename);
	
	return is_string(str) ? json_parse(str) : {};
}