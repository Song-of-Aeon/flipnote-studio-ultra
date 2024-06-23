nu bullet("maidenpit", s_null, 0, false, NaN, 4);
function maidenpit(size=40, color=c_white, target=global.me) {
	//if get_value(self, "activetype") == ACTIVES.BOMB color = c_green;
	//if get_value(self, "activetype") == ACTIVES.SIDEARM color = c_cyan;
	var bullets = shoot(target.x, target.y, 0, 0, bul.maidenpit, c_white, function() {
		c_clearradius(x, y, size);
		alpha -= .1;
		if alpha <= 0 instance_destroy();
	}, function() {
		draw_set_alpha(alpha/8);
		draw_set_color(c_black);
		draw_ring(x, y, size, true);
		draw_set_alpha(alpha);
		draw_set_color(thecolor);
		draw_ring(x, y, size, false);
		draw_set_alpha(1);
	})
	bullets.size = size;
	bullets.thecolor = color;
	return bullets;
}

