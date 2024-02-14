if (life <= 0) {
	instance_destroy(self);
}

if (nonlethal_frames <= 0) {
	y = other.warp_y - float_buffer;
	x = other.warp_x
	life -= 1;
}

nonlethal_frames = screenwrap_nonlethal_frames;



