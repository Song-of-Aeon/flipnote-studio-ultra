//state();

var select = { //temporary implement so this all works without my huge input system. replace with whatever you use
	hit: keyboard_check_pressed(vk_enter),
	hold: keyboard_check(vk_enter),
	drop: keyboard_check_released(vk_enter),
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

var name = cutscenes[pos].name;
if !cutscenes[pos].unlocked name = "?????";
if cutscenes[pos].route != "" {
	name = cutscenes[pos].route + " - " + name;
}
if string_width(name) > 640*.4-15-14 {
	progger++;
}

pos = cycle(pos+down.hit-up.hit, array_length(cutscenes));
//brightness = lerp(brightness, 1, .1);
linelerp = lerp(linelerp, 1, .1);
scroll = lerp(scroll, ptnliteral, .1);
if down.hit || up.hit {
	linelerp = 0;
	progger = 0;
}
if select.hit && cutscenes[pos].unlocked {
	global.playingthing = cutscenes[pos].thescript;
	//global.realplayingthing = cutscenes[pos];
	//c_transition(LIBRARY);
	//se_play(se_menu_select);
	textbox_create(cutscenes[pos].thescript, cutscenes[pos].textstyle);
	kys;
}