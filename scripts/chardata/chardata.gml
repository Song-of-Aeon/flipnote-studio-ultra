function chardata(name_="drip", displayname_="among", sprite_=s_null, talksound_=se_null, textspeed_=.5, font_=ft_example, step_=talkcharstep, draw_=talkchardraw, texteffects_="", namecolor_=c_white) constructor {
	name = name_; //character data is made from this. you know how sayori and friends have those .chr files? except theyre just arg stuff and dont actually contain the character data?
	displayname = displayname_; //yeah. mine are real.
	sprite = sprite_;
	talksound = talksound_;
	textspeed = textspeed_;
	font = font_;
	step = step_;
	draw = draw_;
	texteffects = texteffects_;
	namecolor = namecolor_;
	sprcount = 0;
	addspr = function(name_) {
		var myfriend = self;
		self[$name_] = {
			val: sprcount++,
			char: myfriend,
		}
	}
	global.textguy[$name] = self;
}