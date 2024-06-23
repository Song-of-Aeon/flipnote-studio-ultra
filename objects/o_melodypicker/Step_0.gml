var select = { //temporary implement so this all works without my huge input system. replace with whatever you use
	hit: keyboard_check_pressed(vk_enter),
	hold: keyboard_check(vk_enter),
	drop: keyboard_check_released(vk_enter),
}
var back = {
	hit: keyboard_check_pressed(vk_escape),
	hold: keyboard_check(vk_escape),
	drop: keyboard_check_released(vk_escape),
}
var down = {
	hit: keyboard_check_pressed(vk_down),
	hold: keyboard_check(vk_down),
	drop: keyboard_check_released(vk_down),
}
var up = {
	hit: keyboard_check_pressed(vk_up),
	hold: keyboard_check(vk_up),
	drop: keyboard_check_released(vk_up),
}

ptnpos = cycle(ptnpos+down.hit-up.hit, array_length(musicdata));
linelerp = lerp(linelerp, 1, .1);
scroll = lerp(scroll, ptnliteral, .1);
if down.hit || up.hit linelerp = 0;
if select.hit && !dancing {
	dance_start(musicdata[ptnpos], musicdata[ptnpos].name);
	dancing = true;
}
if back.hit && dancing {
	dance_stop();
	var dudes = struct_get_names(global.tags);
	iterate dudes to {
		tag_kill(global.tags[$dudes[i]]);
	}
	dancing = false;
}