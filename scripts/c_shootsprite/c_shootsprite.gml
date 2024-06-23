function shootsprite(x, y, speed, rotation, bulletdir, sprite, xinterval, yinterval, types, size=1, behaviors=u, draw=u, flat=u, additive_=false, silent=false, nameskip=false) {
	var name = sprite_get_name(sprite);
	if !variable_struct_exists(global.shotsprites, name) || nameskip {
		nu spritedesign(sprite, name);
	}
	var thesprite = global.shotsprites[$name];
	return shootdesign(x, y, speed, rotation, bulletdir, thesprite.design, xinterval, yinterval, types, size, thesprite.xorigin, thesprite.yorigin, thesprite.colors, behaviors, draw, flat, additive_, silent);
}