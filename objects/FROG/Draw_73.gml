
if !uiactive exit;
draw_set_color(c_grey);
draw_rectangle(WIDTH-global.uiwid, 0, WIDTH, HEIGHT, false);

var height = 0;
iterate uis to {
	uis[i].y = height;
	uis[i].draw();
	height += uis[i].height;
}