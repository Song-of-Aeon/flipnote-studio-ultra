global.performanceMode = false;
nu bullet("particle", s_null, 0, false, NaN, 1, function() {
		size -= .25;
		if !size instance_destroy();
	draw_set_color(color);
	draw_ring(x, y, size, false, 1);
	//draw_spr(x, y, s_mistake);
	draw_set_color(c_white);
});

function Particle(x,y,draw=bul.particle.draw,blendmode = bm_normal,color = c_white,dir = random_range(0,360),spd = 0,grav = 0,surface = application_surface) {
	if(global.performanceMode){
		return global.dummyBullet;
	}
	var boul = shoot(x, y, spd, dir, bul.particle, color, u, draw, blendmode == bm_add, true);
	boul.escapedistance = 11;
	boul.die = instance_destroy;
	boul.particling = true;
	return boul;
}
function Spriticle(x,y,sprite,blendmode,color,dir,spd,grav,spin,surface){
	var spriticleDraw = function(){
		//cant use image_angle because bullets overwrite it.
		draw_spr(x,y,sprite_index,image_index,image_xscale,image_yscale,image_rotation,color,image_alpha,false);	
		image_rotation += spin;
		var components = distabs(dir,spd);
		components.y += grav/10;
		dir = darctan2(-components.y,components.x);
		spd = point_distance(0,0,components.x,components.y);
	}
	var part = Particle(x,y,spriticleDraw,blendmode,color,dir,spd,grav,surface);
	part.sprite_index = sprite;
	part.grav = grav;
	part.spin = spin;
	part.image_rotation = dir + 90; //make it initially right
	return part;
}
function create_particle_simple(x,y,sprite){
	function drawFunc(){
		gpu_set_blendmode(blendmode)
		draw_set_alpha(0.1)
		draw_sprite(sprite,0,x,y);
		draw_set_alpha(1)
		//update()
	}
	var part = Particle(x,y,drawFunc,bm_add,noone,random_range(0,360),random_range(1,2)/20,1/20);
	part.sprite = sprite
	return part
}

function create_particle_hole(x,y,size){
	function drawFunc(){
		draw_set_color($009999)
		//surface_set_target(global.surfaces.screen2)
		draw_ring(x,y,size,false);
		//surface_reset_target()
		//update()
	}
	var part = Particle(x,y,drawFunc,bm_add,noone,random_range(0,360),random_range(1,2)/20,1/20);
	part.size = size
	return part;
}