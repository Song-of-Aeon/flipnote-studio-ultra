function dohv() {
	x += hspd;
	y += vspd;
	if x == xprevious && y == yprevious {
		image_angle = dir-90;
	} else {
		image_angle = point_direction(xprevious, yprevious, x, y)-90;
	}
}

function stick() {
	x = owner.x;
	y = owner.y;
}