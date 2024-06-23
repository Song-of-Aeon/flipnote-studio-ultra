function dance_start(song_) {
	var chump = observer_create(o_melodychaser);
	music_set(song_);
	chump.mysong = song_;
	if song_.offset < 0 {
		chump.negoffset = song_.offset;
	} else {
		chump.offset = song_.offset;
	}
	chump2 = instance_create(WIDTH*.25, HEIGHT*.8, ARTICULATOR);
	return 
}

function dance_stop() {
	with o_textbox {
		if msgscript == txt_empty kys;
	}
	instance_destroy(o_melodychaser);
	instance_destroy(ARTICULATOR);
	music_set(mus.null);
}