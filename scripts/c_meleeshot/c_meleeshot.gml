function meleeshot(target=self, size=sprite_get_width(target.sprite_index)/2, damage=3) {
	var melee = shoot(target.x, target.y, 0, 0, bul.melee, c_white, function() {
		if !instance_exists(owner) {
			instance_destroy();
			exit;
		}
		x = owner.x;
		y = owner.y;
	})
	melee.owner = target;
	melee.damage = damage;
	rescale(melee, size/8);
	return melee;
}

nu bullet("melee", s_meleenull, 3, false, false, 0);