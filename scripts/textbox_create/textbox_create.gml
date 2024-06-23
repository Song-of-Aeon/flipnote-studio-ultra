function textbox_create(textscript=txt_example, style=global.textstyles.adv, autoadvancewait=false, destroyothers=true) {
	instance_destroy(destroyothers ? o_textbox : noone);
	var chump = instance_create(style.x, style.y, o_textbox);
	chump.width = style.width;
	chump.height = style.height;
	chump.spriteposy = style.spriteposy;
	chump.msgscript = textscript;
	chump.sprite_index = style.sprite;
	chump.namepos = style.namepos;
	chump.font = style.font;
	chump.draw = method(chump, style.type);
	chump.style = style;
	with chump {
		msgscript();
		if autoadvancewait == false {
			advance = true;
			naturaladvance = true;
			cooldown = 0;
		} else { //pass int to autoadvance text after that amount of frames
			advance = false;
			naturaladvance = false;
			cooldown = autoadvancewait;
		}
		textline_next();
	}
	return chump;
}