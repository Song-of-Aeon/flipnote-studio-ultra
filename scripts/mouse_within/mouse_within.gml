function mouse_within(x, y, x2, y2) {
	var mousx = mouse_x;
	var mousy = mouse_y;
	return mousx >= x && mousx <= x2 && mousy >= y && mousy <= y2;
}