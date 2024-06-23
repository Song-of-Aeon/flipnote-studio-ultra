offset -= delta_time/1000000;
if offset > 0 {
	log(offset);
	exit;
}
var present_time = audio_sound_get_track_position(global.playingmusicdata);
iterate global.beatstates to {
	if global.beatstates[i] == NOTES.FREEZE || global.beatstates[i] == NOTES.SUSTAIN {
		//log("sustaining");
		global.beatstates[i] = NOTES.SUSTAIN;
	} else if global.beatstates[i] == NOTES.ROLL || global.beatstates[i] == NOTES.SUSTAINROLL {
		//log("rolling");
		global.beatstates[i] = NOTES.SUSTAINROLL;
	} else {
		global.beatstates[i] = NOTES.EMPTY;
	}
}
global.beatbool = false;
if !created {
	notes = sm_parse(mysong.map);
	global.bar = beatcalc(1);
	log(notes[0].time);
	//log(notes[7].time);
	created = true;
}

//log(notes[0].pos);
iterate notes to {
	notes[i].pos = notes[i].time-present_time;
	if notes[i].pos <= 0 && !notes[i].consumed {
		beatpulse(notes[i].lane, notes[i].type);
		notes[i].consumed = true;
		//array_delete(notes, i, 1);
		//i--;
	}	
}

var left = {
	hit: keyboard_check_pressed(vk_left),
	hold: keyboard_check(vk_left),
	drop: keyboard_check_released(vk_left),
}
var right = {
	hit: keyboard_check_pressed(vk_right),
	hold: keyboard_check(vk_right),
	drop: keyboard_check_released(vk_right),
}

if left.hit {
	audio_sound_set_track_position(global.playingmusicdata, audio_sound_get_track_position(global.playingmusicdata)-5);
	created = false;
}
if right.hit {
	audio_sound_set_track_position(global.playingmusicdata, audio_sound_get_track_position(global.playingmusicdata)+5);
}