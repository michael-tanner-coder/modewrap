if (iframes <= 0 && other.nonlethal_frames <= 0 && state != STATES.HURT) {
    take_damage_from_enemy();
    change_state(STATES.HURT);
}
