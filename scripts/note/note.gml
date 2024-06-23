function note(time_, lane_, type_, depth_) constructor {
	//lane_--;
	depth = depth_;
	switch depth {
		case 0:
			color = c_red;
			break;
		case 1:
			color = c_blue;
			break;
		default:
			color = c_purple;
			break;
	}
	type = type_;
	switch type {
		case NOTES.FREEZE:
			color = c_green;
			break;
		case NOTES.CONCLUDE:
			color = c_teal;
			break;
		case NOTES.ROLL:
			color = c_pink;
			break;
		case NOTES.MINE:
			color = c_grey;
			break;
		case NOTES.LIFT:
			color = c_olive;
			break;
		case NOTES.FAKE:
			color = c_maroon;
			break;
	}
	
	lane = lane_;
	time = time_;
	pos = time;
	consumed = false;
	hit = false;
	missed = false;
}

enum NOTES {
	EMPTY,
	HIT,
	FREEZE,
	CONCLUDE,
	ROLL,
	SUSTAIN,
	SUSTAINROLL,
	MINE,
	LIFT,
	FAKE,
}