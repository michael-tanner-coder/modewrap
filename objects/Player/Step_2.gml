// Jump Buffer
if (jump_buffer_time > 0) {
    jump_buffer_time -= 1;
}

// Game Over
if (lives <= 0) {
    state = STATES.GAME_OVER;
}

// Health
if (health <= 0) {
    x = room_width / 2;
    y = -50;
    lives -= 1;
    health = 1;
    iframes = 60;
    //instance_create_layer(x, 40, layer, RespawnPlatform);
}
