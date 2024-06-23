function clearradius(_x, _y, radius, strong=false, includemine=false) {
	var cleared = 0;
	
	var dudes = stullet_collide_list(_x, _y, radius);
	iterate dudes to {
		if (strong || dudes[i].destructible == true) && (includemine || dudes[i].friendly == false) {
			cleared++;
			instance_destroy(dudes[i]);
		}
	}
	return cleared;
}
function clearscreen() {
	c_clearradius(MIDWID, MIDHEI, 999, true, false);
}