munction(despawn)();
if !is_oob() && alpha > .1 && !particling {
	var guy = Particle(x, y);
	guy.color = color;
	guy.size = damage*2+2;
	guy.spd = spd/2;
	guy.dir = dir;
}