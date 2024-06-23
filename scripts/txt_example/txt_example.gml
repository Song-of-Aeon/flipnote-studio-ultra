function txt_example() { //note the inherited scope partying
	
	global.lv = 19;
	
	msg = [
	
	//txt("* human.\n* i remember you're |cFF3333GENOCIDES|cFFFFFF.", AEON.NEUTRAL, SPRITEPOS.RIGHT),
	//txt("* heya.", AEON.NEUTRAL, SPRITEPOS.RIGHT),
	txt("* heya.", AEON.NEUTRAL, SPRITEPOS.RIGHT),
	txt("* you've been busy, huh?", AEON.HEH),
	txt("* ...", AEON.HEH, SPRITEPOS.MIDRIGHT),
	txt("* so, i've got a question for ya.", AEON.LOOKRIGHT),
	txt("* do you think even the worst person can change?", AEON.LOOKRIGHT),
	txt("* that everybody can be a good person, if they just try?", AEON.LOOKLEFT),
	txt("* heh heh heh heh...", AEON.HEH),
	txt("* alright.", AEON.TALKING),
	txt("* well, here's a better question.", AEON.RESTING),
	txt("* do you wanna have a bad time?", AEON.HEH),
	txt("* cause if you take another step forward...", AEON.LOOKLEFT),
	txt("* you are REALLY not going to like what happens next.", AEON.HEH),
	txt("* ...", AEON.HEH, SPRITEPOS.CENTER+.1),
	txt("* welp.", AEON.RESTING),
	txt("* sorry, old lady.", AEON.RESTING),
	txt("* this is why i never make promises.", AEON.LOOKRIGHT, SPRITEPOS.CENTER),
	
	];
	
	endevent = function() {
		log("GAME OVER, MAN!");
		//game_end();
		startpattern("Midnight Alarm");
	};
}