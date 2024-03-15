if (pushed) {
	pubsub_publish("monster_defeated", 0);
	instance_destroy(other);
}
