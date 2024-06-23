//surface_set_target(global.surfaces.HUD);
draw_set_font(font);
for (i=array_length(bg)-1; i>=0; i--) {
	draw_sprite(bg[i], count*(sprite_get_speed(bg[i])/60), 0, 0); //backgrounds, they go behind everything
}
bglogic();
for (i=array_length(talkers)-1; i>=0; i--) {
	talkers[i].draw(i);
}
//surface_reset_target();
surface_set_target(textsurf);
draw_clear_alpha(c_black, 0);
for (i=array_length(fg)-1; i>=0; i--) {
	draw_sprite(fg[i], count*(sprite_get_speed(fg[i])/60), 0, 0); //foregrounds, they go between talksprites and textbox
}
fglogic();
if !halting && !interim draw(); //the textbox draw event
for (i=array_length(sg)-1; i>=0; i--) {
	draw_sprite(sg[i], count*(sprite_get_speed(sg[i])/60), 0, 0); //supergrounds, they go in front of everything
}
sglogic();
surface_reset_target();
