c_input();
var xratio = WIDTH/xscale;
var yratio = vertsize/yscale;
var iterator = 0;
var iterator2 = 0;
var destroyedBullets = 0;
if !created {
	var i, j;
	for (i=0; i<xscale; i++) {
		if iterator2%vertres {
			for (j=0; j<yscale; j++) {
				bullets[i][j] = noone;
			}
		} else {
			for (j=0; j<yscale; j++) {
				if iterator%vertres {
					bullets[i][j] = noone;
				} else {
					var boul = shoot(j*xratio, i*yratio, 0, 270, bul.micro, c_black, u, c_flatcolor);
					boul.destructible = false;
					boul.friendly = NaN;
					bullets[i][j] = boul;
					if is_oob(u, u, u, boul)
					{
						instance_destroy(boul);
						destroyedBullets++
					}
				}
				iterator++;
			}
		}
		iterator2++;
	}
	created = true;
	log(destroyedBullets);
}

c_input();
if left.hit {
	video_seek_to(video_get_position()-5000);
} else if right.hit {
	video_seek_to(video_get_position()+5000);
}


thesurf = video_draw();

if !(thesurf[0]+1) {
	log("MOVIE NIGHT CANCELLED");
	exit;
}
if !surface_exists(realsurf) {
//	realsurf = surface_create(array_length(bullets[0]), array_length(bullets));
	realsurf = surface_create(array_length(bullets[0]), array_length(bullets));
}

surface_set_target(realsurf);
var ratio = vertsize/surface_get_height(thesurf[1]);
var bigsize = surface_get_width(thesurf[1])*ratio-WIDTH;
//ratio /= 2;
draw_surface_stretched(thesurf[1], -bigsize/2, 0, surface_get_width(thesurf[1])*ratio, surface_get_height(thesurf[1])*ratio);
surface_reset_target();
//surface_set_target(global.surfaces.bg);
//draw_surface_stretched(realsurf, 0, 0, WIDTH, vertsize);
shotsprite++;

var buffy = buffer_create(surface_get_width(realsurf)*surface_get_height(realsurf)*4, buffer_fast, 1);
//log(buffer_tell(buffy));
buffer_get_surface(buffy, realsurf, 0);
//log(buffer_tell(buffy));
buffer_seek(buffy, buffer_seek_start, 0);
//log(buffer_get_size(buffy));
//log(buffer_tell(buffy));
var r, g, b;
var i, j;
iterate bullets to {
	double bullets gamble {
		b = buffer_read(buffy, buffer_u8);
		g = buffer_read(buffy, buffer_u8);
		r = buffer_read(buffy, buffer_u8);
		if instance_exists(bullets[i][j]) {
			
			bullets[i][j].color = make_color_rgb(b, g, r);
		}
		//bullets[i][j].color = buffer_read(buffy, buffer_u32);
		buffer_read(buffy, buffer_u8);
	}
}
buffer_delete(buffy);