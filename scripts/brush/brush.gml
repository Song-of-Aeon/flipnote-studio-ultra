function brush() : tool("brush", 20) constructor {
	prevmouse = new vec2(mouse_x, mouse_y);
	step = function() {
		if mouse_x != prevmouse.x || mouse_y != prevmouse.y {
			dir = point_direction(prevmouse.x, prevmouse.y, mouse_x, mouse_y);
		}
		prevmouse.x = mouse_x;
		prevmouse.y = mouse_y;
	}
	onhit = function() {
		draw_set_color(global.color);
		global.currentbrush.start(prevmouse.x, prevmouse.y);
	}
	onhold = function() {
		draw_set_color(global.color);
		global.currentbrush.draw(mouse_x, mouse_y, prevmouse.x, prevmouse.y);
	}
	ondrop = function() {
		draw_set_color(global.color);
		global.currentbrush.release(mouse_x, mouse_y);
		drawto FROG.layers[FROG.activelayer].surf
			draw_surface(FROG.staginglayer, 0, 0);
		}
		drawto FROG.staginglayer
			draw_clear_alpha(c_white, 0);
		}
	}
	dir = 0;
}

function eraser() : tool("eraser", 10) constructor {
	prevmouse = new vec2(mouse_x, mouse_y);
	step = function() {
		if mouse_x != prevmouse.x || mouse_y != prevmouse.y {
			dir = point_direction(prevmouse.x, prevmouse.y, mouse_x, mouse_y);
		}
		prevmouse.x = mouse_x;
		prevmouse.y = mouse_y;
	}
	onhit = function() {
		savedcolor = global.color;
	}
	onhold = function() {
		global.color = c_white;
		//draw_stroke(prevmouse.x, prevmouse.y, mouse_x, mouse_y, 5);
		global.currentbrush.draw(mouse_x, mouse_y, prevmouse.x, prevmouse.y);
	}
	ondrop = function() {
		drawto FROG.layers[FROG.activelayer].surf
			gpu_set_blendmode(bm_subtract);
			gpu_set_colorwriteenable(0, 0, 0, 1);
			//gpu_set_blendmode_ext_sepalpha(bm_src_alpha, bm_inv_src_alpha, bm_one, bm_inv_src_alpha);
			draw_surface(FROG.staginglayer, 0, 0);
			gpu_set_blendmode(bm_normal);
			gpu_set_colorwriteenable(1, 1, 1, 1);
		}
		drawto FROG.staginglayer
			draw_clear_alpha(c_white, 0);
		}
		global.color = savedcolor;
	}
	onrender = function() {
		//gpu_set_blendmode(bm_subtract);
		gpu_set_blendmode_ext_sepalpha(bm_src_alpha, bm_inv_src_alpha, bm_one, bm_inv_src_alpha);
	}
	onderender = function() {
		gpu_set_blendmode(bm_normal);
	}
	dir = 0;
	savedcolor = c_black;
}

function filler() : tool("filler", 4) constructor {
	onhit = function() {
		drawto FROG.layers[FROG.activelayer].surf
			draw_clear(global.color);
		}
	}
}

function eyedrop() : tool("eyedrop", 8) constructor {
	onhold = function() {
		//log(surface_getpixel(FROG.layers[FROG.activelayer], mouse_x, mouse_y), mouse_x, mouse_y);
		global.color = surface_getpixel(FROG.layers[FROG.activelayer].surf, mouse_x, mouse_y);
	}
}

function ibuddy() : tool("ibuddy", 2) constructor {
	onhit = function() {
		interactive_buddy(mouse_x, mouse_y, FROG.layers[FROG.activelayer].surf);
	}
}


//constructor brushusing
//global.color and global.alpha
//overwrite or combine