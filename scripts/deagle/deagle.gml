function deagle() : tool("deagle", 2) constructor {
	prevmouse = new vec2(mouse_x, mouse_y);
	step = function() {
		prevmouse.x = mouse_x;
		prevmouse.y = mouse_y;
	}
	onhit = function() {
		//log(ammo, reloadpoint);
		if reloadpoint < sprite_get_number(s_reload) || !ammo exit;
		draw_spr(mouse_x, mouse_y, s_gunshot);
		staginglayer_push();
		c_screenshake(10, 8);
		ammo--;
		se_play(se_gunshot, u, u, .3);
		
		if instance_exists(global.buddy) {
			if point_distance(mouse_x, mouse_y, global.buddy.x-global.buddy.width/2, global.buddy.y-global.buddy.height/2) < global.buddy.height*.5 {
				with global.buddy {
					hurtcheck(mouse_x, mouse_y, 30, irandom(359), 360);
				}
			}
		}
	}
	reload = function() {
		if reloadpoint < sprite_get_number(s_reload) exit;
		se_play(se_reload);
		ammo = magazine+chamberbullet*!!ammo;
		reloadpoint = 0;
	}
	draw = function() {
		if reloadpoint >= sprite_get_number(s_reload) {
			var i;
			for (i=0; i<ammo; i++) {
				draw_spr(24, HEIGHT-40-i*6, s_bulbullet, u, 2, 2, -90, lerp_color(c_silver, c_black, (!!itneg(i))*.2));
				draw_spr(24, HEIGHT-40-i*6, s_bulbulletcc, u, 2, 2, -90, lerp_color(c_orange, c_black, (!!itneg(i))*.2));
			}
		}
		if ammo {
			draw_string(16, HEIGHT-30, $"ART AMMO: {ammo}");
		} else {
			draw_string(16, HEIGHT-30, "RELOAD!! RELOAD!!");
		}
		if ammo && reloadpoint >= sprite_get_number(s_reload) draw_spr(mouse_x, mouse_y, s_crosshair, u, u, u, u, c_red);
		draw_spr(WIDTH-global.uiwid, HEIGHT, s_reload, reloadpoint);
	}
	step = function() {
		c
		if ncm(4) && reloadpoint < sprite_get_number(s_reload) {
			//log(reloadpoint);
			reloadpoint++;
		}
		if keyboard_check_pressed(ord("R")) reload();
	}
	ammo = 0;
	magazine = 22;
	chamberbullet = true;
	reloadpoint = 22;
	reload();
}


function staginglayer_push() {
	drawto FROG.layers[FROG.activelayer].surf
		draw_surface(FROG.staginglayer, 0, 0);
	}
	drawto FROG.staginglayer
		draw_clear_alpha(c_white, 0);
	}
}