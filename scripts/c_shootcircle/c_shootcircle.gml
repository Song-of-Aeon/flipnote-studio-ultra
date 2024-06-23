//c_shoot_ext()
//c_shext();
/// @desc shoots a bullet, baby
/// @param {real} x x
/// @param {real} y y
/// @param {real} speed px/frame
/// @param {real} direction degrees
/// @param {struct} type archetype
/// @param {constant.color} [color] color
/// @param {function} [behavior] step
/// @param {function} [draw_] u=archetype inherit
/// @param {bool} [additive] use bm_add
/// @param {bool} [silent] disable sound and spawn effect
/// @returns {id.Instance} instance id
function c_shoot(x, y, speed, direction, type, color=c_white, behavior=c_null, draw_=u, additive_=type==bul.particle, silent=false) {
	//repeat(14*(type != bul.particle)+1) {
		var chump;
		//if we aint a bowser...
			chump = instance_create(x, y, o_bullet); //no more
	
		//throw("\nWINDOWS IS DEAD\nTHREADS ARE FUEL\nBUFFER IS FULL");
	
		//GO TO JSREPLACEMENTS
		chump.me = chump; //save a reference to this "struct" handle because we need it when we kill ourselves.
		//trackBullet(chump);
		chump.spd = speed;
		chump.dir = direction
		chump.type = type;
		chump.color = color;
		chump.additive_ = additive_;
	
		with chump {
			sprite_index = type.sprite;
			_sprite_width = sprite_width;
			_sprite_height = sprite_height;
			friendly = type.friendly;
			zfriendly = friendly;
			damage = type.damage;
			destructible = type.destructible;
			alpha = type.alpha;
			rotate = type.rotate;
			//onhit = method(global.me, type.onhit);
			if type.colorable {
				colorcover = asset_get_index(string(sprite_get_name(sprite_index)) + "cc");
			} else {
				colorcover = s_null;
			}
			if type == bul.particle {
				MadeAGlobalDotParticleIncrement = true;
				particling = true;
				escapedistance = 11;
				die = instance_destroy;
				size = 3;
			}
			//particling = type == bul.particle;
			if friendly {
				damage *= ISAAC.damage;
				fxscale = 1;
			}
			image_angle = direction-90;
		}
	
		if(draw_ == u){
			draw_ = type.draw;
		}
		if(method_get_index(draw_) == c_bulletdraw){//defaultin it up
			//chump.visible = false; //thread handles drawing this guy.
			chump.draw = c_bulletdraw;
		}
		else {
			chump.visible = true; //gamemaker handles drawing this guy
			chump.draw = munction(draw_);
		}
		//event_typele
		if silent {
			chump.fxscale = chump.scale;
			chump.image_alpha = chump.alpha;
		
		}
		/*if(!silent){
			var rawSound = se_null;
			if(is_struct(type.sound))
				rawSound = type.sound.se;
			else
				rawSound = type.sound;
			if(!global.ssounds[rawSound]){
				gse_play(type.sound,u,u,0.1);	
				global.ssounds[rawSound] += 3;
			}
		}*/
		if behavior == c_null {
			chump.simple = true;
		} else {
			chump.simple = false;
			chump.behaviors = munction(behavior);
		}
		chump.directioning = true;
		chump.originx = x;
		chump.originy = y;
		//chump.owner = chump.friendly ? global.me : self;
		chump.owner = self;
	
		/*if chump.friendly && type != bul.particle {
			tag("friendlyshot", chump);
			c_dohook(hooks.onplayershoot, [global.me, chump]);
		} else if chump.friendly == false {
			tag("enemyshot", chump);
			c_dohook(hooks.onenemyshoot, [global.me, chump]);
		} else if is_nan(chump.friendly) {
			tag("nanshot", chump);
			c_dohook(hooks.onnanshoot, [global.me, chump]);
		}*/
		//speed += seed.float(1)-.5;
		//direction += seed.side(5);
	//}
	return chump;
}

function c_shootcircle(x, y, speed, origindirection, density, bullettype, color=c_white, behavior=c_null, draw=u, additive_=false, distance=0, silent=false, spddeviation=0) {
	var i;
	var bulletcount = 0;
	var bullets = [];
	if density < 1 return [];
	
	for (i=0; i<360; i+=360/density) {
		var distguy = distabs(origindirection+i, distance);
		var chump = c_shoot(x+distguy.x, y+distguy.y, speed, origindirection+i, bullettype, color, behavior, draw, additive_, silent);
		chump.directioning = true;
		bullets[bulletcount] = chump;
		bulletcount++;
	}
	iterate bullets to {
		bullets[i].spd += random(spddeviation*2)-spddeviation;
	}
	return bullets;
}

function c_shootfan(x, y, speed, startdirection, enddirection, amount, offsetamount, bullettype, color=c_white, behavior=NUMBER5, draw=u, additive_=false, silent=false) {
	var i;
	var bulletcount = 0;
	var bullets = [];
	//offsetamount = speed;
	//var maxbulletcount = abs(startdirection-enddirection);
	var iterations = 0;
	for (i=0; i<amount; i++) {
		var theDir = lerp(startdirection,enddirection,i/amount);
		var fartin = (i/amount)*offsetamount;
		//log(theDir, fartin);
		//og(startdirection, i/amount, i, amount);
		
		var chump = c_shoot(x-dcos(theDir)*fartin, y+dsin(theDir)*fartin, speed, theDir, bullettype, color, behavior, draw, additive_, silent);
		//log(chump.dir);
		chump.directioning = true;
		
		bullets[bulletcount] = chump;
		bulletcount++;
		iterations++;
	}
	return bullets;
}

