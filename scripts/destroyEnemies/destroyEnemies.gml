function destroy_enemies(){
	var _enemy_count = instance_number(Cannon) + instance_number(Crawlie) + instance_number(Bunny);
	pubsub_publish("all_monsters_defeated", _enemy_count);
	
	instance_destroy(Cannon);
	instance_destroy(Crawlie);
	instance_destroy(Bunny);
}