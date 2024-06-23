function brushpick() : ui(80) constructor {
	var cool = new vec22(-10, -10, 10, 10);
	var brushelement = function(x_, y_, brushstyle_, cool) : element() constructor {
		draw = function() {
			draw_set_alpha(.4+activated*.6);
			draw_spr(x, y, mystyle.sprite, u, 2, 2);
			draw_set_alpha(1);
		}
		onhit = function() {
			iterate owner.elements to {
				owner.elements[i].activated = false;
				activated = true;
				global.currentbrush = mystyle;
			}
		}
		activated = false;
		clickablerange = cool;
		mystyle = brushstyle_;
		x = x_;
		y = y_;
	}
	var basic = new brushelement(20, 20, global.brushstyles.dot, cool);
	basic.activated = true;
	
	elements = [
		basic,
		new brushelement(60, 20, global.brushstyles.smallcircle, cool),
		new brushelement(100, 20, global.brushstyles.mediumcircle, cool),
		new brushelement(140, 20, global.brushstyles.bigcircle, cool),
		new brushelement(20, 60, global.brushstyles.weird, cool),
		new brushelement(60, 60, global.brushstyles.edge, cool),
		new brushelement(100, 60, global.brushstyles.vertical, cool),
		new brushelement(140, 60, global.brushstyles.bullet, cool),
	];
	iterate elements to {
		elements[i].owner = self;
	}
}