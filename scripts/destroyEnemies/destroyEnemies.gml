function destroy_enemies(){
	var _enemy_count = instance_number(obj_cannon) + instance_number(obj_crawlie) + instance_number(obj_bunny);
	pubsub_publish("all_monsters_defeated", _enemy_count);
	
	instance_destroy(obj_cannon);
	instance_destroy(obj_crawlie);
	instance_destroy(obj_bunny);
}