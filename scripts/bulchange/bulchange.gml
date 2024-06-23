function bulchange(archetype, boul=self) {
	with boul {
		sprite_index = archetype.sprite;
		friendly = archetype.friendly;
		zfriendly = friendly;
		damage = archetype.damage;
		destructible = archetype.destructible;
		alpha = archetype.alpha;
		rotate = archetype.rotate;
		colorable = archetype.colorable;
		onhit = method(global.me, archetype.onhit);
		if archetype.colorable {
			colorcover = asset_get_index(string(sprite_get_name(sprite_index)) + "cc");
		} else {
			colorcover = s_null;
		}
		if friendly {
			damage *= ISAAC.damage;
		}
		image_angle = direction-90;
	}
	if boul.draw == boul.type.draw {
		if archetype.draw == bulletdraw && boul.additive_ {
			boul.draw = c_flatcolor;
		} else {
			boul.draw = munction(archetype.draw);
		}
	} else {
		//boul.draw = munction(draw_);
	}
	boul.type = type;
}