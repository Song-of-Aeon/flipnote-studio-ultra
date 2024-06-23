if normaldraw {
	draw_sprite_ext(sprite_index, image_index, x, y, fxscale, fxscale, image_angle, image_blend, image_alpha);
	draw_sprite_ext(colorcover, image_index, x, y, fxscale, fxscale, image_angle, color, image_alpha);
} else {
	draw();
}
