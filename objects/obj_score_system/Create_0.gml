score = 0;
combo_bonus = 0;
combo_bonus_increment = 0.2;
default_score_multiplier = 1;
combo_timer = 0;
time_to_continue_combo = 150;
coin_points = 100;
monster_points = 10;
monsters_defeated = 0;
no_lives_lost = true;
base_time_bonus = 100;
base_monster_bonus = 5;
base_no_lives_lost_bonus = 1000;
points_accrued = 0;

points_gained = {
	label: "POINTS GAINED",
	tally: undefined,
	points: 100,
	current_points: 0,
	current_x: -1000, 
};

no_lives_lost_score = {
	label: "NO LIVES LOST",
	tally: undefined,
	points: 1000,
	current_points: 0,
	current_x: -1000, 
};

time_bonus = {
	label: "TIME BONUS",
	tally: "10 s",
	points: 1000,
	current_points: 0,
	current_x: -1000, 
};

monsters_bonus = {
	label: "MONSTERS DEFEATED",
	tally: 5,
	points: 1000,
	current_points: 0,
	current_x: -1000, 
};

total = {
	label: "TOTAL SCORE",
	tally: undefined,
	points: 2125,
	current_points: 0,
	current_x: -1000, 
};

final_score = {
	label: "FINAL SCORE", 
	tally: undefined,
	current_points: 0,
	points: 100,
	current_x: -1000, 
}

// Events
pubsub_subscribe("coin_collected", function () {
    combo_timer = time_to_continue_combo;
    points_accrued += coin_points * (default_score_multiplier + combo_bonus);
    combo_bonus += combo_bonus_increment;
});

pubsub_subscribe("monster_defeated", function () {
    combo_timer = time_to_continue_combo;
    points_accrued += monster_points * (default_score_multiplier + combo_bonus);
    combo_bonus += combo_bonus_increment;
    monsters_defeated += 1;
});

pubsub_subscribe("all_monsters_defeated", function (number_of_monsters_defeated) {
    combo_timer = time_to_continue_combo;
    points_accrued += (monster_points * (default_score_multiplier + combo_bonus)) * number_of_monsters_defeated;
    combo_bonus += combo_bonus_increment;
    monsters_defeated += number_of_monsters_defeated;
});

pubsub_subscribe("life_lost", function () {
    no_lives_lost = false;
});

pubsub_subscribe("level_over", function () {
    var _total_seconds_of_level = 60 * global.levels[global.level_index].time_limit;
    var _time_spent_on_level = _total_seconds_of_level - global.level_timer;
    var _time_bonus = (_total_seconds_of_level / _time_spent_on_level) * base_time_bonus;
    var _monster_bonus = monsters_defeated * base_monster_bonus;
    var _no_lives_lost_bonus = no_lives_lost ? base_no_lives_lost_bonus : 0;
    var _total_score = _no_lives_lost_bonus + _time_bonus + _monster_bonus + points_accrued;
    points_gained.points = points_accrued;
    score += _total_score;
    
    show_debug_message("Points Accrued: " + string(points_accrued));
    show_debug_message("Monsters Defeated: " + string(monsters_defeated));
    show_debug_message("No Lives Lost?: " + string(no_lives_lost));
    show_debug_message("Time to Finish Level: " + string(_time_spent_on_level));
    show_debug_message("Level Score: " + string(_total_score));
    show_debug_message("Total Score: " + string(score));
});
