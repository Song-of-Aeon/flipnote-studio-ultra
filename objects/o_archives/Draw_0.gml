
if cutscenes[pos].unlocked {
	var dudes = cutscenes[pos].talkers;
	var leng = array_length(dudes)+1;
	for (i=leng-2; i>=0; i--) {
		//log(dudes[i]);
		draw_spr(640-440+((i+1)/leng)*440, 360/2, dudes[i].char.sprite, dudes[i].val, -1);
	}
}
//draw_spr(580+4, 380+4, global.chara[$cutscenes[pos].playable].menusprite, 0, 1/3, 1/3, 0, c_aolu, u, true);
//draw_spr(580, 380, global.chara[$cutscenes[pos].playable].menusprite, 0, 1/3, 1/3, 0, u, u, true);


var xdraw = 10;
var ydraw = 10;
var width = 640*.4-15;
var height = 360-20;
var surf = surface_create(width, height);
surface_set_target(surf);
draw_clear_alpha(c_black, 0);

var margin = 7;
var textpos = 0;

iterate cutscenes to {
	var selected = pos == i;
	var name = cutscenes[i].name;
	if !cutscenes[i].unlocked name = "?????";
	if cutscenes[i].route != "" {
		name = cutscenes[i].route + " - " + name;
	}
	if selected {
		
		//draw_string(margin+linelerp, margin+textpos-scroll+linelerp, name, u, u, c_aolu);
		draw_set_color(c_aolu);
		draw_marquee(margin, margin+textpos-scroll, width-margin*2, name, -progger*.55);
		draw_set_color(c_white);
		if cutscenes[i].unlocked {
			//draw_string(margin, margin+textpos-scroll, name);
			draw_marquee(margin, margin+textpos-scroll, width-margin*2, name, -progger*.55);
			//draw_line(margin-1, margin+textpos+11-scroll, margin-1+(string_width(name))*linelerp+2, margin+textpos+11-scroll);
		}
		draw_set_color(c_aolu);
		//draw_line(margin-1+1, margin+textpos+11-scroll+1, margin-1+(string_width(name))*linelerp+2+1, margin+textpos+11-scroll+1);
		draw_set_color(c_white);
		ptnliteral = max(textpos-height/2, 0);
	} else {
		draw_set_color(c_aolu);
		draw_marquee(margin, margin+textpos-scroll, width-margin*2, name, 0);
		draw_set_color(c_white);
	}
	
	textpos += 20;
}
ptnliteral = min(ptnliteral, array_length(cutscenes)*20+margin-height);
surface_reset_target();
draw_surface(surf, xdraw, ydraw);
surface_free(surf);
