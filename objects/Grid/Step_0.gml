if (keyboard_check_pressed(vk_right)) {
    move_grid_cursor(x_index + 1, y_index);
}

if (keyboard_check_pressed(vk_left)) {
    move_grid_cursor(x_index - 1, y_index);
}

if (keyboard_check_pressed(vk_up)) {
    move_grid_cursor(x_index, y_index - 1);
}

if (keyboard_check_pressed(vk_down)) {
    move_grid_cursor(x_index, y_index + 1);
}
