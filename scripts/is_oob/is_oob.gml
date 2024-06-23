function is_oob(variation=sprite_width/2, horizontal=true, vertical=true, target=self) {
	if horizontal && vertical {
		return !(target.x=clamp(target.x, 0-variation, room_width+variation) && target.y=clamp(target.y, 0-variation, room_height+variation));
	} else if horizontal {
		return !(target.x=clamp(target.x, 0-variation, room_width+variation));
	} else if vertical {
		return !(target.y=clamp(target.y, 0-variation, room_height+variation));
	} else {
		log("????????????");
		return true;
	}
}