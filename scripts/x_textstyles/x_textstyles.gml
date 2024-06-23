global.textstyles = {};

global.textstyles.adv = {
	x: 320,
	y: 250,
	width: 394, //used to determine start of text, where things are autolinebroken, and where talksprites float along. give it a bit of margin from the end of the sprite, usually
	height: 60, //used to determine when it needs to hide old lines for new ones in a single txt().
	spriteposy: 150, //vertical position of talksprites
	namepos: new vec2(147, 223), //where the name for the talker should show up
	sprite: s_spacetext,
	type: st_textadv, //draw update
	font: ft_example,
}

global.textstyles.nvl = {
	x: 320,
	y: 24,
	width: 398,
	height: 284,
	spriteposy: 150,
	namepos: new vec2(-216, 7),
	sprite: s_bigtext,
	type: st_textnvl,
	font: ft_example,
}
