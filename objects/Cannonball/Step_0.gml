var _dt = delta_time / 1000000;

lifespan -= _dt;

if (lifespan <= 0) {
	instance_destroy(id);
}

