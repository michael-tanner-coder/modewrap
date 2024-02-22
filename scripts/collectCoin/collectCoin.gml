function collect_coin() {
    spawn_sparkles(
        other.x + other.sprite_width / 2,
        other.y + other.sprite_height / 2
    );

    instance_destroy(other.id);
	
    pubsub_publish("coin_collected", 0);
}
