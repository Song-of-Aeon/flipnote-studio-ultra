function shootletter(x, y, speed, direction, letter, behavior=c_null, draw_=u, additive_=false, silent=false) {
	var _bullet = noone;
	var nothingchars = [" ", "\n"];
	if !array_contains(nothingchars, letter) {
		_bullet = shoot(x, y, speed, direction, bul.letter, c_white, behavior, draw_, additive_, silent);
		_bullet.letter = letter;
	}
	return _bullet;
}