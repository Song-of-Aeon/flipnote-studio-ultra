var pos, percent;
iterate notes to {
	percent = notes[i].pos/(drawthreshold*global.bar); //beats ahead that you see instead of mmod
	if percent > 1 continue;
	//log(percent);
	pos = new vec2(ARTICULATOR.x+(WIDTH-ARTICULATOR.x)*percent, ARTICULATOR.y+easeclamp(ac_crunch, abs(percent-1), 1, notes[i].lane*128-(128*2.5)));
	draw_set_alpha(1-notes[i].hit*.3-notes[i].missed*.3);
	//if is_oob(50, u, u, pos) continue;
	draw_set_color(notes[i].color);
	draw_ring(pos.x, pos.y, 6, true);
	if notes[i].type == NOTES.FREEZE || notes[i].type == NOTES.ROLL {
		draw_stroke(pos.x+.5, pos.y, pos.x+.5, pos.y+4*xmod, 2);
	}
	if notes[i].type == NOTES.CONCLUDE {
		draw_stroke(pos.x-.5, pos.y, pos.x-.5, pos.y-4*xmod, 2);
	}
	//draw_text(WIDTH*.2-30+notes[i].lane*20, notes[i].pos*32*xmod, notes[i].pos);
}
draw_reset();
var present_time = audio_sound_get_track_position(global.playingmusicdata);
draw_text(5, 15, present_time);