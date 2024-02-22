if (iframes <= 0 && other.nonlethal_frames <= 0 && state != states.hurt) {
    take_damage_from_enemy();
    change_state(states.hurt);
}
