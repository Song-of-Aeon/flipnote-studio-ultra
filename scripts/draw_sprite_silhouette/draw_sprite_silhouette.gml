// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function start_silhouette(color,alpha = 255){
	var unicolor = shader_get_uniform(z_encoloren,"color");
	var unialpha = shader_get_uniform(z_encoloren, "alpha");
	shader_set(z_encoloren);
	shader_set_uniform_f(unicolor,	color_get_red(color)/255,color_get_green(color)/255,color_get_blue(color)/255);
	shader_set_uniform_f(unialpha,alpha/255);
}

function stop_silhouette(){
	shader_reset()
}