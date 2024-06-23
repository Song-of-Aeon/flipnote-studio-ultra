function sm_parse(path) {
	var data = sm_data(path);
	var sm = file_text_open_read(path);
	log(path);
	if !sm return false;
	//var offset = data.OFFSET;
	var offset = 0;
	var lanes = 4;
	var tempnotes = [];
	var guys = [[]];
	var myline;
	do myline = file_text_readln(sm) until string_contains(myline, "NOTES");
	repeat(5) file_text_readln(sm);
	
	var eye = 0;
	var jay = 1;
	do {
		myline = file_text_readln(sm);
		if string_contains(myline, ";") break;
		if string_contains(myline, ",") {
			jay = 1;
			eye++;
			continue;
		}
		if string_contains(myline, "/") continue;
		var mylane = 0;
		repeat(lanes) {
			var thing = string_copy(myline, mylane+1, 1);
			switch thing {
				case "M":
					thing = NOTES.MINE;
					break;
				case "L":
					thing = NOTES.LIFT;
					break;
				case "F":
					thing = NOTES.FAKE;
					break;
				default:
					thing = real(thing);
					break;
			}
			guys[eye][jay-1] = thing;
			jay++;
			mylane++;
		}
	} until false;
	file_text_close(sm);
	
	var j, curbeat, beatdepth, thecolor, notedepth;
	iterate guys to {
		beatdepth = array_length(guys[i])/lanes;
		for (j=0; j<array_length(guys[i]); j++) {
			if guys[i][j] {
				curbeat = floor(j/lanes)/beatdepth+i;
				notedepth = floor(j/lanes)%(beatdepth/4);
				array_push(tempnotes, new note(beatcalc(curbeat, mysong.bpm)+offset, j%4, guys[i][j], notedepth));
			}
		}
	}
	return tempnotes;
}

function beatcalc(beat, bpm=global.playingmusic.bpm) {
	return (beat*4)/(bpm/60);
}
