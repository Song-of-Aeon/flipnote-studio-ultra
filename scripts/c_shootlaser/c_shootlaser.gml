//yeah i know i didnt use named arguments whatever
function shootlaser(x,y,step,length,width = 10, distanceBetweenLinks = 3, friendly = false, destructible=false, escapedistance=200){
	var precision = length/distanceBetweenLinks //sorry
	var distance = distanceBetweenLinks; //sorry 
	//var theLaser = instance_create_layer(x,y,layer_get_id("bullets"),o_curvylaser);
	if friendly != false {
		theLaser = instance_create_layer(x, y, layer_get_id("friendly"), o_curvylaser); //no more
	} else {
		theLaser = instance_create_layer(x, y, layer_get_id("bullets"), o_curvylaser); //no more
	}
	theLaser.behaviors = munction(step);
	theLaser.laserWidth = width;
	//theLaser.spd = spd;
	//theLaser.dir = dir;
	
	linkList = [laserLink(theLaser,distance, friendly)];
	linkList[0].escapedistance = escapedistance;
	
	for(var i = 1; i < precision;i++){
		var a = laserLink(linkList[i-1],distance, friendly, destructible);
		linkList[i] = a;
	}
	theLaser.linkList = linkList;
	return theLaser;
}
nu bullet("laserLink", s_pixel, u, false, false, u, u, u, se_null);
function laserLink(whoToFollow,distance, friendly, destructible=false){
	var link = shoot(whoToFollow.x,whoToFollow.y,0,0,bul.big,u,function(){
		if(!instance_exists(following)){
			instance_destroy();
			return;
		}
		escapedistance = following.escapedistance
		var followingx = following.x;
		var followingy = following.y;
		var tempx = self.x -followingx;
		var tempy = self.y-followingy;
		var ang = darctan2(tempy,tempx); //angle;
		var tempdist = sqrt(abs(tempx^2) + abs(tempy^2)); //distance
		//tempdist = min(self.distance,tempdist)+1;
		tempdist = self.distance;
		self.x = followingx + dcos(ang)*tempdist;
		self.y = followingy + dsin(ang)*tempdist;
		//if c > 2 moved |= x != xprevious || y != yprevious;
	},c_null, u, true);
	link.invisible = true;
	link.moved = false;
	link.friendly = friendly;
	link.following = whoToFollow;
	link.distance = distance;
	link.destructible = destructible;
	return link;
}
function lase(x, y, speed, direction, length, width, type, color=c_white, behavior=c_null, distanceBetweenLinks=5, escapedistance=200){
	var chump = shootlaser(x, y, behavior, length, width, distanceBetweenLinks, type.friendly, type.destructible, escapedistance);
	chump.color = color;
	with chump {
		//log(type);
		sprite_index = type.sprite;
		//friendly = NaN;
		friendly = type.friendly;
		//zfriendly = friendly;
		//image_blend = type.colour;
		damage = type.damage;
		destructible = type.destructible;
		alpha = type.alpha;
		colorable = type.colorable;
		onhit = method(global.me, type.onhit);
		if type.colorable {
			colorcover = asset_get_index(string(sprite_get_name(sprite_index)) + "cc");
		} else {
			colorcover = s_null;
		}
		if friendly {
			damage *= ISAAC.damage;
			fxscale = 1;
			fxscale = 1;
		}
		image_angle = direction-90;
	}
	chump.spd = speed;
	chump.dir = direction;
	chump.escapedistance = escapedistance;
	
	if chump.friendly c_dohook(hooks.onplayershoot, [global.me, chump]);
	
	return chump;
}

function lasecircle(x, y, speed, length, width, origindirection, density, archetype, color=c_white, behavior=c_null, draw=u, additive_=false, distance=0, silent=false, spddeviation=0) {
	var i;
	var bulletcount = 0;
	var bullets = [];
	
	for (i=0; i<360; i+=360/density) {
		var distguy = distabs(origindirection+i, distance);
		var chump = lase(x+distguy.x, y+distguy.y, speed, origindirection+i, length, width, archetype, color, behavior, draw, additive_, silent);
		chump.directioning = true;
		bullets[bulletcount] = chump;
		bulletcount++;
	}
	global.lololol = spddeviation;
	with_array(bullets, function() {spd += random(global.lololol*2)-global.lololol});
	return bullets;
}

/*

function shootlaserOLD(x, y, speed, direction, width, length, type, color=c_black, behavior=NUMBER5, draw=c_laserdraw) {
	var chump = instance_create_layer(x, y, layer_get_id("bullets"), o_laser);
	//log(layer_get_id("instances"));
	chump.spd = speed;
	chump.dir = direction;
	
	chump.width = width;
	chump.length = length;
	chump.type = type;
	chump.color = color;
	with chump {
		sprite_index = type.sprite;
		//image_blend = type.colour;
		damage = type.damage;
		destructible = type.destructible;
		friendly = type.friendly;
		alpha = type.alpha;
		endtime = length;
		if type.colorable {
			colorcover = asset_get_index(string(sprite_get_name(sprite_index)) + "cc");
		} else {
			colorcover = s_null;
		}
		if friendly {
			damage *= ISAAC.damage;
		}
		image_alpha = alpha;
		image_xscale = (width)/sprite_get_width(sprite_index);
		image_yscale = (length)/sprite_get_height(sprite_index);
	}
	if behavior = c_null && draw = c_laserdraw {
		chump.simple = true;
	} else {
		chump.behaviors = method(undefined, behavior);
		chump.draw = method(undefined, draw);
	}
	chump.directioning = true;
	return chump;
}

function shootlasercircle(x, y, speed, origindirection, width, length, density, bullettype, color=c_black, behavior=NUMBER5, draw=c_bulletdraw) {
	var i;
	var bulletcount = 0;
	var bullets = [];
	for (i=0; i<360; i+=360/density) {
		var chump = c_shootlaser(x, y, speed, origindirection+i, width, length, bullettype, color, behavior, draw);
		chump.directioning = true;
		bullets[bulletcount] = chump;
		bulletcount++;
	}
	return bullets;
}

function shootlaserabs(x, y, hspd, vspd, width, length, type, color=c_black, behavior=NUMBER5, draw=c_laserdraw) {
	var chump = instance_create_layer(x, y, layer_get_id("bullets"), o_laser);
	//log(layer_get_id("instances"));
	chump.hspd = speed;
	chump.vspd = direction;
	
	chump.width = width;
	chump.length = length*2;
	chump.type = type;
	chump.color = color;
	with chump {
		sprite_index = type.sprite;
		//image_blend = type.colour;
		damage = type.damage;
		destructible = type.destructible;
		friendly = type.friendly;
		alpha = type.alpha;
		endtime = length;
		if type.colorable {
			colorcover = asset_get_index(string(sprite_get_name(sprite_index)) + "cc");
		} else {
			colorcover = s_null;
		}
		if friendly {
			damage *= ISAAC.damage;
		}
		image_alpha = alpha;
		image_xscale = (width)/sprite_get_width(sprite_index);
		image_yscale = (length-endtime/2)/sprite_get_height(sprite_index);
	}
	
	if behavior = c_null && draw = c_laserdraw {
		chump.simple = true;
	} else {
		chump.behaviors = method(undefined, behavior);
		chump.draw = method(undefined, draw);
	}
	return chump;
}

#macro c_phosphorescence c_shootlaser
#macro c_beam c_shootlaser