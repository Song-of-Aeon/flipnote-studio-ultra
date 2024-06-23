function draw_spr(x, y, thing, index=0, xscale=1, yscale=1, angle=0, color=c_white, alpha=draw_get_alpha(), antialiased=false) {
	/*switch typeof(thing) {
		case "string":
		case "array":
		case "struct":
			if !parameter parameter = u;
			draw_string(x, y, thing, parameter, scale, angle, color);
			exit;
		default:
			
	}*/
	//exit;
	/*if thing == s_mistake || thing == s_regret && alpha > .1 {
		
	}*/
	if antialiased gpu_set_tex_filter(true);
	draw_sprite_ext(thing, index, x, y, xscale, yscale, angle, color, alpha);
	if antialiased gpu_set_tex_filter(false);
}