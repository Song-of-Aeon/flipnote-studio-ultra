function startpattern(pattern_="Midnight Alarm") {
	var chump = scriptable_create(function() {
		pattern_.step();
		pattern_.time--;
		if pattern_.time <= 0 kys;
	}, function() {
		pattern_.draw();
	});
	chump.pattern_ = global.patterns[$pattern_];
	log(chump.pattern_);
	//pattern_.chump = chump;
	return chump;
}