
	behaviors();
	dir += tspd;
	spd += acc;
	direction = dir;
	//dir2hv(dir, spd);
	//log(direction, dir);


	if delay {
		delay--;
		/*hv2dir(hspd, vspd);
		hspd = 0;
		vspd = 0;*/
		//endtime -= (abs(hspd)+abs(vspd))/2;
		//image_yscale-=1/sprite_get_height(sprite_index);
	} else {
		width += decay;
		duration--;
		//if width < maxwidth/2 friendly = NaN;
		if duration <= 0 || !width {
			instance_destroy();
		}
	}
	image_alpha = alpha;