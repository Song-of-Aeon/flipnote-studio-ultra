function shootvideo(x, y, mp4, archetype, verticalresolution, verticalsize) {
	var lad = observer_create(o_movie);
	lad.vid = video_open(mp4);
	video_set_volume(0);
	lad.type = archetype;
	lad.vertres = verticalresolution;
	lad.vertsize = verticalsize;
	return lad;
}
//video functions
//vunctions