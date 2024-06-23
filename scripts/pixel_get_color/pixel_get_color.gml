function pixel_get_all(layer_, color) {
	//buffer_seek(layer_.buff, buffer_seek_start, 0);
	//buffer_read()
	
	
}

function pixel_apply_effect(layer_, pixelspos, effect) {
	var validpos = [];
	iterate pixelspos to {
		array_push(validpos, surface_get_width(layer_.surf)*pixelspos[i].y+pixelspos[i].x);
	}
	iterate validpos to {
		buffer_seek(layer_.buff, buffer_seek_start, validpos[i]*4);
		effect(layer_.buff);
	}
}

//this is going to be the slowest god damn program of all time. what the hell. theres got to be a better way
//i need a diff