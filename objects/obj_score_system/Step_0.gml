/// @description Insert description here
// Reset combo bonus when timer runs out
combo_timer -= 1;
if (combo_timer <= 0) {
    combo_bonus = 0;
    combo_timer = 0;
}

if (points_accrued > 9999) {
	points_accrued = 9999;
}

