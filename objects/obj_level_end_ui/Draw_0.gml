/// @description Insert description here

// --- VICTORY UI ---
if (global.victory) {
    render_level_end_scores("VICTORY!", [points_gained, no_lives_lost, time_bonus, monsters_bonus, total], 30);
}

// // --- GAME OVER UI ---
if (global.game_over) {
    render_level_end_scores("GAME OVER!", [points_gained, final_score], 240);
}




