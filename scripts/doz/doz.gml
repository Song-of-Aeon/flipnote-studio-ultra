function doz() {
	z += dspd;
	if z < 0 {
		if friendly == true || friendly == false {
			zfriendly = friendly;
			friendly = NaN;
		}
	} else {
		friendly = zfriendly;
	}
	image_xscale = scale+z/20;
	image_yscale = scale+z/20;
	image_alpha = 1+z/10;
}
#macro cz cpp() doz()