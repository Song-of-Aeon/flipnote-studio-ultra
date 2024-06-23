function c_input() {
	var i;
	var inputs = variable_struct_get_names(global.inputs);
	for (i=0; i<array_length(inputs); i++) {
		set_value(self, inputs[i], global.inputs[$inputs[i]]);
	}
}

global.inputlock = false;

function c_inputupdate() {
	/*var dudes = array_collapse(global.joysticks);
	for (i=0; i<array_length(dudes); i++) {
		dudes[i].update();
		dudes[i].poshit = false;
		dudes[i].neghit = false;
		dudes[i].posdrop = false;
		dudes[i].negdrop = false;
	}*/
	
	if global.inputlock {
		var dudes = array_collapse(global.joysticks);
		for (i=0; i<array_length(dudes); i++) {
			dudes[i].poshit = false;
			dudes[i].neghit = false;
			dudes[i].posdrop = false;
			dudes[i].negdrop = false;
		}
		var inputs = variable_struct_get_names(global.inputs);
		var i;
		for (i=0; i<array_length(inputs); i++) {
			global.inputs[$inputs[i]].hit = 0;
			global.inputs[$inputs[i]].hold = 0;
			global.inputs[$inputs[i]].drop = 0;
		}
	} else {
		global.joysticks[gp_axislh].update();
		global.joysticks[gp_axislv].update();
		global.joysticks[gp_axisrh].update();
		global.joysticks[gp_axisrv].update();
		var inputs = variable_struct_get_names(global.inputs);
		var i;
		for (i=0; i<array_length(inputs); i++) {
			global.inputs[$inputs[i]].update();
		}
	}
}


function c_inputload() {
	global.inputs = {};
	nu kinput("left", [vk_left, gp_padl, gp_axislh, gp_axisrh], "Left", u, -1);
	nu kinput("down", [vk_down, gp_padd, gp_axislv, gp_axisrv], "Down", u, 1);
	nu kinput("up", [vk_up, gp_padu, gp_axislv, gp_axisrv], "Up", u, -1);
	nu kinput("right", [vk_right, gp_padr, gp_axislh, gp_axisrh], "Right", u, 1);
	
	//nu kinput("map", [vk_control, gp_face4], "Skip");
	nu kinput("esc", [vk_escape, gp_start], "Pause / Skip");
	nu kinput("erase", [vk_tab], "eraser");
	nu kinput("select", [mb_left, vk_enter], "Select", /*["shoot"]*/);
	nu kinput("back", [vk_space, vk_shift, vk_escape], "Back", /*["bomb", "esc"]*/);
	//nu kinput("skip", [vk_control, gp_select], "Skip text", ["map"]);
	nu kinput("null", []);
}

function kinput(name_, keys_, displayname_=name_, compositekeys_=[], axisdir_=0) constructor {
	name = name_;
	key = keys_;
	displayname = displayname_;
	compositekeys = compositekeys_;
	axis = axisdir_;
	hit = 0;
	hold = 0;
	drop = 0;
	holdtime = 0;
	//axes = array_create(gp_axis_orientation_w); //yeah ill finish this later
	
	update = function() {
		var i, j;
		hit = false;
		hold = false;
		drop = false;
		iterate compositekeys to {
			for (j=0; j<array_length(global.inputs[$compositekeys[i]].key); j++) {
				hit |= input_active(global.inputs[$compositekeys[i]].key[i], INPUT.PRESSED, axis);
				hold |= input_active(global.inputs[$compositekeys[i]].key[i], INPUT.HELD, axis);
				drop |= input_active(global.inputs[$compositekeys[i]].key[i], INPUT.RELEASED, axis);
			}
		}
		for (i=0; i<array_length(key); i++) {
			hit |= input_active(key[i], INPUT.PRESSED, axis);
			hold |= input_active(key[i], INPUT.HELD, axis);
			drop |= input_active(key[i], INPUT.RELEASED, axis);
			if(hold){
				holdtime++;	
			}
			else
				holdtime = 0;
		}
	}
	global.inputs[$name] = self;
}
global.inputs = {};
c_inputload();

/*function jinput(name_, axis_,) constructor {
	var me = global.inputs[$name_];
	me.axis = axis_;
	me.update = me ^ function() {
		
	}
}*/

function joystick(axis_) constructor {
	axis = axis_;
	val = 0;
	
	poshit = false;
	neghit = false;
	posdrop = false;
	negdrop = false;
	
	update = function() {
		var newval = gamepad_axis_value(0, axis);
		
		poshit = false;
		neghit = false;
		posdrop = false;
		negdrop = false;
	
		if val < global.deadzone && newval > global.deadzone {
			poshit = true;
		} else if val > global.deadzone && newval < global.deadzone {
			posdrop = true;
		}
		if val > -global.deadzone && newval < -global.deadzone {
			neghit = true;
		} else if val < -global.deadzone && newval > -global.deadzone {
			negdrop = true;
		}
	
		val = newval;
	}
	global.joysticks[axis] = self;
}

global.joysticks = [];
nu joystick(gp_axislh);
nu joystick(gp_axislv);
nu joystick(gp_axisrh);
nu joystick(gp_axisrv);

enum CONTROLLERS {
	KEYBOARD,
	NINTENDO,
	PLAYSTATION,
	XBOX,
	DDR,
}
function c_inputrepeat(){
	var ht = 60; //holdTime
	var rt = 10; //repeatTime
	if(left.holdtime > ht && left.holdtime % rt == 0 )
		left.hit = true;
	if(right.holdtime > ht && right.holdtime % rt == 0)
		right.hit = true;
	if(up.holdtime > ht && up.holdtime % rt == 0)
		up.hit = true
	if(down.holdtime > ht && down.holdtime % rt == 0)
		down.hit = true;	
}
log("c_input logging");