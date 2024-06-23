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
function shoot(x, y, speed, direction, type, color=c_white, behavior=c_null, draw_=u, layer_="instances", additive_=type==bul.particle, silent=false) {
	var chump;
	//if we aint a bowser...
	chump = instance_create_layer(x, y, layer_, o_bullet); //no more
	
	//throw("\nWINDOWS IS DEAD\nTHREADS ARE FUEL\nBUFFER IS FULL");
	
	//GO TO JSREPLACEMENTS

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
	chump.normaldraw = false;
	if draw_ == u {
		if type.draw == bulletdraw && additive_ {
			chump.normaldraw = true; //this means stullets handle the construction of the vbuffer
		} else {
			chump.normaldraw = false;
			chump.draw = munction(type.draw);
		}
	} else {
		if(draw_ == bulletdraw){
			chump.normaldraw = true;	
		}
		chump.draw = munction(draw_);
	}
	//event_typele
	if silent {
		chump.fxscale = chump.scale;
		chump.image_alpha = chump.alpha;
		
	}
	if(!silent){
		var rawSound = se_null;
		if(is_struct(type.sound))
			rawSound = type.sound.se;
		else
			rawSound = type.sound;
		/*if(!global.ssounds[rawSound]){
			gse_play(type.sound,u,u,0.1);	
			global.ssounds[rawSound] += 3;
		}*/
	}
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
	
	return chump;
}

function shootcircle(x, y, speed, origindirection, density, bullettype, color=c_white, behavior=c_null, draw=u, additive_=false, distance=0, silent=false, spddeviation=0) {
	var i;
	var bulletcount = 0;
	var bullets = [];
	if density < 1 return [];
	
	for (i=0; i<360; i+=360/density) {
		var distguy = distabs(origindirection+i, distance);
		var chump = shoot(x+distguy.x, y+distguy.y, speed, origindirection+i, bullettype, color, behavior, draw, additive_, silent);
		chump.directioning = true;
		bullets[bulletcount] = chump;
		bulletcount++;
	}
	global.lololol = spddeviation;
	with_array(bullets, function() {spd += random(global.lololol*2)-global.lololol});
	return bullets;
}

function shootfan(x, y, speed, startdirection, enddirection, amount, offsetamount, bullettype, color=c_white, behavior=c_null, draw=u, additive_=false, silent=false) {
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
		
		var chump = shoot(x-dcos(theDir)*fartin, y+dsin(theDir)*fartin, speed, theDir, bullettype, color, behavior, draw, additive_, silent);
		//log(chump.dir);
		chump.directioning = true;
		
		bullets[bulletcount] = chump;
		bulletcount++;
		iterations++;
	}
	return bullets;
}

