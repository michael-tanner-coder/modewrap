
function spawn_dust_particles(){
	var _emitter = instance_create_layer(x,y,layer,ParticleEmitter);
	part_particles_create(_emitter.particle_system, x,y, _emitter.dust_particles, 10);
}