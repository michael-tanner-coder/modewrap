

// particles
particle_system = part_system_create();
dust_particles = part_type_create();
part_type_sprite(dust_particles, spr_dust_cloud, 0,0,1);
part_type_size(dust_particles, 1,1.5, 0.001, 0);

part_type_direction(dust_particles, 0, 359, 0, 1);
part_type_speed(dust_particles, 0.1, 0.2, -0.004, 0);

part_type_life(dust_particles, 50,70);

part_type_orientation(dust_particles, 0, 359, 0.1,1,0);

part_type_alpha3(dust_particles, 0.1, 0.2,0.01);
