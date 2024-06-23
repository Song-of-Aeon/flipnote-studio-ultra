function talkcharstep() { //change this if you so desire
	x = lerp(x, o_textbox.x+(position-2)*o_textbox.width/5, .065);
	alpha = position != SPRITEPOS.HIDDEN;
}

function talkchardraw(pos) {
	draw_sprite_ext(
		sprite, index, x, y,
		position > SPRITEPOS.CENTER ? -1 : 1, 1, 0, //sprites automatically flip if theyre past the center
		make_color_hsv(0, 0, 255-(pos>0)*100), alpha
	);
}