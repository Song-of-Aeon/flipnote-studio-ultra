function latest_pressed() {
	var keyb = latest_keyboard_pressed();
	var cont = latest_controller_pressed();
	if keyb return keyb else return cont;
}

function latest_keyboard_pressed() {
	if keyboard_check_pressed(vk_anykey) {
		return keyboard_key != vk_nokey ? keyboard_key : false;
	}
}

function latest_controller_pressed() {
	var i;
	for (i=gp_face1; i<=gp_axisrv; i++) {
		if input_active(i, INPUT.PRESSED) return i;
	}
	return false;
}