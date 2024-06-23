function dirflip(direction, horizontal=true, vertical=false) {
	if horizontal {
		direction %= 360;
		if direction < 180 {
			direction = -(direction-90)+90;
		} else {
			direction -= 180;
			direction = -(direction-90)+90;
			direction += 180;
		}
		return direction;
	}
}