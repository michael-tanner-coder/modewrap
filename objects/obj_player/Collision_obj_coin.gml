collect_coin();

global.level_timer += 60;

points_to_next_life += other.points;
if (points_to_next_life >= 1000) {
	lives += 1;
	points_to_next_life = 0;
}
	
if (lives > max_lives) {
	lives = max_lives;
}



