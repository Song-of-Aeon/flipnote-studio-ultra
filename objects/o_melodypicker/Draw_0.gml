if dancing exit;
var xdraw = 10;
var ydraw = 10;
var width = 640*.4-15;
var height = 360-20;
var surf = surface_create(width, height);
//draw_sprite_stretched(s_stuffholder, 2, xdraw, ydraw, width, height);
surface_set_target(surf);
draw_clear_alpha(c_black, 0);

var margin = 7;
var textpos = 0;

ptnliteral = min(ptnliteral, array_length(musicdata)*20+margin-height);
iterate musicdata to {
	var name = musicdata[i].name;
	draw_text(margin, margin+textpos-scroll, name);
	if ptnpos == i {
		draw_stroke(margin-1, margin+textpos+19-scroll, margin-1+(string_width(name))*linelerp, margin+textpos+19-scroll, 2);
		//draw_stroke(50, 50, 50+200*linelerp, 100, 2);
		//log(linelerp);
		ptnliteral = max(textpos-height/2, 0);
	}
	textpos += 20;
}
surface_reset_target();
draw_surface(surf, xdraw, ydraw);
surface_free(surf);