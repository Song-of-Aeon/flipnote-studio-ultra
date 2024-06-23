z = 0;
depth = -1000;
scale = 1;
dir = 0;
image_angle = dir - 90;
spd = 0;
tspd = 0; //turnspeed
hspd = 0;
vspd = 0;
//dspd = 0;
//acc = 0;
count = 0;
timescale = 1;
behaviors = c_null;
//draw = c_bulletdraw;
rotate = true;
additive_ = false;
type = global.bullets.small;
grazed = false;
image_alpha = .4;
//acount = .4;
alpha = 0;
//didit = false;
//created = false;
//show_debug_overlay(true);
//depth = 10;
simple = false;
fxscale = scale*((alpha-image_alpha)*4+1);
iterations = 0;
//STATS.bulletsspawned++;
//intangible = false;
despawn = c_null;
escapedistance = 50;
//designed = false;
addvspd = 0;
color = c_white;
die = instance_destroy
particling = false;

//event_perform_object(self,ev_step,0);

//image_angle = point_direction(xprevious, yprevious, x, y)-90;



normaldraw = false;
dspd = 0;
MadeAGlobalDotParticleIncrement = false;