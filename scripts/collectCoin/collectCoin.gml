function collect_coin(){
	score += other.points;
		
	spawn_sparkles(other.x + other.sprite_width/2, other.y + other.sprite_height/2);
	
	instance_destroy(other.id);
	
	global.collected_coins += 1;
}