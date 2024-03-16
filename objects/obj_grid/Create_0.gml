data = load_from_json("unlocked_modes.json");

total_grid_width = columns * (32 + grid_item_spacing);
start_x = camera_get_view_width(view_camera[0])/2 - total_grid_width/2;
start_y = y;

grid_item_count = 0;
max_grid_item_count = array_length(data);

grid = ds_grid_create(columns, rows);

x_index = 0;
y_index = 0;

enabled_modes = load_from_json("enabled_modes.json");

if (!is_array(enabled_modes)) {
	enabled_modes = ["normal", "big"];
}

for (i = 0; i < rows; i++) {
	for (j = 0; j < columns; j++) {
		if (grid_item_count >= max_grid_item_count) { continue; }
		var _item_height = 32;
		var _item_width = 32;
		var _grid_object = instance_create_layer(start_x + (_item_height + grid_item_spacing) * j, start_y + (_item_width + grid_item_spacing) * i, layer, grid_item);
		_grid_object.set_data(data[grid_item_count]);
		
		if (!array_contains(enabled_modes, _grid_object.mode)) {
			_grid_object.toggle_unlock();
		}
		
		grid_item_count += 1;
		ds_grid_set(grid, j, i, _grid_object);
	}
}

var _current_grid_object = ds_grid_get(grid, x_index, y_index);
_current_grid_object.selected = true;

move_grid_cursor = function(_new_x, _new_y) {
	if (_new_x >= columns) {
		_new_x = 0;
	}
	
	if (_new_y >= rows) {
		_new_y = 0;
	}
	
	if (_new_x < 0) {
		_new_x = columns-1;
	}
	
	if (_new_y < 0) {
		_new_y = rows - 1;
	}
	
	if (ds_grid_get(grid, _new_x, _new_y) == 0) {
		return;
	}
	
	ds_grid_get(grid,x_index, y_index).highlighted = false;
	
	x_index = _new_x;
	y_index = _new_y;
	
	ds_grid_get(grid,x_index, y_index).highlighted = true;
}


