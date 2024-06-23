function hitscandraw() {
	if delay {
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha/3);
		draw_sprite_ext(colorcover, image_index, x, y, image_xscale, image_yscale, image_angle, color, image_alpha/3);
	} else {
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
		draw_sprite_ext(colorcover, image_index, x, y, image_xscale, image_yscale, image_angle, color, image_alpha);
	}
}
function hitscanflat() {
	if delay {
		draw_sprite_ext(colorcover, image_index, x, y, image_xscale, image_yscale, image_angle, color, image_alpha/3);
	} else {
		draw_sprite_ext(colorcover, image_index, x, y, image_xscale, image_yscale, image_angle, color, image_alpha);
	}
}