function simplify(boul=self, condition=true) {
	if !condition exit;
	with boul {
		if hspd != 0 || vspd != 0 {
			dir = point_direction(xprevious, yprevious, x, y);
			spd += abs(hspd)+abs(vspd);
		}
		tspd = 0;
		simple = true;
	}
}