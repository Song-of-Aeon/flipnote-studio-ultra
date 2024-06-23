function txt(text_="never again.", sprite_=global.textguy[$"nothingman"].NOTHING, spritepos_=SPRITEPOS.REPLACE, event_=c_null) {
	return { //yeah i just didnt want to write new when i used this. its basically a constructor
		text: text_, //string please
		name: sprite_.char.name, //automatically taken from the sprite you give the dude
		sprite: sprite_.val,
		guy: sprite_.char,
		event: event_, //function that runs when the line starts
		spritepos: spritepos_, //relative to textbox size
		type: "normal",
	};
}

enum SPRITEPOS {
	LEFT,
	MIDLEFT,
	CENTER,
	MIDRIGHT,
	RIGHT,
	HIDDEN = 999,
	REPLACE = 1000,
}