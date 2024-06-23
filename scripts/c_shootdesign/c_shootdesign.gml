///@func c_shootdesign(x, y, speed, rotation, bulletdir, design, xinterval, yinterval, types, interpolation=1, xorigin=u, yorigin=u, colors=c_white, behaviors=c_null, draw=c_bulletdraw, flat=false, additive=false, silent=false);
function shootdesign(x, y, speed, rotation, bulletdir, design, xinterval, yinterval, types, interpolation=1, xorigin=u, yorigin=u, colors=c_white, behaviors=c_null, draw=bulletdraw, flat=false) {
	var i, j;
	var shootx, shooty;
	var mytype, mycol, mybehave, mydraw;
	var bullets = [];
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
				if typeof(types) == "array" mytype = types[design[fii][fij]-1] else mytype = types;
				if typeof(colors) == "array" mycol = colors[design[fii][fij]-1] else mycol = colors;
				if typeof(behaviors) == "array" mybehave = behaviors[design[fii][fij]-1] else mybehave = behaviors;
				if typeof(draw) == "array" mydraw = draw[design[fii][fij]-1] else mydraw = draw;
				shootx = x+(j-xorigin*interpolation)*xinterval-halflength*xinterval;
				shooty = y+(i-yorigin*interpolation)*yinterval-halflength*yinterval;
				var dist = point_distance(x, y, shootx, shooty);
				var dir = point_direction(x, y, shootx, shooty);
				var dude = distabs(dir+rotation, dist);
				shootx = x+dude.x;
				shooty = y+dude.y;
				var boul = shoot(shootx, shooty, speed,
					(typeof(bulletdir) == "number") ? bulletdir : point_direction(x, y, shootx, shooty),
					mytype, mycol,
					mybehave, mydraw//, argument[16], argument[17]
				);
				if flat {
					boul.spd = point_distance(boul.x, boul.y, x, y)/50*speed;
				}
				boul.designed = true;
				array_push(bullets, boul);
			}
		}
	}
	return bullets;
}