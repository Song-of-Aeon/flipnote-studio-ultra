/// @description Insert description here
// You can write your code in this editor
if(count > length){
	instance_destroy();
}
else{
	var camx = camera_get_view_x(view_camera[0]);
	var camy = camera_get_view_y(view_camera[0]);
	var range = amplitude - amplitude*(count/length);
	camx += random_range(-range,range);
	camy += random_range(-range,range);
	camera_set_view_pos(view_camera[0],camx,camy);
}
count++;

//global.surfaces.gameOffset.x += seed.sign(amplitude);