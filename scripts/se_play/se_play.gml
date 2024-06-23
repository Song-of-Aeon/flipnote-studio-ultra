global.volume = 100;
global.music = 100;
function se_play(soundeffect, pitch=1, volume=1, pitchvariation=0, timescale_bypass=false) {
	//return;  ///this shit dont work 
	pitch += random(pitchvariation*2)-pitchvariation;
	if(!audio_exists(soundeffect))
		return noone;

	var play_volume = volume * global.volume / 100;
	var play_pitch = pitch;
	

	var beep = audio_play_sound(soundeffect, 0, false, play_volume, 0, play_pitch);
	
	if(!audio_exists(beep))
		return noone;
	/*if !array_contains(o_persistent.sounds, soundeffect) {
		array_push(o_persistent.sounds, soundeffect);
	}
	if(instance_exists(o_persistent)){
		array_push(o_persistent.allSounds,
		{
			sound:beep, 
			pitch:pitch, 
			timescale_bypass:timescale_bypass
		});
	}*/
	return beep;
}

function gse_play(sound,pitch = 1,volume = 1,variation = 0) { //globalsoundeffect_play
	if typeof(sound) == "struct" {
		return se_play(sound.se, sound.pitch*pitch, sound.vol * volume, sound.variation + variation);
	} else {
		return se_play(sound, pitch,volume,variation);
	}
}

function gound(name_, vol_=.7, pitch_=1, variation_=0) constructor { //global.sound
	se = se_null;
	vol = vol_;
	pitch = pitch_;
	variation = variation_;
	path = "none selected!";
	name = name_;
	global.sounds[$name] = self;
}