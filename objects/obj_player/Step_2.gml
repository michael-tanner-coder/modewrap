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
    lives -= 1;
    health = 1;
    pubsub_publish("life_lost", 0);
}
