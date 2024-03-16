/// @func save_to_json(struct/array)

/// @desc Saves a stuct/array nested datat structure to a file.

/// @param {struct/array}	struct/array	The stuct/array nested datat structure to be saved
/// @param {string}			filename		The name under the file will be saved

/// @return {undefined} N/A

/// @example save_to_json(player_data, "player_save.json");

function save_to_json(struct_or_array, filename){
	var str = json_stringify(struct_or_array);
	saveStringToFile(str, filename);
}