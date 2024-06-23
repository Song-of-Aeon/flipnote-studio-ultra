function huecol(hue, sat=255, val=255) {
	return make_color_hsv(cycle(hue, 256), clamp(sat, 0, 255), clamp(val, 0, 255));
}