function calculate_gravity(_dt = 1) {
    var _vertical_speed = my_gravity + y_velocity + fall_speed;
    y += _vertical_speed * _dt;

    y_velocity += _dt;

    fall_speed += _dt;
    fall_speed = clamp(fall_speed, 2, max_fall_speed);

    if (y_velocity >= 0) {
        y_velocity = 0;
    }
}
