function colorpick() : ui(160) constructor {
	var cool = new vec22(-64, -80, 64, 80);
	var colorwheel = function(cool) : element(WIDTH*.1, 80) constructor {
		draw = function() {
			draw_clear(global.color);
			draw_spr(x, y, s_colorwheel);
			draw_spr(pos.x, pos.y, s_edge, u, 2, 2, u, c_white);
			draw_spr(pos.x, pos.y, s_edge, u, 2.5, 2.5, u, c_black);
		}
		onhold = function() {
			global.color = surface_getpixel(owner.surf, mousestats.pos.x, mousestats.pos.y);
			pos.x = mousestats.pos.x;
			pos.y = mousestats.pos.y;
		}
		clickablerange = cool;
		pos = new vec2();
	}
	elements = [new colorwheel(cool)];
	iterate elements to {
		elements[i].owner = self;
	}
}

