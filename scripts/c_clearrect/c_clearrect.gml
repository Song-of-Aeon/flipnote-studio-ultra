function clearrect(x_, y_, x2, y2, strong=false, includemine=false, whattodo=instance_destroy) {
	//do you think i care
	whattodo = munction(whattodo);
	var cleared = 0;
	var xmedian = (x_+x2)/2;
	var ymedian = (y_+y2)/2
	var xradius = abs(x_-x2);
	var yradius = abs(y_-y2);
	
	var i;
	with o_bullet {
		if abs(x-xmedian) < xradius && abs(y-ymedian) < yradius && (includemine ? true : (friendly == false)) && (strong ? true : destructible) {
			whattodo();
			cleared++;
		}
		
	}
	return cleared;
}

function clearline(x, y, x2, y2, strong=false, includemine=false, whattodo=instance_destroy) {
	var ihatelistssogoddamnmuch = ds_list_create();
	collision_line_list(x, y, x2, y2, o_bullet, true, false, ihatelistssogoddamnmuch, false);
	var yippee = ds_list_to_array(ihatelistssogoddamnmuch);
	ds_list_destroy(ihatelistssogoddamnmuch);
	var i, mine;
	var cleared = 0;
	whattodo = munction(whattodo);
	iterate yippee to {
		mine = yippee[i];
		if (includemine ? true : (mine.friendly == false)) && (strong ? true : mine.destructible) with yippee[i] {
			whattodo();
			cleared++;
		}
	}
	return cleared;
}

//global.bullettypes = [o_bullet, o_curvylaser, o_hitscan];