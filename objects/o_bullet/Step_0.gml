direction = dir;
speed = spd*timescale;
image_alpha = min(image_alpha+.04, alpha);
fxscale = scale*((alpha-image_alpha)*4+1);
image_angle = dir-90;
dir += tspd;
if !simple behaviors();
if !(x==clamp(x, -escapedistance, room_width+escapedistance) && y==clamp(y, -escapedistance, room_height+escapedistance)) {
	instance_destroy();
}