function tetherbullets(bullets, target) { //overwrites behaviors so watch out
	iterate bullets to {
		bullets[i].behaviors = method(bullets[i], function() {
			if !instance_exists(tethertarget) {
				kys exit;
			}
			x = tethertarget.x+tetherdif.x;
			y = tethertarget.y+tetherdif.y;
		});
		bullets[i].tetherdif = new vec2(bullets[i].x-target.x, bullets[i].y-target.y);
		bullets[i].tethertarget = target;
		bullets[i].simple = false;
		bullets[i].destructible = false;
	}
}