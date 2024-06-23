//listen man, it works

gpu_set_blendmode(bm_add);
draw_surface(textsurf, 0, 0);
gpu_set_blendmode(bm_normal)
gpu_set_colorwriteenable(1,1,1,0);
draw_surface(textsurf, 0, 0);
gpu_set_colorwriteenable(1,1,1,1);