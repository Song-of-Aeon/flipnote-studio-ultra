function draw_stroke(x, y, x2, y2, width=1) {
	draw_sprite_ext(s_pixel, 1, x, y, point_distance(x, y, x2, y2), width/2, point_direction(x, y, x2, y2), draw_get_color(), draw_get_alpha());
}

function draw_ring(x, y, radius, filled=false, width=1, color=draw_get_color(), alpha=draw_get_alpha(), ang=90, angadd=360, sprite=s_truepixel, index=0, sides=ceil(radius/2+4), step=undefined) {
	draw_primitive_begin_texture(pr_trianglestrip, sprite_get_texture(sprite, index));
	var funkx;
	var funky;
	var i=0;
	var lineang = 360/sides;
	var inner = radius-width;
	if filled inner = 0;
	drawringcolor = color;
	drawringalpha = alpha;
	if step step = munction(step);
	funkx = (dsin(i+ang)%360);
	funky = (dcos(i+ang)%360);
	draw_vertex_texture_color(x+funkx*radius, y+funky*radius, 0, 0, drawringcolor, drawringalpha);
	draw_vertex_texture_color(x+funkx*inner, y+funky*inner, 0, 1, drawringcolor, drawringalpha);
	i += lineang;
	repeat(floor(angadd/lineang)) {
		if step step();
		funkx = (dsin(i+ang)%360);
		funky = (dcos(i+ang)%360);
		draw_vertex_texture_color(x+funkx*radius, y+funky*radius, i/angadd, 0, drawringcolor, drawringalpha);
		draw_vertex_texture_color(x+funkx*inner, y+funky*inner, i/angadd, 1, drawringcolor, drawringalpha);
		i += lineang;
	}
	funkx = (dsin(angadd+ang)%360);
	funky = (dcos(angadd+ang)%360);
	draw_vertex_texture_color(x+funkx*radius, y+funky*radius, 1, 0, drawringcolor, drawringalpha);
	draw_vertex_texture_color(x+funkx*inner, y+funky*inner, 1, 1, drawringcolor, drawringalpha);
	draw_primitive_end();
}


function draw_dot(x, y) {
	draw_sprite_ext(s_pixel, 0, x, y, 1, 1, 0, draw_get_color(), draw_get_alpha());
	pixellog(x, y);
}

#macro draw_line draw_stroke
#macro draw_line_width draw_stroke
//#macro draw_ring draw_ring
//#macro draw_point draw_dot
//#macro draw_ring draw_circle
/*
function shootyourself(dontcare) {
	return "im shooting";
}

#macro string shootyourself

log(string("im not shooting"));
*/