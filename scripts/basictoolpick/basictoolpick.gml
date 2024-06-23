function basictoolpick() : ui(80) constructor {
	var thingtemplate = function(x_, y_, sprite_, tool_) : element() constructor {
		draw = function() {
			draw_set_alpha(.4+activated*.6);
			draw_spr(x, y, sprite, u, 3, 3);
			draw_set_alpha(1);
		}
		onhit = function() {
			iterate owner.elements to {
				owner.elements[i].activated = false;
				activated = true;
				FROG.currenttool = new tooll();
			}
		}
		activated = false;
		clickablerange = new vec22(-10, -10, 10, 10);
		sprite = sprite_;
		tooll = tool_;
		x = x_;
		y = y_;
	}
	var brushelement = new thingtemplate(20, 20, s_bulcirclecc, brush);
	brushelement.activated = true;
	
	elements = [
		brushelement,
		new thingtemplate(60, 20, s_bulcardcc, eraser),
		new thingtemplate(100, 20, s_bulsquarecc, filler),
		new thingtemplate(140, 20, s_bulbullet, deagle),
		new thingtemplate(20, 60, s_knifeshot, eyedrop),
		new thingtemplate(60, 60, s_buddyicon, ibuddy),
	];
	iterate elements to {
		elements[i].owner = self;
	}
}