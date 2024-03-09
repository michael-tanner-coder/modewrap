combo_bonus = 0;
combo_bonus_increment = 0.2;
default_score_multiplier = 1;
combo_timer = 0;
time_to_continue_combo = 150;
coin_points = 100;
monster_points = 10;

// Events
pubsub_subscribe("coin_collected", function () {
    combo_timer = time_to_continue_combo;
    score += coin_points * (default_score_multiplier + combo_bonus);
    combo_bonus += combo_bonus_increment;
});

pubsub_subscribe("monster_defeated", function () {
    combo_timer = time_to_continue_combo;
    score += monster_points * (default_score_multiplier + combo_bonus);
    combo_bonus += combo_bonus_increment;
});

pubsub_subscribe("all_monsters_defeated", function (number_of_monsters_defeated) {
    combo_timer = time_to_continue_combo;
    score += (monster_points * (default_score_multiplier + combo_bonus)) * number_of_monsters_defeated;
    combo_bonus += combo_bonus_increment;
});
