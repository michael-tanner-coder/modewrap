/// @description Insert description here
var _score_system = obj_score_system;
if (_score_system == undefined) {
    return;
}

// --- VICTORY UI --- 
if (global.victory) {
    render_level_end_scores("VICTORY!", [_score_system.base_score, _score_system.no_lives_lost_score, _score_system.time_bonus, _score_system.monsters_bonus, _score_system.total], 30);
}

// // --- GAME OVER UI ---
if (global.game_over) {
    render_level_end_scores("GAME OVER!", [_score_system.base_score, _score_system.final_score], 240);
}




