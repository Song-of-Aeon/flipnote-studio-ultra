global.buddy = noone;
function interactive_buddy(x, y, surf) {
	with global.buddy kys;
	var chump = scriptable_create(function() {
		
		
		
		if mouse_x != prevmouse.x || mouse_y != prevmouse.y {
			mousedir = point_direction(prevmouse.x, prevmouse.y, mouse_x, mouse_y);
			mousevec = point_distance(prevmouse.x, prevmouse.y, mouse_x, mouse_y);
		} else {
			mousevec = 0;
		}
		
		if x-width < 0 {
			spd.h = abs(spd.h);
		} else if x > WIDTH-global.uiwid {
			spd.h = -abs(spd.h);
		} else if y < 0 {
			spd.v = abs(spd.v);
		}
		
		
		c
		if y < HEIGHT {
			spd.v += grav;
			spd.h = lapp(spd.h, 0, .04);
		} else if y > HEIGHT {
			y = HEIGHT;
			var pow = spd.v;
			spd.v = 0;
			hurtcheck(x-width/2, y, pow*2, 90, 160);
			
		} else {
			if !irandom(8 sec) {
				desiredx = irandom((WIDTH-global.uiwid)*.8)+WIDTH*.1;
				//desiredx = irandom(80)+WIDTH*.1;
				desirous = true;
			}
			if abs(desiredx-x) < 10 desirous = false;
			if desirous {
				spd.h = lapp(spd.h, 2, sign(desiredx-x)*.1);
			} else {
				spd.h = lapp(spd.h, 0, .1);
			}
			//if ncm(20) hurtcheck(WIDTH*.5, HEIGHT*.5, 4, 0, 360);
		}

		x += spd.h;
		y += spd.v;
		inv--;
		var buddy = collision_line(mouse_x, mouse_y, prevmouse.x, prevmouse.y, o_, false, false);
		//log(buddy, id, buddy == id);
		if buddy == id {
			hurtcheck(prevmouse.x, prevmouse.y, mousevec*.2, mousedir, 30);
		}
		
		prevmouse.x = mouse_x;
		prevmouse.y = mouse_y;
		
		iterate limbs to {
			limbs[i].step();
		}
	});
	chump.drawend = munction(function() {
		//drawto mysurf
			//draw_clear_alpha(c_black, 0);
			draw_spr(x-width/2, y-height*.4, s_buddy);
			//log(limbs);
			iterate limbs to {
				draw_spr(limbs[i].x, limbs[i].y, s_buddy, u, limbs[i].size, limbs[i].size);
			}
			//draw_self();
		//}
		//drawto surf
			//draw_surface(0, 0, mysurf);
		//}
	});
	chump.x = x;
	chump.y = y;
	chump.width = 80;
	chump.height = 100;
	chump.surf = surf;
	chump.sprite_index = s_pixel;
	chump.image_angle = 180;
	chump.image_blend = c_red;
	chump.image_xscale = chump.width;
	chump.image_yscale = chump.height;
	chump.image_alpha = .3;
	with chump {
		prevmouse = new vec2(mouse_x, mouse_y);
		mousedir = 0;
		mousevec = 0;
		mysurf = surface_create(surface_get_width(surf), surface_get_height(surf));
		count = 0;
		iterations = 0;
		desiredx = WIDTH*.5;
		desirous = false;
		grav = .04;
		spd = {
			h: 0,
			v: 0,
		}

		painthreshold = 3;
		inv = 0;
		invtime = 5;
		//reinstantiable but stays on spawned layer. only one at once. cant be hurt if hiding behind something?

		hurtcheck = function(x, y, intensity, direction, splatterradius) {
			if inv {
				//log("inv, exited");
				exit;
			}
			if intensity < painthreshold {
				//bounce a bit but dont bleed
				//log("weak, exited");
				exit;
			}
			repeat(intensity-painthreshold) {
				var boul = c_shoot(x+srandom(5), y+srandom(5), 1+intensity*.5+random(1), direction+srandom(splatterradius*.5), bul.bloodshit, u, function() {
					c
					vspd += .2;
					y += vspd;
				});
				boul.vspd = 0;
				boul.surf = surf;
			}
			inv = invtime;
			var dude = distabs(direction, intensity*.3);
			spd.h = dude.x;
			spd.v = dude.y;
		}
	}
	
	var limb = function(x_, y_, tension_, size_) constructor {
		x = x_;
		y = y_;
		goalx = x_;
		goaly = y_;
		wobble = 0;
		tension = tension_;
		size = size_;
		step = function() {
			x = lerp(x, owner.x+goalx, tension);
			y = lerp(y, owner.y+goaly, tension);
		}
		owner = other;
	}
	with chump {
		limbs = [
			new limb(-width*.8, -height*.5, .1, .45),
			new limb(-width*.2, -height*.5, .1, .45),
			new limb(-width*.7, -height*.1, .2, .45),
			new limb(-width*.3, -height*.1, .2, .45),
			new limb(-width*.5, -height*.85, .3, .6),
		];
	}
	
	
	
	global.buddy = chump;
	return chump;
}


nu bullet("bloodshit", s_null, u, u, u, 0, function() {
	drawto FROG.layers[FROG.activelayer].surf
		draw_spr(x, y, s_bulkunai, u, 1+random(.4), 1+random(.4), random(359), c_red);
	}
});