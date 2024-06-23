// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function lerp_angle(a,b,val){
	return a - (angle_difference(a,b) / (1/ val));
}

function lerp_hue(a, b, val) {
	return a - (angle_difference(a/255*360, b/255*360) / (1/(val/255*360)));
}
function lerp_color(a, b, val) {
	var r = color_get_red(a);
	var g = color_get_green(a);
	var Blue = color_get_blue(a);
	var r2 = color_get_red(b);
	var g2 = color_get_green(b);
	var b2 = color_get_blue(b);
	return make_color_rgb(
		lerp(r, r2, val),
		lerp(g, g2, val),
		lerp(Blue, b2, val),
	);
}

function gradient(colors, progress) {
	progress %= 1;
	var color = floor(progress/array_length(colors));
	progress %= 1/array_length(colors);
	lerp_color(colors[color], colors[color+1], progress);
}