global.uiwid = WIDTH*.2;
function ui(height_) constructor {
	height = height_;
	elements = [];
	x = WIDTH-global.uiwid;
	y = 0;
	surf = surface_create(global.uiwid, height);
	draw = function() {
		draw_rectangle(x, y, WIDTH, HEIGHT, true);
		drawto surf
			iterate elements to {
				elements[i].draw();
			}
		}
		draw_surface(surf, x, y);
	}
	step = function() {
		iterate elements to {
			elements[i].mousemath();
			if !elements[i].mousestats.inrange continue;
			elements[i].step();
			if FROG.select.hit elements[i].onhit();
			if FROG.select.hold elements[i].onhold();
			if FROG.select.drop elements[i].ondrop();
		}
	}
}

function element(x_=0, y_=0) constructor {
	x = x_;
	y = y_;
	draw = c_null;
	mousestats = {
		inrange: false,
		pos: new vec2(),
	}
	onhit = c_null;
	onhold = c_null;
	ondrop = c_null;
	draw = c_null;
	step = c_null;
	mousemath = function() {
		//log(x+owner.x, y+owner.y, mouse_x, mouse_y);
		if mouse_within(
			x+clickablerange.x+owner.x, y+clickablerange.y+owner.y,
			x+clickablerange.x2+owner.x, y+clickablerange.y2+owner.y
		) {
			mousestats.inrange = true;
			mousestats.pos = new vec2(
				mouse_x-(owner.x),//(clickablerange.x+(clickablerange.x2-clickablerange.x)/2),
				mouse_y-(owner.y),//(clickablerange.y+(clickablerange.y2-clickablerange.y)/2),
			);
			//log(mousestats.pos);
		} else {
			mousestats.inrange = false;
			mousestats.pos = new vec2(infinity, infinity);
		}
	}
}