
function spawn_dust_particles(){
	if (!global.settings.particles) {
		return;
	}
	
	var _emitter = instance_create_layer(x,y,layer,obj_particle_emitter);
	part_particles_create(_emitter.particle_system, x,y+sprite_height, _emitter.dust_particles, 2);
	instance_destroy(_emitter);
}

function spawn_puff_particles(){
	if (!global.settings.particles) {
		return;
	}
	
	var _emitter = instance_create_layer(x+sprite_width/2,y+sprite_height/2,layer,obj_particle_emitter);
	part_particles_create(_emitter.particle_system, x+sprite_width/2,y+sprite_height/2, _emitter.puff_particles, 16);
	instance_destroy(_emitter);
}

function spawn_sparkles(particle_x,particle_y){
	if (!global.settings.particles) {
		return;
	}
	
	var _emitter = instance_create_layer(x,y,layer,obj_particle_emitter);
	part_particles_create(_emitter.particle_system, particle_x, particle_y, _emitter.spark_particles, 10);
	instance_destroy(_emitter);
}