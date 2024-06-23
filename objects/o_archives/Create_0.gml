
//x_characters();
global.playingthing = txt_;
dialogueinfo = function(script_, name_="so hows the weather", talkers_=[AEON.LOOKLEFT], route_="", textstyle_=global.textstyles.adv, background_=s_null, unlocked_=true) constructor {
	thescript = script_;
	name = name_;
	talkers = talkers_;
	route = route_;
	textstyle = textstyle_;
	background = background_;
	unlocked = unlocked_;
}
music_set(mus.null);
pos = 0;
guys = [];
lerper = 0;
cutscenes = [
	new dialogueinfo(txt_, "nothing", []),
	
	new dialogueinfo(txt_example, "pre-sans dialogue", [AEON.TALKING], "genocide route"),
];

ptnliteral = 0;
pos = 0;
linelerp = 0;
scroll = 0;
progger = 0;

myfriend = noone;
/*var dudes = variable_struct_get_names(global.bosses);
iterate profiledata to {
	if !array_contains(dudes, profiledata[i].fullname) {
		array_delete(profiledata, i, 1);
		i--;
	}
}*/
iterate cutscenes to {
	if cutscenes[i].thescript == global.playingthing {
		pos = i;
		exit;
	}
}