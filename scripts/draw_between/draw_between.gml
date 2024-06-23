function draw_between(x, y, x2, y2, spr, index=0, xscale=1, yscale=1, angle=0, color=c_white, alpha=draw_get_alpha(), antialiased=false) {
	var fulldist = point_distance(x, y, x2, y2);
	var dir = point_direction(x, y, x2, y2);
	var dist = 0;
	var dude;
	while dist <= fulldist {
		dude = distabs(dir, dist++);
		draw_spr(x+dude.x, y+dude.y, spr, index, xscale, yscale, angle, color, alpha, antialiased);
	}
	return dist;
}