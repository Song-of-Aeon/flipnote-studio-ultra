function draw_marquee(x, y, width, text, currentoffset=0, seperation=string_width(text)<width-10 ? width-string_width(text) : 40) { //also known as "draw_text_tiled"
	//text = ss(text, global.lang);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	var surf = surface_create(width, string_height(text));
	surface_set_target(surf);
	draw_clear_alpha(c_black, 0);
	var chunksize = string_width(text)+seperation;
	currentoffset %= chunksize;
	var xdraw;
	for (xdraw=-chunksize+currentoffset; xdraw<width; xdraw+=chunksize) {
		draw_string(xdraw, 0, text);
	}
	surface_reset_target();
	draw_surface(surf, x, y);
	surface_free(surf);
}

//new dext() //draw text
//pass into other drawing functions
//so i dont have to make a billion arguments or ext functions for everything