/// @description Insert description here

// --- VICTORY UI ---
if (global.victory) {
    render_level_end_scores("VICTORY!", [_points_gained, _no_lives_lost, _time_bonus, _monsters_bonus, _total], 30);
}

// // --- GAME OVER UI ---
if (global.game_over) {
    render_level_end_scores("GAME OVER!", [_points_gained, _final_score], 240);
}




