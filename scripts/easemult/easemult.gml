function easemult(animcurve, val, duration, multiplier, channel=0) {
	var dude = animcurve_get_channel(animcurve, channel);
	return animcurve_channel_evaluate(dude, cycle(val/duration, 1))*multiplier;
}

function easeclamp(animcurve, val, duration, multiplier, channel=0) {
	var dude = animcurve_get_channel(animcurve, channel);
	return animcurve_channel_evaluate(dude, clamp(val/duration, 0, 1))*multiplier;
}

//x = easemult(ac_berp, time, 2 sec, 100);

//easemult(ac_sin, count, 200, 1000);
//call_later()
//external_call()
//external_define()