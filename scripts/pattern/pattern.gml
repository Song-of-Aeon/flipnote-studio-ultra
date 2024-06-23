/// @desc Function ALL FUNKIES MUNKIED TO BOSS
function pattern(step_=c_null, time_=60, name_="", create_=c_null, draw_=c_null, clear_=c_null) constructor {
	create = munction(create_);
	step = munction(step_);
	draw = munction(draw_);
	time = time_;
	name = name_;
	clear = munction(clear_);
	count = 0;
	iterations = 0;
	global.patterns[$name] = self;
}

//function pattern_ext(step_=[c_null, c_null, c_null, c_null], hp_=15, time_=60, character_="touhou", type_=SPELL.NON, name_="", create_=[c_null, c_null, c_null, c_null], draw_=c_null, clear=c_null, desc_="") constructor {}