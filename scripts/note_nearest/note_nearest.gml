function note_nearest(backward=true, forward=true) {
	var closest = [new note(infinity, -1, NOTES.FAKE, 0)];
	with o_melodychaser {
		iterate notes to {
			if !backward && notes[i].pos < 0 continue;
			if !forward && notes[i].pos > 0 continue;
			if notes[i].hit continue;
			if abs(notes[i].pos) < abs(closest[0].pos) {
				closest = [notes[i]];
			}
			if abs(notes[i].pos) == abs(closest[0].pos) {
				array_push(closest, notes[i]);
			}
		}
	}
	return closest;
}

function notes_past(time) {
	var thenotes = [];
	with o_melodychaser {
		iterate notes to {
			if time <= 0 && notes[i].pos <= time array_push(thenotes, notes[i]);
			if time > 0 && notes[i].pos >= time array_push(thenotes, notes[i]);
		}
	}
	return thenotes;
}

globalvar FANTASTIC;
FANTASTIC = 0;
globalvar PERFECT;
PERFECT = .03;
globalvar GREAT;
GREAT = .055;
globalvar GOOD;
GOOD = .1;
globalvar MISS;
MISS = .2;

//function hit_note()