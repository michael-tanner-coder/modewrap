var inputs = global.input_sys.check(global.current_device);

if (inputs.right.pressed) {
    move_grid_cursor(x_index + 1, y_index);
}

if (inputs.left.pressed) {
    move_grid_cursor(x_index - 1, y_index);
}

if (inputs.up.pressed) {
    move_grid_cursor(x_index, y_index - 1);
}

if (inputs.down.pressed) {
    move_grid_cursor(x_index, y_index + 1);
}
