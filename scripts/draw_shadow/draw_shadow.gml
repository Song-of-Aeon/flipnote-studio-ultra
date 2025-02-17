// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_sprite_shadow(sprite,index,x,y,width=sprite_get_width(sprite),height=sprite_get_height(sprite),color = 0,blurRadius = 1,margin = 40, shadowstrength=1){

	var flipSurf = surface_create(width+margin*2,height+margin*2);
	var flopSurf = surface_create(width+margin*2,height+margin*2);
	var offset = new vec2(sprite_get_xoffset(sprite), sprite_get_yoffset(sprite));

	var uniRez = shader_get_uniform(z_gauss13,"resolution")
	var uniDir = shader_get_uniform(z_gauss13,"direction")


	surface_set_target(flopSurf);
	draw_clear_alpha(c_black,0);
	//var spinfo = sprite_get_info(sprite)
	var xscale = width/sprite_get_width(sprite);
	var yscale = height/sprite_get_height(sprite);
	draw_sprite_stretched(sprite,index,margin,margin,width,height);
	surface_reset_target()

	shader_set(z_gauss13);
	var funky = shader_get_uniform(z_gauss13, "shadowstrength");
	shader_set_uniform_f(funky, shadowstrength);
	gpu_set_blendmode(bm_add);
	gpu_set_blendmode_ext(bm_one,bm_src_alpha_sat)
	var iterations = 10;
	//gpu_set_blendmode_ext_sepalpha(bm_src_alpha,bm_dest_alpha,bm_src_alpha,bm_dest_alpha)
	for(var i = 0; i < iterations; i++){
		surface_set_target(i%2 ? flopSurf : flipSurf);
		draw_clear_alpha(c_black,0);
	
		var len = blurRadius;
		var d = distabs((360/iterations)*i,len)
	
		shader_set_uniform_f(uniRez,width,height);
		shader_set_uniform_f(uniDir,d.x,d.y);

		draw_surface(i%2 ? flipSurf : flopSurf,0,0);

		surface_reset_target();
	}
	gpu_set_blendmode(bm_normal);

	//gpu_set_blendmode(bm_normal)
	shader_reset()
	
	if color != -1 {
		shader_set(z_colorify);
		shader_set_uniform_f(shader_get_uniform(z_colorify,"color"),color_get_red(color),color_get_green(color),color_get_blue(color));
		draw_surface_stretched(flopSurf,x-margin-offset.x,y-margin-offset.y,width+margin*2,height+margin*2);
		shader_reset();
	} else {
		draw_surface_stretched(flopSurf,x-margin-offset.x,y-margin-offset.y,width+margin*2,height+margin*2);
	}
	
	surface_free(flipSurf);
	surface_free(flopSurf);
}


function draw_surface_shadow(surface, x, y, color=c_black, blurRadius=1, margin=0,iterations = 4, xscale=1, yscale=1, shadowstrength = global.shadowstrength,blurResolution = 0.5) {
	if shadowstrength <= 0 exit; //if theres no strength, no point in drawing the whole surface
	blurRadius /= xscale;
	//blurRadius/= blurResolution
	//blurRadius*= 0.8
	var width = surface_get_width(surface);
	var height = surface_get_height(surface);
	var flipSurf = surface_create((blurResolution*width)+margin*2,(blurResolution*height)+margin*2);
	var flopSurf = surface_create((blurResolution*width)+margin*2,(blurResolution*height)+margin*2);

	var uniRez = shader_get_uniform(z_gauss5,"resolution")
	var uniDir = shader_get_uniform(z_gauss5,"direction")
	
	surface_set_target(flopSurf);
	draw_clear_alpha(c_black,0);
	
	draw_surface_stretched(surface, margin, margin, surface_get_width(flopSurf)-margin,surface_get_height(flopSurf)-margin);
	surface_reset_target();
	gpu_set_tex_repeat(false)
	shader_set(z_gauss5);
	var funky = shader_get_uniform(z_gauss5, "shadowstrength");
	var scaledStrength = ((shadowstrength-1)/iterations)+1; //if you dont scale shadow strength, it gets applied every time the gauss shader flips and flops.
	shader_set_uniform_f(funky, shadowstrength);
	gpu_set_blendmode(bm_add);
	gpu_set_blendmode_ext(bm_one,bm_src_alpha_sat);
	for(var i = 0; i < iterations; i++){
		surface_set_target(i%2 ? flopSurf : flipSurf);
		draw_clear_alpha(c_black,0);
	
		var len = blurRadius;
		var d = distabs((360/iterations)*i,len);
	
		shader_set_uniform_f(uniRez,width,height);
		shader_set_uniform_f(uniDir,d.x,d.y);
		//gpu_set_blendmode_ext_sepalpha(bm_src_alpha, bm_inv_src_alpha, bm_one, bm_inv_src_alpha)
		draw_surface(i%2 ? flipSurf : flopSurf,0,0);
		//gpu_set_blend_mode(bm_normal)
		surface_reset_target()
	}
	gpu_set_blendmode(bm_normal);
	shader_reset()
	gpu_set_tex_filter(true) //make it blurry
	if color != -1 {
		shader_set(z_colorify);
		shader_set_uniform_f(shader_get_uniform(z_colorify,"color"),color_get_red(color),color_get_green(color),color_get_blue(color));
		draw_surface_stretched(flopSurf,x-(margin*2),y-(margin*2),(width+margin)*xscale,(height+margin)*yscale);
		shader_reset();
	} else {
		draw_surface_stretched(flopSurf,x-(margin*2),y-(margin*2),(width+margin)*xscale,(height+margin)*yscale);
	}
	gpu_set_tex_filter(false)
	gpu_set_tex_repeat(true)
	surface_free(flipSurf);
	surface_free(flopSurf);
}

function draw_text_shadow(x,y,text,color = c_black,blurRadius = 1,margin = 40){
	var textSurf = surface_create(string_width(text),string_height(text));
	surface_set_target(textSurf);
	draw_text(0,0,text);
	surface_reset_target()
	var surfw = surface_get_width(textSurf);
	var surfh = surface_get_height(textSurf)
	var textSurfSprite = sprite_create_from_surface(textSurf,0,0,surfw,surfh,false,false,0,0);
	
	draw_sprite_shadow(textSurfSprite,0,x,y,surfw,surfh,color,blurRadius,margin);
	surface_free(textSurf);
	sprite_delete(textSurfSprite);
}