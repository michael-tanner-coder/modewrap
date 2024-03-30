// movement
xspd = 1 * SIZE_FACTOR;
yspd = 0 * SIZE_FACTOR;
original_xspd = xspd;
my_gravity = 0.25 * SIZE_FACTOR;
move_speed = 1 * SIZE_FACTOR;
y_velocity = 1 * SIZE_FACTOR;
fall_speed = 0.5 * SIZE_FACTOR;
max_fall_speed = 0.5 * SIZE_FACTOR;

// state
grounded = false;
float_buffer = 8;
life = 6;

// iframes/nonlethal frames
screenwrap_nonlethal_frames = 60;
nonlethal_frames = screenwrap_nonlethal_frames;
nonlethal_frames = 0;