

// particles
particle_system = part_system_create();
dust_particles = part_type_create();
spark_particles = part_type_create();
puff_particles = part_type_create();
trail_particles = part_type_create();

// dust
part_type_sprite(dust_particles, spr_dust_cloud, 0,0,1);
part_type_size(dust_particles, 0.5,1, 0.001, 0);

part_type_direction(dust_particles, 0, 359, 0, 1);
part_type_speed(dust_particles, 0.1, 0.2, -0.004, 0);

part_type_life(dust_particles, 50,70);

part_type_orientation(dust_particles, 0, 359, 0.1,1,0);

part_type_alpha3(dust_particles, 0.1, 0.2,0.01);

// puffs
part_type_sprite(puff_particles, spr_dust_cloud, 0,0,1);
part_type_size(puff_particles, 0.5,1, 0.001, 0);

part_type_direction(puff_particles, 0, 359, 0, 1);
part_type_speed(puff_particles, 0.1, 0.2, -0.004, 0);

part_type_life(puff_particles, 50,70);

part_type_orientation(puff_particles, 0, 359, 0.1,1,0);

part_type_alpha3(puff_particles, 0.1, 0.2,0.01);

// sparkles
part_type_sprite(spark_particles, spr_sparkle, 0,0,1);

part_type_direction(spark_particles, 90, 100, 0, 1);
part_type_speed(spark_particles, 0.5, 1, -0.004, 0);

part_type_life(spark_particles, 50,70);


part_type_alpha3(spark_particles, 1, 0.5,0.01);

// trails
part_type_sprite(trail_particles, spr_white, 0, 0, 1);
part_type_size(trail_particles, 1, 1, 0, 0);
part_type_life(trail_particles, 20, 20);
part_type_alpha3(trail_particles, 0.2, 0.1, 0);
part_type_color1(trail_particles, c_white);

