//https://github.com/Demigiant/dotween/blob/develop/_DOTween.Assembly/DOTween/Core/Easing/EaseManager.cs
#macro _PiOver2 pi/2
#macro _TwoPi pi*2

function ease_in_sine(t) {
	return 1 - cos((t * pi) / 2.0);
}

function ease_out_sine(t) {
	return sin((t * pi) / 2.0);	
}

function ease_in_out_sine(t) {
	return -(cos(pi * t) - 1) / 2.0;
}

function ease_in_quad(t) {
	return t * t;
}
function ease_out_quad(t) {
	return 1 - (1 - t) * (1 - t);
}

function ease_in_out_quad(t) {
	return t < 0.5 ? 2 * t * t : 1 - power(-2 * t + 2, 2) / 2.0;
}

function ease_in_cubic(t) {
	return t * t * t;	
}

function ease_out_cubic(t) {
	return 1 - power(1 - t, 3);
}

function ease_in_out_cubic(t) {
	return t < 0.5 ? 4 * t * t * t : 1 - power(-2 * t + 2, 3) / 2.0;
}

function ease_out_bounce(t) {
	var n1 = 7.5625;
	var d1 = 2.75;

	if (t < 1 / d1) {
		return n1 * t * t;
	} 
	else if (t < 2 / d1) {
		return n1 * t * (t - (1.5 / d1)) + 0.75;
	} 
	else if (t < 2.5 / d1) {
		return n1 * t * (t  - (2.25 / d1)) + 0.9375;
	} 
	else {
		return n1 * t * (t - (2.625 / d1)) + 0.984375;
	}
}

function ease_in_bounce(t) {
	return 1 - ease_out_bounce(1 - t);
}