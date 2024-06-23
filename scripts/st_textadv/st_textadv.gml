function st_textadv() {
	draw_set_font(font);
	draw_self(); //hi!! hi guys!!!!
	draw_set_color(talkers[0].namecolor);
	draw_set_halign(fa_center);
	draw_text(namepos.x, namepos.y, talkers[0].displayname);
	draw_set_halign(fa_left);
	draw_set_color(c_white);
	
	var xpos = 0;
	var lb = 0;
	var ftheight = string_height("O"); //O
	
	var textheight = (string_count("\n", string_copy(msg[talkpos].text, 1, charpos))+1)*ftheight;
	while textheight >= height { //if youre goin outta the textbox get yo ass up a line
		lb--;
		textheight -= ftheight;
	}
	color = c_white;
	size = 1;
	angle = 0;
	alpha = 1;
	textpos = new vec2();
	var mychar = "";
	for (i=1; i<=charpos; i++) { //aw yeah, now this is happening!
		textpass();
		mychar = string_char_at(msg[talkpos].text, i);
		textpos.x = x+xpos-width/2;
		textpos.y = y+lb*ftheight;
		textpos.y -= ftheight*(size-1)/2;
	    if mychar = "\n" {
	        lb++;
	        xpos = 0;
	    } else if lb >= 0 {
			draw_set_color(color);
			draw_set_alpha(alpha);
			//draw_text_transformed(textpos.x, textpos.y, mychar, size, size, angle); //yeah i mean thas text baby
			draw_string(textpos.x, textpos.y, mychar, u, size, u, angle);
			xpos += string_width(mychar)*size;
		}
	}
	if charpos >= string_length(msg[talkpos].text) {
		draw_set_alpha(sin(waitcount/30)*.3+.5);
		draw_text(x+width/2, y+height, "*"); //"you can advance text now" thing.
		draw_set_alpha(1);
	}
	draw_set_color(c_white);
	draw_set_alpha(1);
}