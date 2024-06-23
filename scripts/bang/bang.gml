/// @desc fire a hitscan
/// @param {real} x
/// @param {real} y
/// @param {any*} direction
/// @param {any*} width px width
/// @param {any*} delay wait until hitbox
/// @param {any*} duration_or_decay if >= 0 use duration else use decay in px/frame
/// @param {any*} type archetype
/// @param {constant.color} [color]=c_black Description
/// @param {function} [behavior]=c_null Description
/// @param {real} [length]=screensize length of hitscan
/// @param {function} [draw]=c_hitscandraw Description
/// @param {bool} [additive]=false Description
/// @returns {id} i hope these work as structs. good luck bread man!
function bang(x, y, direction, width, delay, duration_or_decay, type, color=c_white, behavior=c_null, length=DIAGONAL*2, draw=c_hitscandraw, additive_=false) {
	if type.friendly != false {
		chump = instance_create_layer(x, y, layer_get_id(!additive_ ? "friendly" : "friendly_add"), o_hitscan); //no more
	} else {
		chump = instance_create_layer(x, y, layer_get_id(!additive_ ? "bullets" : "bullets_add"), o_hitscan); //no more
	}
	chump.dir = direction;
	chump.width = width;
	chump.maxwidth = width;
	chump.delay = delay;
	if duration_or_decay >= 0 {
		chump.duration = duration_or_decay;
		chump.decay = 0;
	} else {
		chump.duration = infinity;
		chump.decay = duration_or_decay;
	}
	chump.type = type;
	chump.spd = 1;
	chump.color = color;
	chump.size = length;
	with chump {
		sprite_index = type.sprite;
		damage = type.damage;
		destructible = type.destructible;
		friendly = type.friendly;
		alpha = type.alpha;
		onhit = method(global.me, type.onhit);
		if type.colorable {
			colorcover = asset_get_index(string(sprite_get_name(sprite_index)) + "cc");
		} else {
			colorcover = s_null;
		}
		if friendly {
			damage *= ISAAC.damage;
		}
	}
	
	chump.behaviors = munction(behavior);
	chump.draw = munction(draw);
	chump.owner = /*chump.friendly ? global.me :*/ self;
	
	if chump.friendly c_dohook(hooks.onplayershoot, [global.me, chump]);
	
	return chump;
}

#macro shoothitscan bang