global.deadzone = .4;
global.gamepactive = 0;
function input_active(input, type, axis=0) {
	switch type {
		case INPUT.PRESSED:
			if typeof(input) == "string" {
				return keyboard_check_pressed(ord(input));
			} else {
				switch input_device(input) {
					case DEVICE.KEYBOARD:
						return keyboard_check_pressed(input);
						break;
					case DEVICE.MOUSE:
						return mouse_check_button_pressed(input);
						break;
					case DEVICE.CONTROLLER:
						return gamepad_button_check_pressed(global.gamepactive, input);
						break;
					case DEVICE.JOYSTICK:
						if axis == 1 return global.joysticks[input].poshit;
						if axis == -1 return global.joysticks[input].neghit;
						break;
				}
			}
			break;
		case INPUT.HELD:
			if typeof(input) == "string" {
				return keyboard_check(ord(input));
			} else {
				switch input_device(input) {
					case DEVICE.KEYBOARD:
						return keyboard_check(input);
						break;
					case DEVICE.MOUSE:
						return mouse_check_button(input);
						break;
					case DEVICE.CONTROLLER:
						return gamepad_button_check(global.gamepactive, input);
						break;
					case DEVICE.JOYSTICK: //UH OH!
						var val = gamepad_axis_value(0, input);
						if abs(val) < global.deadzone return false;
						//log(axis, val);
						if axis > 0 && val < 0 return 0;
						if axis < 0 && val > 0 return 0;
						return true;
						break;
				}
			}
			break;
			break;
		case INPUT.RELEASED:
			if typeof(input) == "string" {
				return keyboard_check_released(ord(input));
			} else {
				switch input_device(input) {
					case DEVICE.KEYBOARD:
						return keyboard_check_released(input);
						break;
					case DEVICE.MOUSE:
						return mouse_check_button_released(input);
						break;
					case DEVICE.CONTROLLER:
						return gamepad_button_check_released(global.gamepactive, input);
						break;
					case DEVICE.JOYSTICK:
						if axis == 1 return global.joysticks[input].posdrop;
						if axis == -1 return global.joysticks[input].posdrop;
						break;
				}
			}
			break;
	}
}

enum INPUT {
	PRESSED,
	HELD,
	RELEASED,
}

enum DEVICE {
	KEYBOARD,
	MOUSE,
	CONTROLLER,
	JOYSTICK,
}

function input_device(input) {
	if input >= mb_left && input <= mb_side2 {
		return DEVICE.MOUSE;
	} else if input >= gp_face1 && input <= gp_padr {
		return DEVICE.CONTROLLER;
	} else if input >= gp_axislh && input <= gp_axis_orientation_w {
		return DEVICE.JOYSTICK;
	} else return DEVICE.KEYBOARD;
}



/*
#macro pressed hit
#macro held hold
#macro released drop