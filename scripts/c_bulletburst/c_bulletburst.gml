function c_bulletburst(color, amount=8, target=self, sound=amount>=8?se_null:se_null) {
	se_play(sound);
	var bouls = c_shootcircle(target.x, target.y, 2, irandom(359), amount, bul.particle, color, /*function() {
		alpha -= .025
		if alpha < 0 kys;
	}*/);
	with_array(bouls, function() {
		size = 4+random(2);
		/*friendly = NaN;
		alpha = .4;*/
		spd += random(1.1);
	});
	return bouls;
}