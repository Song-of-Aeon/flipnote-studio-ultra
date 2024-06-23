if !surface_exists(textsurf) { //thanks, windows
	textsurf = surface_create(room_width, room_height);
}

var select = { //temporary implement so this all works without my huge input system. replace with whatever you use
	hit: keyboard_check_pressed(vk_enter),
	hold: keyboard_check(vk_enter),
	drop: keyboard_check_released(vk_enter),
}
var back = {
	hit: keyboard_check_pressed(vk_space),
	hold: keyboard_check(vk_space),
	drop: keyboard_check_released(vk_space),
}
var skip = {
	hit: keyboard_check_pressed(vk_control),
	hold: keyboard_check(vk_control),
	drop: keyboard_check_released(vk_control),
}
var save = {
	hit: keyboard_check_pressed(ord("Q")),
	hold: keyboard_check(ord("Q")),
	drop: keyboard_check_released(ord("Q")),
}
var load = {
	hit: keyboard_check_pressed(ord("W")),
	hold: keyboard_check(ord("W")),
	drop: keyboard_check_released(ord("W")),
}
var leave = {
	hit: keyboard_check_pressed(ord("E")),
	hold: keyboard_check(ord("E")),
	drop: keyboard_check_released(ord("E")),
}

if save.hit textbox_save();
if load.hit if textbox_load() exit;
if leave.hit {
	instance_destroy(o_textbox);
	observer_create(o_archives);
	exit;
}

wait--;
if !advance select.hit = false; //if autoadvance is enabled, inputting these does nothing
if !advance back.hit = false;

if skip.hold { //skip text really fast!
	select.hit = true;
	wait = 0;
}

if interim {
	textline_next();
	exit;
}

skip = select.hit;
if back.hit halting = !halting;
if select.hit halting = false;

var i;
for (i=array_length(talkers)-1; i>=0; i--) {
	talkers[i].step();
}

if wait || halting exit;

count++; //my favorite line

if charpos < string_length(msg[talkpos].text) {
	charpos += talkspeed;
	if !(count%(4+round((1/talkspeed)/4))) { //talksounds. they have some random pitch and whatever
		audio_play_sound(talkers[0].talksound, 0, false,,, random(.6)+talkspeed);
	}
	if skip charpos = string_length(msg[talkpos].text);
} else {
	waitcount++;
	if waitcount < cooldown exit;
	isdone = true;
	if !advance gotime = true;
    if select.hit textboxes_complete();
	if gotime {
		waitcount = 0;
		gotime = false;
		if talkpos < array_length(msg)-1 {
			textline_next();
		} else {
			endevent();
			instance_destroy(); //you should kill yourself NOW
		}
	}
}

