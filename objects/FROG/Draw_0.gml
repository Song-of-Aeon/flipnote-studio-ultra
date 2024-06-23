c_input();
draw_clear(c_white);

if mouse_within(WIDTH-global.uiwid, 0, WIDTH, HEIGHT) && uiactive {
	select.hit = false;
	select.hold = false;
	select.drop = false;
}

drawto staginglayer
	if select.hit {
		currenttool.onhit();
	}	
	if select.hold {
		currenttool.onhold();
	}
	if select.drop {
		currenttool.ondrop();
	}
}

iterate layers to {
	layers[i].draw();
	if i == activelayer {
		currenttool.onrender();
		draw_surface(staginglayer, 0, 0);
		currenttool.onderender();
	}
}

draw_set_color(c_black);
draw_string(20, 20, currenttool.name);


currenttool.step();
currenttool.draw();