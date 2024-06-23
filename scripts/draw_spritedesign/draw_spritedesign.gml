function draw_spritedesign(x, y, rotation, design, xinterval, yinterval, interpolation=1, xorigin=u, yorigin=u, colors=c_white) {
	var i, j;
	var shootx, shooty;
	var mycol;
	if xorigin == u {
		xorigin = floor((array_length(design[0])-1)/2);
		yorigin = floor((array_length(design)-1)/2);
	}
	for (i=0; i<array_length(design)*interpolation; i++) {
		var halflength = (array_length(design[floor(i/interpolation)])-1)/2;
		for (j=0; j<array_length(design[floor(i/interpolation)])*interpolation; j++) {
			if design[floor(i/interpolation)][floor(j/interpolation)] {
				var fii = floor(i/interpolation);
				var fij = floor(j/interpolation);
				if typeof(colors) == "array" mycol = colors[design[fii][fij]-1] else mycol = colors;
				shootx = x+(j-xorigin*interpolation)*xinterval-halflength*xinterval;
				shooty = y+(i-yorigin*interpolation)*yinterval-halflength*yinterval;
				var dist = point_distance(x, y, shootx, shooty);
				var dir = point_direction(x, y, shootx, shooty);
				var dude = distabs(dir+rotation, dist);
				shootx = x+dude.x;
				shooty = y+dude.y;
				draw_set_color(mycol);
				draw_point(shootx, shooty);
			}
		}
	}
}