function artlayer(width, height) constructor {
	surf = surface_create(width, height);
	buff = buffer_create(0, buffer_grow, 1);
	buffer_get_surface(buff, surf, 0);
	offset = new vec2(0, 0);
	blending = new blendmode(bm_one, bm_zero);
	refresh = function() {
		if !surface_exists(surf) {
			pushon();
		}
		buffer_delete(buff);
		buff = buffer_create(0, buffer_grow, 1);
		buffer_get_surface(buff, surf, 0);
		//dynamic resizing and offset please
	}
	pushon = function() {
		buffer_set_surface(buff, surf, 0);
		//drawto surf draw_clear_alpha(c_black, 0)}
	}
	draw = function() {
		refresh();
		//blending.start();
		gpu_set_blendmode_ext_sepalpha(bm_src_alpha, bm_inv_src_alpha, bm_one, bm_inv_src_alpha);
		draw_surface(surf, offset.x, offset.y);
		gpu_set_blendmode(bm_normal);
		//blending.stop();
	}
}


function blendmode(src_, dest_, shader_, uniforms_) constructor { //archetype
	src = src_;
	dest = dest_;
	start = function() {
		gpu_set_blendmode_ext(src, dest);
	}
	stop = function() {
		gpu_set_blendmode(bm_normal);
	}
}