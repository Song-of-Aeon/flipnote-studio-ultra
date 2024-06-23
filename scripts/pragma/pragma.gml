global.textguy = {};
global.bullets = {};
global.lasers = {};
global.hitscans = {};
global.patterns = {};
global.tracklist = {};
//¡¡MUY IMPORTANTE!!
//global.textguy must be defined BEFORE character files.
//i have introduced script load order importance to your game. sorry.
//in the yyp just make sure pragma.gml is above all the chr_ files and you should be good

#macro nu var newwithouttheassignment = new 
#macro sec *60
#macro u undefined
#macro bul global.bullets
#macro las global.lasers
#macro hsn global.hitscans
#macro c_evil 0x999900
#macro c_pink 0xFF8FFF
#macro c_cyan $ECD919
#macro c_stop $FFA914
#macro c_aolu $FF8080
#macro c_gold $73D1FA
#macro c_violet $E643A0
#macro c_purple $FF0080
#macro c_blue $FF2121
#macro c_green $50fb50
#macro c_brown $1C2554
#macro c_yellow #F0E14C
#macro h_green 80
#macro h_yellow 40
#macro h_cyan 114
#macro h_orange 25
#macro h_blue 140
#macro h_pink 235
#macro h_red 0
#macro h_purple 190
#macro c cpp()
#macro kys instance_destroy()
#macro NOW {instance_destroy() exit}
#macro iterate for (i=0; i<array_length(
#macro to );i++)
#macro read for (var i=1; i<=string_length(
#macro out );i++)
#macro double for (j=0; j<array_length(array_get(
#macro gamble , i));j++)
#macro triple for (k=0; k<array_length(array_get(
#macro trouble , j));k++)
#macro get_arguments \
var argcounter; \
var arguments = []; \
for (argcounter=0; argcounter<argument_count; argcounter++) { \
arguments[argcounter] = argument[argcounter]; \
} \
c_null
//its normal.

#macro drawto \
for (;; {surface_reset_target(); break}) \
	for (;; break) { \
		for (var ultrasurf;; {surface_set_target(ultrasurf); break}) \
			ultrasurf = 

#macro WIDTH 960
#macro HEIGHT 540
global.gw = WIDTH;
global.gh = HEIGHT;

function c_null() {
	//my favorite function
}
